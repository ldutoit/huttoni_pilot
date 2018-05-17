## MITOBIM assembly for Micrelenchus huttonii

###Summary


...
I tried a couple of approaches. One was to use MITOBIM that iteratively construct an assemblym and one was to use SPADES (an assembler). SPADES performed better by getting more large scaffolds but both left gaps,
...


### SPADES

Spades is a local assembler. I tried with different subset of reads but it performed best with all the reads.

```
./spades.py --pe1-1 ~/projects/Micrelenchus/trimmed_reads/2420-06-11-01_S6_L001_R1_001_TRIMMED.fastq.gz   --pe1-2 ~/projects/Micrelenchus/trimmed_reads/2420-06-11-01_S6_L001_R2_001_TRIMMED.fastq.gz   -o spadestestMhuttonii
```


###MITOBIM

I obtained a lot of contigs, I used them as. a reference for MITOBIM in an attempt to close the gaps.

first I subsample the reads to 5% of the original files because MITOBIM does not work:


```
mkdir -p  Mhuttonii/spaderef

seqtk sample -s100 trimmed_reads/2420-06-11-01_S6_L001_R1_001_TRIMMED.fastq.gz  0.05 >  Mhuttonii/2420-06-11-01_S6_L001_R1_001_TRIMMED0005.fastq 
seqtk sample -s100 trimmed_reads/2420-06-11-01_S6_L001_R2_001_TRIMMED.fastq.gz  0.05 >  Mhuttonii/2420-06-11-01_S6_L001_R2_001_TRIMMED0005.fastq
~/repos/scripts/Micrelenchus/interleave-fasta.py  Mhuttonii/2420-06-11-01_S6_L001_R1_001_TRIMMED0005.fastq  Mhuttonii/2420-06-11-01_S6_L001_R2_001_TRIMMED0005.fastq   > Mhuttonii/2420-06-11-01_S6__TRIMMED0005.fastq-01_S27_L005_R1_001_TRIMMED_interleavedsub005.fastq

```

I took the 10 first nodes/scaffolds of the spades assembly and use them as a reference for MITOBIM by putting them in a file reffromspades/Mhuttonii_10first.fa 


```
cd Mhuttonii/spaderef
MITObim.pl --denovo -end 100 --pair -sample Mhuttonii -ref refspades -readpool  ../2420-06-11-01_S6__TRIMMED0005.fastq-01_S27_L005_R1_001_TRIMMED_interleavedsub005.fastq --clean --quick ../../reffromspades/Mhuttonii_10first.fa 
```

The result is not that great. 1 scaffold of ~9000bp and 1 of ~1500bp

**Try2 from UCI**

I made a small with  12S, 16S and COI available on GENBANK in referencesformitobim/Microlenchus_huttonii_bait.fa



```

seqtk sample -s100 trimmed_reads/2420-06-11-01_S6_L001_R1_001_TRIMMED.fastq.gz  0.15 >  Mhuttonii/2420-06-11-01_S6_L001_R1_001_TRIMMED015.fastq 
seqtk sample -s100 trimmed_reads/2420-06-11-01_S6_L001_R2_001_TRIMMED.fastq.gz  0.15 >  Mhuttonii/2420-06-11-01_S6_L001_R2_001_TRIMMED015.fastq
~/repos/scripts/Micrelenchus/interleave-fasta.py  Mhuttonii/2420-06-11-01_S6_L001_R1_001_TRIMMED015.fastq  Mhuttonii/2420-06-11-01_S6_L001_R2_001_TRIMMED015.fastq   > Mhuttonii/2420-06-11-01_S6_L001_R2_001_TRIMMED_interleavedsub015.fastq

```
```
mkdir -p Mhuttonii/3genesref015
cd Mhuttonii/3genesref015
MITObim.pl --denovo -end 100 --pair -sample Mhuttonii -ref refspades -readpool  ../2420-06-11-01_S6_L001_R2_001_TRIMMED_interleavedsub015.fastq --clean --quick ../../referencesformitobim/Microlenchus_huttonii_bait.fa
```