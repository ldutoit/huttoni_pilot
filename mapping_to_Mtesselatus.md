

## Part 1 : Is mapping to Mtesselatus a viable option?


**Mapping**

```
reference="/home/ludovic.dutoit/repos/scripts/huttoni_pilot/output_files/consensusMtesselatusNOEDGESCOMBINED.fa"
mkdir mappintgtotesselatus
cd mappintgtotesselatus/
module load SAMtools picard BWA
cp $reference .
ref=$(basename $reference) # not the full path
samtools faidx $ref #indexing reference
java -jar $PICARD CreateSequenceDictionary R= $ref O=$ref.dict

bwa index -a is $ref  
bwa mem   $ref ../trimmed_reads/1R1_TRIMMED.fastq  ../trimmed_reads/1R2_TRIMMED.fastq > test.sam
test.sam
samtools sort  test.sam | samtools view  -Sb - > test.bam 
```
I now have this test.bam file that contains the maping of our huttoni data to M. tesselatus mitogenome. Let's look at how much is mapping:

```
samtools flagstat test.bam 

#1938638 + 0 in total (QC-passed reads + QC-failed reads)
#0 + 0 secondary
#0 + 0 supplementary
#0 + 0 duplicates
#623 + 0 mapped (0.03% : N/A)
#1938638 + 0 paired in sequencing
#969319 + 0 read1
#969319 + 0 read2
#410 + 0 properly paired (0.02% : N/A)
#618 + 0 with itself and mate mapped
#5 + 0 singletons (0.00% : N/A)
#6 + 0 with mate mapped to a different chr
#6 + 0 with mate mapped to a different chr (mapQ>=5)
```

A mere 0.02% is mapping, suggesting that 0.02% of the mapping is mitochondrial.

How much coverage does this represent

```
samtools depth test.bam  -a -> depth.txt
```

let's lok at this depth in R

```
#IN R
quantile(read.table("depth.txt",h=F)[,3],seq(0,1,0.05))
 0%   5%  10%  15%  20%  25%  30%  35%  40%  45%  50%  55%  60%  65%  70%  75%
   0    2    3    3    4    5    5    5    6    6    6    7    7    7    8    8
 80%  85%  90%  95% 100%
   9    9   10   11   19
 summary(read.table("depth.txt",h=F)[,3])
mean(read.table("depth.txt",h=F)[,3])
 6.508318
```

An average coverage of: 6.5

SAY SOIMETHING ABOUT HOW MUCH MORE WE WANT

I THINK FOR EVERY POSITION THAT IS VARIABLE ACROSS SAMPLES WE WILL CHECK WHICH SAMPLE DON T HAVE a coverage of 2 and put is an N. It might depends a bit on how many sites are variable. 

If many sites are variable I guess we can afford a coverage of 6.5. Otherwise we might want a higher coverage. Ar eother species more closely related?


## Part 2, how much variation?


We will look at that by making a consensus we compare to our tesselatus reference:
**make consensus..**


``` 
java -jar -Xms128m -Xmx128m  $PICARD MarkDuplicates INPUT=test.bam OUTPUT=test.rmdup.bam METRICS_FILE=test.rmdup2.txt REMOVE_DUPLICATES=true VALIDATION_STRINGENCY=LENIENT MAX_RECORDS_IN_RAM=1 TMP_DIR="temp"
ln -s /opt/nesi/mahuika/BCFtools/1.8-gimkl-2017a/bin/vcfutils.pl . # get bcftools
samtools mpileup -uf $ref test.rmdup.bam | bcftools call   --ploidy 1  -mv -Oz -o calls.vcf.gz
tabix calls.vcf.gz
cat $ref| bcftools consensus calls.vcf.gz > consensus.fa
rm sorted.rmdup.bam sorted.bam calls.vcf.gz
unlink vcfutils.pl
```

We can check how many snps we have between these two.

```
less calls.vcf.gz | grep "^#" -v | wc -l
#229
```
I rhen downloade both consensus.fa and the original sequence, and align them contig by contig to verify ~98.5% similarity between the two species.


Aligning everything back to Mtesselatus with a coverage of 6.5 is defo a viable option.

