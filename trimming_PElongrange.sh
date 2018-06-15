#!/bin/sh

##########This script aims at cleaning reads. It will create NeSi jobs for cleaning reads using
#bbmap

#It will create small command files ( 1 per sample) that can be run individually or launch as jobs
#see : https://github.com/ldutoit/DaniorerioRNA/wiki/1.-Cleaning/_edit

#Example of command file
#!/bin/sh
#module load  Java/1.8.0_144 FastQC/0.11.4  FastQC/0.11.4
#java -jar ~/repos/softwares/Trimmomatic-0.36/trimmomatic-0.36.jar PE -phred33  /home/ludovic.dutoit/projects/DaniorerioRNA/source_files/rawreads/1_R1.fq.gz /home/ludovic.dutoit/projects/DaniorerioRNA/source_files/rawreads/1_R2.fq.gz /home/ludovic.dutoit/projects/DaniorerioRNA/trimmed_reads/1R1_TRIMMED.fastq.gz  /home/ludovic.dutoit/projects/DaniorerioRNA/trimmed_reads/1R1_TRIMMED_UNPAIRED.fastq.gz /home/ludovic.dutoit/projects/DaniorerioRNA/trimmed_reads/1R2_TRIMMED.fastq.gz  /home/ludovic.dutoit/projects/DaniorerioRNA/trimmed_reads/1R2_TRIMMED_UNPAIRED.fastq.gz ILLUMINACLIP:adapters.fa:2:30:10:7 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:40
#fastqc --outdir /home/ludovic.dutoit/projects/Micrelenchus/trimmed_reads/fastqc /home/ludovic.dutoit/projects/DaniorerioRNA/source_files/rawreads/1_R1.fq.gz /home/ludovic.dutoit/projects/DaniorerioRNA/source_files/rawreads/1_R2.fq.gz /home/ludovic.dutoit/projects/DaniorerioRNA/trimmed_reads/1R1_TRIMMED.fastq.gz /home/ludovic.dutoit/projects/DaniorerioRNA/trimmed_reads/1R1_TRIMMED_UNPAIRED.fastq.gz /home/ludovic.dutoit/projects/DaniorerioRNA/trimmed_reads/1R2_TRIMMED.fastq.gz  /home/ludovic.dutoit/projects/DaniorerioRNA/trimmed_reads/1R2_TRIMMED_UNPAIRED.fastq.gz

###Parameters
adapterFile="/home/ludovic.dutoit/repos/softwares/bbmap/resources/adapters.fa" # can always be adapted from https://github.com/Transipedia/dekupl-annotation/blob/master/adapters.fa
rawreadfolder="/home/ludovic.dutoit/projects/DaniorerioRNA/source_files/rawreads/"
output_folder_reads="/home/ludovic.dutoit/projects/DaniorerioRNA/trimmed_reads/"
output_folder_fastqc="/home/ludovic.dutoit/projects/DaniorerioRNA/trimmed_reads/fastqc"

###MAIN PROGRAM 

#Load modules

module load FastQC/0.11.4   Java/1.8.0_144 SAMtools

#Create folders that do not exist yet
 
mkdir -p $output_folder_reads
mkdir -p $output_folder_fastqc
mkdir -p jobs
rm jobs/* # if any 
mkdir -p logs

#adapters copying it to the folder
cp $adapterFile .
adapters=$(basename $adapterFile)

#identifying the prefix of each sample
samples=$(ls $rawreadfolder   |  grep -E *gz | sed -s  -E 's/_R[1-2].fq.gz//g' | uniq) # for example 2420-05-11-01_S5_L001_ 2420-07-11-01_S7_L001_

#processingls sour
echo " careful with sample prefixes here"
for f in  $samples ;
do
  echo "Processing $f"
  forward=$(echo $rawreadfolder$f"_R1.fq.gz")
  backward=$(echo $rawreadfolder$f"_R2.fq.gz")
  forwardtrimmed=$(echo $output_folder_reads$f"_R1_TRIMMED.fastq.gz")  
  backwardtrimmed=$(echo $output_folder_reads$f"_R2_TRIMMED.fastq.gz")
  forwardtrimmedunpaired=$(echo $output_folder_reads$f"R1_TRIMMED_UNPAIRED.fastq.gz")
  backwardtrimmedunpaired=$(echo $output_folder_reads$f"R2_TRIMMED_UNPAIRED.fastq.gz")
  #command=$'#!/bin/sh\nmodule load  Java/1.8.0_144 FastQC/0.11.4  FastQC/0.11.4 SAMTools\nfastq-mcf  '$adapters' '$forward' '$backward' -o '$forwardtrimmed' -o '$backwardtrimmed' -q 30 -P 33 -l 32 --max-ns 1'
  command=$'#!/bin/sh\nmodule load  Java/1.8.0_144 FastQC/0.11.4  FastQC/0.11.4\njava -jar ~/repos/softwares/Trimmomatic-0.36/trimmomatic-0.36.jar PE -phred33  '$forward' '$backward' '$forwardtrimmed'  '$forwardtrimmedunpaired' '$backwardtrimmed'  '$backwardtrimmedunpaired' ILLUMINACLIP:'$adapters$':2:30:10:7 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:40 \nfastqc --outdir '$output_folder_fastqc' '$forward' '$backward' '$forwardtrimmed' '$forwardtrimmedunpaired' '$backwardtrimmed'  '$backwardtrimmedunpaired
  echo "$command"  >   "jobs/trimming$f.job" 
done
#special bit in ILLUMINACLIP here where I used the adapters provided by bbduk and a minadapterlength of 7 ( default 8) cause some kmer remained

launchjobs

###LAUNCHJOBS IS A SHORT COMMAND THAT DOES that
#  for file in jobs/*.job;
#  do
#  basefile=$(basename $file)
#  sbatch -A uoo00116 -t 2-00:00:00  -o "logs/$basefile.log"  $file
#  done



cd $output_folder_reads

for file in *gz ;
  do
    fastqc $file
done

