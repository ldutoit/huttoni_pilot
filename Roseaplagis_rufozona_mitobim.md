## MITOBIM assembly for Roseaplagis rufozona

###Summary


...
I tried a couple of approaches. One was to use MITOBIM that iteratively construct an assemblym and one was to use SPADES (an assembler). SPADES performed better by getting more large scaffolds but both left gaps,
...


### SPADES

Spades is a local assembler. I tried with different subset of reads but it performed best with all the reads.

```
./spades.py --pe1-1 ~/projects/Micrelenchus/trimmed_reads/2420-07-11-01_S7_L001_R1_001_TRIMMED.fastq.gz   --pe1-2 ~/projects/Micrelenchus/trimmed_reads/2420-07-11-01_S7_L001_R2_001_TRIMMED.fastq.gz   -o spadestestRrufozonai
```

### MITOBIM

I obtained a lot of contigs, I used them as. a reference for MITOBIM in an attempt to close the gaps.


I made a small with  12S, 16S and COI available on GENBANK in referencesformitobim/Roseaplagis_rufozona_bait.fa



```
mkdir -p Rrufozonai/3genesref015
seqtk sample -s100 trimmed_reads/2420-07-11-01_S7_L001_R1_001_TRIMMED.fastq.gz  0.15 >  Rrufozonai/2420-07-11-01_S7_L001_R1_001_TRIMMED015.fastq 
seqtk sample -s100 trimmed_reads/2420-07-11-01_S7_L001_R2_001_TRIMMED.fastq.gz  0.15 >  Rrufozonai/2420-07-11-01_S7_L001_R2_001_TRIMMED015.fastq
~/repos/scripts/Micrelenchus/interleave-fasta.py  Rrufozonai/2420-07-11-01_S7_L001_R1_001_TRIMMED015.fastq  Rrufozonai/2420-07-11-01_S7_L001_R2_001_TRIMMED015.fastq   > Rrufozonai/2420-07-11-01_S7_L001_R2_001_TRIMMED_interleavedsub015.fastq

```
```
mkdir -p Rrufozonai/3genesref015
cd Rrufozonai/3genesref015
MITObim.pl --denovo -end 100 --pair -sample Rrufozonai -ref refspades -readpool  ../2420-07-11-01_S7_L001_R2_001_TRIMMED_interleavedsub015.fastq --clean --quick ../../referencesformitobim/Roseaplagis_rufozona_bait.fa
```


This is better:

```
readpool contains 24754 reads
assembly contains 21 contig(s)
min contig length: 200 bp
max contig length: 8954 bp
avg contig length: 1357 bp
find details on individual contigs in: /gpfs1m/projects/uoo00116/projects/Micrelenchus/Rrufozonai/3genesref015/iteration40/Rrufozonai-refspades_assembly/Rrufozonai-refspades_d_info/Rrufozonai-refspades_info_contigstats.txt
```

I annotate the four biggest scaffold with mitos2.

Two contigs are empty of meaningful annotations.

The other 2:

[MITOS](figure_cache/Rrufozonairefspadesc2.png)
[MITOS](figure_cache/Rrufozonairefspadesc3.png)
