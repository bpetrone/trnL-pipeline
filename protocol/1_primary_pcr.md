# Protocol 1: Primary qPCR (trnL)

## Materials
- [ ] KAPA HiFi Hot Start PCR kit (KAPA KK2502)
- [ ] 10µM working stock of *trnL*-P6 forward primer with Illumina bridges 
- [ ] 10µM working stock of *trnL*-P6 reverse primer with Illumina bridges
- [ ] SYBR Green I - diluted in DMSO to 100x
- [ ] Extracted DNA from stool sample 
- [ ] Positive control template DNA
- [ ] Nuclease-free H<sub>2</sub>O

## Protocol
**Location:** PCR hood or separate room/area from other steps.
- [ ] Treat PCR area with UV light for ~15 minutes.
- [ ] Generate enough PCR master mix for the reactions desired according to **Table 1**. Note: The reaction mix and plate must be kept on ice; otherwise, the exonuclease in the enzyme can degrade the primers prior to the start of the reaction. Leave the polymerase in the freezer until use.
- [ ] Aliquot 7 µl mix into each well.
- [ ] Add 3 ul water to negative control well.
- [ ] Add 3 µl of DNA template to sample wells.
- [ ] Add 3 ul control DNA to positive control well.
- [ ] Seal plate with optical film.
- [ ] Briefly spin down the plate (30 seconds at 1K rpm in bench-top centrifuge).  
- [ ] Run qPCR with cycling conditions from **Table 2**.
- [ ] After qPCR run is done, transfer plates to -20˚C if processing is going to be paused.  Otherwise, keep plates at 4˚C.  
- [ ] Inspect qPCR curves to confirm amplification and/or run 5 ul on an agarose gel or E-gel to confirm a single band of expected size.
- [ ] Proceed to [Protocol 2: 
Dilution](https://github.com/bpetrone/trnL-pipeline/edit/master/protocol/2_dilution.md)

**Table 1. Primary PCR Master Mix**
| Component	| 1 Rxn (µL) | 100 Rxns (µL) |
| ----------|------------|-------------- |
| Nuclease-free H_2O	| 3.5 | 350 |
| 10 µM Forward primer	| 0.5	| 50 |
| 10 µM Reverse primer	| 0.5	| 50 |
| 5x KAPA HiFi Buffer	| 2	| 200 |
| 10 mM dNTPs	| 0.3 |	30 |
| 100x SYBR Green	| 0.1	| 10 |
| KAPA HiFi polymerase	| 0.1	| 10 |
| **Total**	| **7.0**	| **700**|

**Table 2. Primary PCR Amplification Parameters**
| Cycle |	Temperature (˚C)  | Time |
| ------|-------------------|------ |
| Initial Denaturation   |	95	| 3 min |
| 35 cycles: |
| Denature | 98˚C | 20 sec |
| Anneal | 63˚C	| 15 sec |
| Extend | 72˚C | 15 sec |
| Holding	| 4˚C	Hold | For ever |
