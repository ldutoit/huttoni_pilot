#remappingof every to their best mitobim asssembly longest 1 or 2 fragments.


#We want to remap some genomic samples
#Maurea pellucida (S29), Maurea spectabile (S28) and also We  want to remap C. glandiformis (S26) from trimmed_reads// folder 
#and some illumina samples....
#Maurea waikanae (sample 01), Maurea granti (sample 02) and Maurea selecta( S03 !only 10kb sequenced). from the illuminatrimmed folder 

#set up
#module load BWA/0.7.10-goolf-1.5.14 SAMtools/0.1.19-foss-2015a picard # loading those on the cluster
import os
os.system("mkdir -p remapping")
os.chdir("remapping")
	


#sample [forwardreads, backwardreads, eference]
sample_dict = { "Mtesselatus": ["../trimmed_reads/2420-04-11-01_S4_L001_R1_001_TRIMMED.fastq.gz", "../trimmed_reads/2420-04-11-01_S4_L001_R2_001_TRIMMED.fastq.gz","../outputbestmitobim/Mtesselatus-refspades_c1.fa"], 
	 "Mtenebrosus": ["../trimmed_reads//2420-05-11-01_S5_L001_R1_001_TRIMMED.fastq.gz","../trimmed_reads//2420-05-11-01_S5_L001_R2_001_TRIMMED.fastq.gz", "../outputbestmitobim/Mtenebrosus-refspades_c1.fa"],
	 "Rrufozonai": ["../trimmed_reads//2420-07-11-01_S7_L001_R1_001_TRIMMED.fastq.gz","../trimmed_reads//2420-07-11-01_S7_L001_R2_001_TRIMMED.fastq.gz","../outputbestmitobim/Rrufozonai-refspades_c1.fa"],
	 "Mhuttonnii": ["../trimmed_reads/2420-06-11-01_S6_L001_R1_001_TRIMMED.fastq.gz","../trimmed_reads/2420-06-11-01_S6_L001_R2_001_TRIMMED.fastq.gz","../outputbestmitobim/Mhuttonii-refspades_c1.fa"],
	 }


#function ...
for sample in (sample_dict.keys()):
	read1,read2,ref = sample_dict[sample][0],sample_dict[sample][1],sample_dict[sample][2]
	os.system("samtools faidx %s" % (ref)) #indexing reference
	os.system("java -jar $PICARD CreateSequenceDictionary R=%s O=%s.dict" %(ref,ref))
	command ="#!/bin/sh\nmodule load BWA/0.7.10-goolf-1.5.14 SAMtools/0.1.19-foss-2015a\n"
	command+="bwa index -a is %s  \n" % (ref)
	command+="bwa mem  -T 40 %s %s %s > %s.sam\n" % (ref,read1,read2,sample) 
	command+="samtools view -Sb %s.sam > %s.bam" % (sample,sample)
	output = open("mapping"+sample+".sh","w")
	output.write(command)
	output.close()
	os.system("sbatch -A uoo00116 -t 1-00:00 -o "+sample+".log  -J"+ sample+ " "+ "mapping"+sample+".sh") 	
	print command


#	#!/bin/sh
#	module load BWA/0.7.10-goolf-1.5.14 SAMtools/0.1.19-foss-2015a
#	bwa index -a is ../outputbestmitobim/Rrufozonai-refspades_c1.fa
#	bwa mem  -T 40 ../outputbestmitobim/Rrufozonai-refspades_c1.fa ../trimmed_reads//2420-07-11-01_S7_L001_R1_001_TRIMMED.fastq.gz ../trimmed_reads//2420-07-11-01_S7_L001_R2_001_TRIMMED.fastq.gz > Rrufozonai.sam
#	samtools view -Sb Rrufozonai.sam > Rrufozonai.bam