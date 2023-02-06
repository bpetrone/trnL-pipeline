## Computational pipeline

These scripts produce, from paired-end demultiplexed Illumina sequencing data, a results directory containing the following files, grouped by their pipeline stage:

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

### Requirements

-   Demultiplexed, paired-end Illumina sequencing data produced with
    [bcl2fastq](https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software.html).
-   [QIIME2](https://qiime2.org) (current distribution 2022.8). For
    installation instructions, see the [QIIME2
    documentation](https://docs.qiime2.org/2022.8/install/)
-   [DADA2](https://benjjneb.github.io/dada2/index.html).

### Tutorial

The overall steps of the pipeline are

1.  Read in data as a QIIME2 artifact
2.  Trim off non-biological nucleotides (*i.e.*, primers and adapters)
    from the reads
3.  Denoise the reads to produce *trnL* amplicon sequence variants
    (ASVs)
4.  Make a feature table
5.  Assign taxonomy
