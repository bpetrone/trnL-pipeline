## Demultiplexing

### bcl2fastq

`demux-barcodes.sh` is an example bash script for creating demultiplexed FASTQ files from raw Illumina *trnL* sequencing data using Illumina's bcl2fastq conversion software.  

The script takes as input two pieces of information:
  - a path to an Illumina raw data directory (usually named in the style of `200221_MN00462_0116_A000H32MGK/`, indicating the run date, instrument number, etc)
  - a sample sheet that contains the barcode sequences for demultiplexing.  

Guidelines for formatting a sample sheet are available [here](https://www.illumina.com/content/dam/illumina-marketing/documents/products/technotes/sequencing-sheet-format-specifications-technical-note-970-2017-004.pdf).
