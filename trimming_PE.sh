module load FastQC
mkdir -p trimmed_reads/fastqc
cp /home/ludovic.dutoit/repos/softwares/bbmap/resources/adapters.fa .
java -jar ~/repos/softwares/Trimmomatic-0.36/trimmomatic-0.36.jar PE -phred33  raw_files/OG4339.M.huttonii.pilot.study/OG4339_fastq//D5VHH-4339-01-25-01_S1_L001_R1_001.fastq.gz raw_files/OG4339.M.huttonii.pilot.study/OG4339_fastq//D5VHH-4339-01-25-01_S1_L001_R2_001.fastq.gz trimmed_reads/1R1_TRIMMED.fastq.gz  trimmed_reads/1R1_TRIMMED_UNPAIRED.fastq.gz trimmed_reads/1R2_TRIMMED.fastq.gz  trimmed_reads/1R2_TRIMMED_UNPAIRED.fastq.gz ILLUMINACLIP:adapters.fa:2:30:10:7 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:40
fastqc --outdir trimmed_reads/fastqc trimmed_reads/*

#Input Read Pairs: 1025080 Both Surviving: 969319 (94.56%) Forward Only Surviving: 3381 (0.33%) Reverse Only Surviving: 49912 (4.87%) Dropped: 2468 (0.24%)
#looking good, virtually no adapter content left.

