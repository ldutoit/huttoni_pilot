## MITOBIM assembly for Micrelenchus tesselatus

### Summary


I tried a couple of approaches. One was to use MITOBIM that iteratively construct an assemblym and one was to use SPADES (an assembler). MITOBIM performed much betterm SPADES had a lot of incorrect squences. You wil only find MITOBIM below.

### MITOBIM

some of the contigs makes sense, and some are weirdly overlapping. I retry MITOBIM for 15% of reads but based on the 3 sequence availables on genbanks, 16S, 12S and COI.



```
mkdir -p Rrufozonai/3genesref015
seqtk sample -s100 trimmed_reads/2420-07-11-01_S7_L001_R1_001_TRIMMED.fastq.gz  0.15 >  Rrufozonai/2420-07-11-01_S7_L001_R1_001_TRIMMED015.fastq 
seqtk sample -s100 trimmed_reads/2420-07-11-01_S7_L001_R2_001_TRIMMED.fastq.gz  0.15 >  Rrufozonai/2420-07-11-01_S7_L001_R2_001_TRIMMED015.fastq
~/repos/scripts/Micrelenchus/interleave-fasta.py  Rrufozonai/2420-07-11-01_S7_L001_R1_001_TRIMMED015.fastq  Rrufozonai/2420-07-11-01_S7_L001_R2_001_TRIMMED015.fastq   > Rrufozonai/2420-07-11-01_S7_L001_R2_001_TRIMMED_interleavedsub015.fastq

```


```
mkdir -p Rrufozonai/3genes015
cd Rrufozonai/3genes015
MITObim.pl --denovo -end 100 --pair -sample Rrufozonai -ref refspades -readpool  ../2420-07-11-01_S7_L001_R2_001_TRIMMED_interleavedsub015.fastq --clean --quick ../../referencesformitobim/Roseaplagis_rufozona_bait.fa
```

Works fine!


