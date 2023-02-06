This directory contains files used to produce, contain, and describe the reference database of *trnL* sequences used for taxonomic assignment of sequencing reads. These include
- `human-foods.csv`: A list of food taxa submitted as queries to NCBI to produce the reference database
- `trnLGH.fasta`: The generated reference sequence database as a FASTA file

The taxonomic rank to which a *trnL* amplicon sequence variant (ASV) can be assigned depends on the number of plant taxa that happen to share that particular *trnL* sequence and how closely related they are.  Currently, our practice is to assign a *trnL* ASV to the taxon that represents the last common ancestor of all the reference sequences it matches with 100% identity: for example, the *trnL* ASV ATCCGTGTTTTGAGAAAACAAGGGGTTCTCGAACTAGAATACAAAGGAAAAG exactly matches both wheat (*Triticum aestivum*) and rye (*Secale cereale*), and is assigned to the lowest taxonomic rank shared between them, which is the family Poaceae.  Of all *trnL* sequence variants that can be identified by the reference, the prorportion of assignments to a given taxonomic rank is shown below. 

|  	  | Family | Genus | Species |
| --- | --- | --- | --- |
| % assigned	| 99.3 | 92.6 | 99.3 |
