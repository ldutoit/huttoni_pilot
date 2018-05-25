#!/bin/sh
#Written by Ludovic dutoit, April 2018
#Make a simple consensus fastasequence using bcftools from a bam file and the reference fasta sequence on the nesi cluster
#usage: 
#MakeConsensus.sh bamfile reference output
#NOTE: this is a haploid consensus for mitochondria

module load SAMtools BCFtools picard # loading modules on nesi

#file="remapping/ill01.bam"
#reference="remapping/S27ref.fasta" 
#outputfile="consensus/ill01.fa"

file=$1
reference=$2
outputfile=$3

echo "processing $1. with reference $2, to make consensus $3"


samtools sort $file > sorted.bam
java -jar -Xms128m -Xmx128m  $PICARD MarkDuplicates INPUT=sorted.bam OUTPUT=sorted.rmdup.bam METRICS_FILE=sorted.rmdup2.txt REMOVE_DUPLICATES=true VALIDATION_STRINGENCY=LENIENT MAX_RECORDS_IN_RAM=1 TMP_DIR="temp"
ln -s /share/easybuild/RHEL6.3/westmere/software/BCFtools/1.8-gimkl-2017a/bin/vcfutils.pl .
samtools mpileup -uf $reference sorted.rmdup.bam | bcftools call   --ploidy 1  -mv -Oz -o calls.vcf.gz
tabix calls.vcf.gz
cat $reference | bcftools consensus calls.vcf.gz > $outputfile
rm sorted.rmdup.bam sorted.bam calls.vcf.gz
unlink vcfutils.pl