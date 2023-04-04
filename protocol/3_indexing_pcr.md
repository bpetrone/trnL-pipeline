# Protocol 4: Indexing PCR

## Materials
- [ ] KAPA HiFi Hot Start PCR kit (KAPA KK2502)
- [ ] Pre-mixed Illumina-compatible barcoding primers, 2.5 uM each primer, 5 uM total (Ordered from IDT, diluted and mixed in-house)
- [ ] SYBR Green I - diluted in DMSO to 100x
- [ ] Primary PCR-amplified template diluted 1:100 from [Protocol 3: Dilution](https://github.com/bpetrone/mb-pipeline/blob/master/protocols/3_dilution.md), including any positive and negative controls
- [ ] Nuclease-free H<sub>2</sub>O

## Protocol
**Location:** PCR hood or separate room/area from other steps.
- [ ] Treat PCR area with UV light for ~15 minutes.
- [ ] Generate enough PCR master mix for the reactions desired according to **Table 3**. Mix gently. Note: The reaction mix and plate must be kept on ice; otherwise, the exonuclease in the enzyme can degrade the primers prior to the start of the reaction. 
- [ ] Aliquot 35 µl mix into each well.
- [ ] Add 10 ul premixed barcoding oligos to each well.
- [ ] Add 5 ul 1:100 dilution of primary PCR products.
- [ ] Seal plate with optical film.
- [ ] Briefly spin down the plate (30 seconds at 1K rpm in bench-top centrifuge).  
- [ ] Run qPCR with cycling conditions from **Table 4**.
- [ ] After qPCR run is done, transfer plates to -20˚C if processing is going to be paused.  Otherwise, keep plates at 4˚C.  
- [ ] Inspect qPCR curves and/or run 5 ul on an agarose gel or E-gel to confirm amplification.

**Table 3. Primary PCR Master Mix**
Component	| 1 Rxn (µL) | 100 Rxns (µL) 
----------|------------|--------------
Nuclease-free H_2O	| 22.5 | 2250
5x KAPA HiFi Buffer	| 10	| 1000
10 mM dNTPs	| 1.5 |	150
100x SYBR Green	| 0.5	| 50
KAPA HiFi polymerase	| 0.5	| 50
**Total**	| **35**	| **3500**

**Table 4. Indexing PCR Amplification Parameters**
Cycle |	Temperature (˚C)  | Time
------|-------------------|------
Initial Denaturation   |	95	| 5 min
10 cycles:
Denature | 98˚C | 20 sec
Anneal | 55˚C	| 15 sec
Extend | 72˚C | 30 sec
Holding	| 4˚C	Hold | For ever
