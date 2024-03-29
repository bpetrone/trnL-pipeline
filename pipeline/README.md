## Computational pipeline

This directory contains a description, code, and example dataset that describe the procedure for analyzing *trnL*-P6 amplicon sequencing libraries generated using the primers *trnL*(UAA)*g* and *trnL*(UAA)*h*) from [Taberlet *et al.*, 2006](https://dx.doi.org/10.1093/nar/gkl938). These scripts produce, from demultiplexed paired-end sequencing data, a table of *trnL* sequence variants and their counts in each sample.  Additional details are described below. 

### Requirements

-   [QIIME2](https://qiime2.org) (this code developed with version 2022.8). For
    installation instructions, see the [QIIME2
    documentation](https://docs.qiime2.org/2022.8/install/)
-   [DADA2](https://benjjneb.github.io/dada2/index.html) (this code developed with version 1.26.0)

### Inputs

-   Demultiplexed, paired-end Illumina sequencing data produced with
    [bcl2fastq](https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software.html). *Have raw Illumina data that's not yet demultiplexed?* See [demultiplexing](https://github.com/bpetrone/trnL-pipeline/tree/master/pipeline/demultiplexing) for an example script to create a folder of demultiplexed files.

### Analysis strategy

The overall steps of the pipeline are

1.  Read in data as a QIIME2 artifact
2.  Trim off non-biological nucleotides (*i.e.*, primers and adapters) from the reads
3.  Denoise the reads to produce *trnL* amplicon sequence variants (ASVs)
4.  Make a feature table

### Outputs

Given a `FOLDER` containing the demultiplexed FASTQ input files, these scripts will produce a new directory named `FOLDER_output` containing the following files, which are preceded by a number indicating their stage in the pipeline:

- 1: Raw data
     - 1_demultiplexed.qza
     - 1_demultiplexed.qzv
- 2: Adapter trimmed data
     - 2_adapter-trimmed.qza
     - 2_adapter-trimmed.qzv
     - 2_adapter-trimmed.txt
- 3: *trnL* primer trimmed data
     - 3_primer-trimmed.qza
     - 3_primer-trimmed.qzv
     - 3_primer-trimmed.txt
- 4: Denoised and tabulated data
     - 4_denoised-seqs.qza
     - 4_denoised-stats.qza
     - 4_denoised.txt
     - 4_feature-table.tsv 

QZA files are [QIIME2 artifacts](https://docs.qiime2.org/2022.8/concepts/#data-files-qiime-2-artifacts), or compressed files containing both the data generated at the corresponding stage of the pipeline and metadata about its type, format, and the commands that generated it.
QZV files are [visualizations](https://docs.qiime2.org/2022.8/concepts/#data-files-visualizations) of the information contained in artifacts.  They're readily examined using the [QIIME2 View](https://view.qiime2.org) tool.

An example dataset of 20 samples is provided in [example-data/](https://github.com/bpetrone/trnL-pipeline/tree/master/pipeline/example-data) that can be worked through the pipeline either on the command line as shown below, interactively using the [R notebook tutorial](https://github.com/bpetrone/trnL-pipeline/blob/master/pipeline/Tutorial.Rmd), or with a single bash script [`trnL-pipeline.sh`](https://github.com/bpetrone/trnL-pipeline/blob/master/pipeline/trnL-pipeline.sh). Note that working interactively on a personal computer (1.4 GHz quad-core Intel i5 processor, 8GB RAM) each of the pipeline steps takes ~1-2 minutes to run.  

### Tutorial

#### Setup

We'll work through the pipeline on the example dataset.  Clone this repository, then `cd` into the directory containing the example data.  You should be able to see the demultiplexed files with `ls`:
```
1-A03_S17_L001_R1_001.fastq.gz
1-A03_S17_L001_R2_001.fastq.gz
1-B08_S53_L001_R1_001.fastq.gz
1-B08_S53_L001_R2_001.fastq.gz
1-C03_S19_L001_R1_001.fastq.gz
1-C03_S19_L001_R2_001.fastq.gz
...
```
We'll begin by making a directory for the output. The following commands save the current directory as a variable, make an output directory by appending `_output` to the end of its name, and then go to the new output directory (from which all the following commands will be run).
```
INPUT=$(pwd) 
cd ..
mkdir ${INPUT##*/}_output 
cd ${INPUT##*/}_output 
```

Now, we'll begin working through the pipeline in QIIME2.  You'll need to activate your QIIME2 environment, which may differ in name from the example here.  You can check the name of the environment by running `conda env list`. Activate the environment by running: 
```
conda activate qiime2-2022.8
```
#### Import data

First, we'll import the demultiplexed sequencing files as a QIIME2 artifact.
```
qiime tools import \
     --type 'SampleData[PairedEndSequencesWithQuality]' \
     --input-path $INPUT \
     --input-format CasavaOneEightSingleLanePerSampleDirFmt \
     --output-path 1_demultiplexed.qza
     
qiime demux summarize \
  --i-data 1_demultiplexed.qza \
  --o-visualization 1_demultiplexed.qzv
```

#### Trim adapter

Next, we'll trim read-through into the Illumina sequencing adapter. This will happen to varying degrees depending on the length of the particular *trnL* amplicon and the number of sequencing cycles performed.  In our food plant reference, the shortest *trnL* sequences come from taxa including cocoyams (*Xanthosoma spp.*), melons (*Cucumis melo*), konjac (*Amorphophallus konjac*), and herbs like oregano, sage, and thyme (*Origanum vulgare*, *Salvia officinalis*, and *Thymus vulgaris*), which all have a *trnL*-P6 sequence between 59-61 bp in length. As a result, even very short sequencing reads of 75 bp  will extend through the full amplicon and off the end into the adapter.  

```
qiime cutadapt trim-paired \
     --i-demultiplexed-sequences 1_demultiplexed.qza \
     --p-adapter-f CTGTCTCTTATACACATCT \
     --p-adapter-r CTGTCTCTTATACACATCT \
     --verbose \
     --o-trimmed-sequences 2_adapter-trimmed.qza \
     &> 2_adapter-trimmed.txt

qiime demux summarize \
  --i-data 2_adapter-trimmed.qza \
  --o-visualization 2_adapter-trimmed.qzv
```

#### Trim primers

```
qiime cutadapt trim-paired \
     --i-demultiplexed-sequences 2_adapter-trimmed.qza \
     --p-adapter-f ^GGGCAATCCTGAGCCAA...GATAGGTGCAGAGACTCAATGG \
     --p-adapter-r ^CCATTGAGTCTCTGCACCTATC...TTGGCTCAGGATTGCCC \
     --p-error-rate 0.15 \
     --p-minimum-length 1 \
     --p-overlap 5 \
     --p-discard-untrimmed \
     --verbose \
     --o-trimmed-sequences 3_primer-trimmed.qza \
     &> 3_primer-trimmed.txt
     
qiime demux summarize \
  --i-data 3_primer-trimmed.qza \
  --o-visualization 3_primer-trimmed.qzv
```

#### Denoise sequences with DADA2

```
qiime dada2 denoise-paired \
     --i-demultiplexed-seqs 3_primer-trimmed.qza \
     --p-trunc-len-f 0 \
     --p-trunc-len-r 0 \
     --p-max-ee-f 2 \
     --p-max-ee-r 2 \
     --p-trunc-q 2 \
     --p-min-overlap 12 \
     --p-pooling-method 'independent' \
     --verbose \
     --o-table 4_denoised-table.qza \
     --o-representative-sequences 4_denoised-seqs.qza \
     --o-denoising-stats 4_denoised-stats.qza \
     &> 4_denoised.txt
 ```

#### Make feature table

This formats the data as a sequence table (samples x ASVs), where each ASV is identified with a unique hash.
```
qiime metadata tabulate \
     --m-input-file 4_denoised-table.qza \
     --o-visualization 4_denoised-table.qzv
```

This creates a mapping from the unique hash above to the ASV's biological sequence.
```
qiime feature-table tabulate-seqs \
     --i-data 4_denoised-seqs.qza \
     --o-visualization 4_denoised-seqs.qzv
```

At this point, even large datasets are manageable enough in size to work with locally.  The sequence table can be read in and further processed using the `Pipeline to phyloseq` R Markdown notebook.  
