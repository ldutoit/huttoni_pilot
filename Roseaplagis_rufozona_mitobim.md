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

