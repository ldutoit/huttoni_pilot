## Description

### Overview

Micrelenchus huttoni mitogenomics. We have one species 2x150bp. This is a modified version of https://github.com/ldutoit/Micrelenchus applied to Micrelenchus huttoni alone. We want to know how much data we need for any given sample to get an accurate picture of the reference mitochondria.


### Key Players

Kirsten Donald 
Hamish Spencer

 
### Physical location of the data


Source files archived on hcs:

storage.hcs-p01.otago.ac.nz/sci-bioinformatics-project-archive


  
### Important files


The consensus for our data mapped to M. tesselatus:
[output_files/consensusHuttonimapped.fa](output_files/consensusHuttonimapped.fa)

The reference *M.tesselatus* [output_files/consensusMtesselatusNOEDGESCOMBINED.fa](output_files/consensusMtesselatusNOEDGESCOMBINED.fa)


## Analyses Description

### 1. cleaning

The cleaning is done with *trimming_PE.sh* using Trimmomatic.


### 2. Mapping to M tesselatus.

After briefly trying mitobim, I chose to map the read to *M. tesselatus* for which we have a mitochondrial assembly in 2 contigs.

It is all described in [mapping_to_Mtesselatus.md](mapping_to_Mtesselatus.md).

It mapped well we over 98% similarity. Leaving us with 229 SNPs and a mean depth of 6.5. It seems like this is an adequate sampling scheme to go further.

