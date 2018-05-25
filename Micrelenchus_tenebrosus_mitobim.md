## MITOBIM assembly for Micrelenchus tenebrosus

### Summary


I tried a couple of approaches. One was to use MITOBIM that iteratively construct an assemblym and one was to use SPADES (an assembler). MITOBIM performed much betterm SPADES had a lot of incorrect squences. You wil only find MITOBIM below.

### MITOBIM

some of the contigs makes sense, and some are weirdly overlapping. I retry MITOBIM for 15% of reads but based on the 3 sequence availables on genbanks, 16S, 12S and COI. 

```

seqtk sample -s100 trimmed_reads/2420-05-11-01_S5_L001_R1_001_TRIMMED.fastq.gz  0.15 >  Mtenebrosus/2420-05-11-01_S5_L001_R1_001_TRIMMED015.fastq 
seqtk sample -s100 trimmed_reads/2420-05-11-01_S5_L001_R2_001_TRIMMED.fastq.gz  0.15 >  Mtenebrosus/2420-05-11-01_S5_L001_R2_001_TRIMMED015.fastq
~/repos/scripts/Micrelenchus/interleave-fasta.py  Mtenebrosus/2420-05-11-01_S5_L001_R1_001_TRIMMED015.fastq  Mtenebrosus/2420-05-11-01_S5_L001_R2_001_TRIMMED015.fastq   > Mtenebrosus/2420-05-11-01_S5_L001_R2_001_TRIMMED_interleavedsub015.fastq

```



```
mkdir -p Mtenebrosus/3genes015
cd Mtenebrosus/3genes015
MITObim.pl --denovo -end 100 --pair -sample Mtenebrosus -ref refspades -readpool  ../2420-05-11-01_S5_L001_R2_001_TRIMMED_interleavedsub015.fastq --clean --quick ../../referencesformitobim/Microlenchus_tenebrosus_bait.fa
```

Works fine!