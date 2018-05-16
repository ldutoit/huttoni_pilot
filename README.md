d# Micrelenchus

## Description

### Overview

Micrelenchus is a genus of molluscs with lately unexpected phylogenetics relationships (Donald et al. 206, MPE). We have data for 4 species including outgroup).


### Key Players

Kirsten Donald 
Hamish Spencer

### What are my objectives ?

My objectives are to assemble and align mitochondria from 4 species so that Kirsten can do phylogenetics trees from them. 

The data is Illumina from PCR amplified mitochondria for 4 species. I can try to assemble them on their own. There is also one extra reference assembly from a collaborator for Micrelencus tesselatus (=Cantharidus.tesselatus.fasta).
 
### Physical location of the data

For now google drive:

https://drive.google.com/open?id=1lm0Reobp36_OcAq6geeWgNYy9rXo9BVA


### Source files
There is an excel sheet:*NGS project explanation for Ludo.xls* saying which species is which sample. Careful, some samples in the source data are for other projects.
  
The data  includes assembly done upstream with *Edena* as well as the raw reads in *NZGL02420P2* and a reference assembly 
of  the Mitochondria done in another lab for Micrelencus tesselatus (=Cantharidus.tesselatus.fasta).
  

## Analyses

### 1. cleaning

The cleaning is done with *trimming_PE.sh* using the bbmap suite.


### 2. MITOBIM mitochondrial assembliesfor the four species from a COI

We first identified bait sequences from NCBI to be able to run MITOBIM on it, a software creating an assembly by iterative mapping to a reference that updates itself. We were able to retrieve partial or complete sequences for COI, 12S rRNA and 16S rRNA for the four species ( see ref in listofseqforbaiting.md).

Then we ran mitobim on each of them using similar but independent procedures, described in the files:

Micrelenchus_tesselatus_mitobim.md
Micrelenchus_tenebrosus_mitobim.md
Micrelenchus_huttonii_mitobim.md
Roseaplagis_rufozona_mitobim.md



### 3. remapping to the best of the MITOBIM results and checking coverage of mapping
### 4. alignment with muscle, check for both 2 and 3 extract the best results



