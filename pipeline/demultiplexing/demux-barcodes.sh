#!/bin/bash

# Usage: demux-barcode.sh /path/to/illumina-data /path/to/samplesheet.csv 
cd $1
now=$(date +'%Y%m%d')
outdir=$now'_results'
mkdir $outdir

# Demultiplex
# How bcl2fastq is sourced will depend on your computing enviornment
# Here, loaded as a module:
module load bcl2fastq
bcl2fastq -o $outdir --interop-dir InterOp/$now --stats-dir Stats/$now --reports-dir Reports/$now --minimum-trimmed-read-length 0 --mask-short-adapter-reads 0 --sample-sheet $2

