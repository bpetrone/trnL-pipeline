## Computational pipeline

This directory contains a description, code, and example dataset that describe the procedure for analyzing *trnL*-P6 amplicon sequencing libraries generated using the primers *trnL*(UAA)*g* and *trnL*(UAA)*h*) from [Taberlet *et al.*, 2006](https://dx.doi.org/10.1093/nar/gkl938). These scripts produce, from demultiplexed paired-end sequencing data, a table of *trnL* sequence variants, their counts in each sample, and their taxonomic assignment.  Additional details are described below. 

### Requirements

-   [QIIME2](https://qiime2.org) (current distribution 2022.8). For
    installation instructions, see the [QIIME2
    documentation](https://docs.qiime2.org/2022.8/install/)
-   [DADA2](https://benjjneb.github.io/dada2/index.html).

### Inputs

-   Demultiplexed, paired-end Illumina sequencing data produced with
    [bcl2fastq](https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software.html). *Have raw Illumina data that's not yet demultiplexed?* See [demultiplexing](TBD) for an example script to create a folder of demultiplexed files.

### Analysis strategy

The overall steps of the pipeline are

1.  Read in data as a QIIME2 artifact
2.  Trim off non-biological nucleotides (*i.e.*, primers and adapters) from the reads
3.  Denoise the reads to produce *trnL* amplicon sequence variants (ASVs)
4.  Make a feature table
5.  Assign taxonomy

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

An example dataset of 20 samples is provided in [example-data/]() that can be worked through the pipeline either on the command line as shown below, or interactively using the [R notebook tutorial](ADD LINK XX).

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
We'll begin by making a directory for the output. 
```
INPUT=$(pwd) # Save the current directory as a variable
mkdir ${INPUT##*/}_output # Make an output directory with the suffix "_output"
cd ${INPUT##*/}_output # Go to that directory
```
Now, we'll begin working through the pipeline in QIIME2.  You'll need to activate your QIIME2 environment, which may differ in name from the example here.  You can check the name of the environment by running `conda env list`. Activate the environment by running: 
```
conda activate qiime2-2022.8
```
#### Import data

#### Trim adapter

#### Trim primers

#### Denoise sequences with DADA2

#### Make feature table

##### Assign taxonomy
