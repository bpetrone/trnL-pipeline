This directory contains the reference database of *trnL* sequences used for taxonomic assignment of *trnL* sequencing reads, `trnLGH.fasta` as a FASTA file.

The current version of the reference contains **791 *trnL* sequences** across **468 food plant species**. 

The taxonomic rank to which a *trnL* amplicon sequence variant (ASV) can be assigned depends on the number of plant taxa that happen to share that particular *trnL* sequence and how closely related they are.  Currently, our practice is to assign a *trnL* ASV to the taxon that represents the last common ancestor of all the reference sequences it matches with 100% identity: for example, the *trnL* ASV ATCCGTGTTTTGAGAAAACAAGGGGTTCTCGAACTAGAATACAAAGGAAAAG exactly matches both wheat (*Triticum aestivum*) and rye (*Secale cereale*), and is assigned to the lowest taxonomic rank shared between them, which is the family Poaceae.  Of all *trnL* sequence variants that can be identified by the reference, the prorportion of assignments to a given taxonomic rank is shown below:

|  	  | Family | Genus | Species |
| --- | --- | --- | --- |
| ASV assignment	| 99.3% | 92.6% | 83.2% |

Some quick descriptive statistics of the current version of the reference database (sequence length and GC content distributions): 
<p float="left">
  <img src="https://user-images.githubusercontent.com/8173170/223142473-3ce2a064-be39-45a8-93a9-5c4b4ee86178.png" width="300" height="300" />
  <img src="https://user-images.githubusercontent.com/8173170/223142498-2f7982ed-1916-446d-aaae-fee805164c52.png" width="300" height="300" />
</p>
