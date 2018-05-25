## MITOBIM assembly for Micrelenchus huttonii

### Summary


I tried a couple of approaches. One was to use MITOBIM that iteratively construct an assemblym and one was to use SPADES (an assembler). MITOBIM performed much betterm SPADES had a lot of incorrect squences. You wil only find MITOBIM below.
...




### MITOBIM

I made a small reference with  12S, 16S and COI available on GENBANK in referencesformitobim/Microlenchus_huttonii_bait.fa




```

seqtk sample -s100 trimmed_reads/2420-06-11-01_S6_L001_R1_001_TRIMMED.fastq.gz  0.15 >  Mhuttonii/2420-06-11-01_S6_L001_R1_001_TRIMMED015.fastq 
seqtk sample -s100 trimmed_reads/2420-06-11-01_S6_L001_R2_001_TRIMMED.fastq.gz  0.15 >  Mhuttonii/2420-06-11-01_S6_L001_R2_001_TRIMMED015.fastq
~/repos/scripts/Micrelenchus/interleave-fasta.py  Mhuttonii/2420-06-11-01_S6_L001_R1_001_TRIMMED015.fastq  Mhuttonii/2420-06-11-01_S6_L001_R2_001_TRIMMED015.fastq   > Mhuttonii/2420-06-11-01_S6_L001_R2_001_TRIMMED_interleavedsub015.fastq

```


```
mkdir -p Mhuttonii/3genes015
cd Mhuttonii/3genes015
MITObim.pl --denovo -end 100 --pair -sample Mhuttonii -ref refspades -readpool  ../2420-06-11-01_S6_L001_R2_001_TRIMMED_interleavedsub015.fastq --clean --quick ../../referencesformitobim/Microlenchus_huttonii_bait.fa
```

Works fine!