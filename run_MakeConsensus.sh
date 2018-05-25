#!/bin/sh


###First I sort the. bams
module load SAMtools


samtools view  -Sb remapping/Mtesselatus.bam | samtools sort -  > remapping/sortedMtesselatus.bam
samtools view  -Sb remapping/Mtenebrosus.bam | samtools sort -  > remapping/sortedMtenebrosus.bam
samtools view  -Sb remapping/Rrufozonai.bam | samtools sort -  > remapping/sortedRrufozonai.bam
samtools view  -Sb remapping/Mhuttonnii.bam | samtools sort -  > remapping/sortedMhuttonnii.bam


###then I run the consensus for each species


MakeConsensus.sh remapping/sortedMtesselatus.bam "outputbestmitobim/Mtesselatus-refspades_c1.fa"  "remapping/consensusMtesselatus.fa"
MakeConsensus.sh remapping/sortedMtenebrosus.bam "outputbestmitobim/Mtenebrosus-refspades_c1.fa"   "remapping/consensusMtenebrosus.fa"
MakeConsensus.sh remapping/sortedRrufozonai.bam "outputbestmitobim/Rrufozonai-refspades_c1.fa"   "remapping/consensusRrufozonai.fa"
MakeConsensus.sh remapping/sortedMhuttonnii.bam "outputbestmitobim/Mhuttonii-refspades_c1.fa"   "remapping/consensusMhuttonnii.fa"






