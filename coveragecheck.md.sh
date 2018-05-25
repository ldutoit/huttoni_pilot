##checking coverage manually for the mapping to allow to remove the edge if they are weird, column 1 is scaf, 2 is pos( 1-based), and 3 is cov

samtools depth  remapping/sortedMtesselatus.bam  |less

###c1 start
# Mtesselatus-refspades_c1        16      199
#Mtesselatus-refspades_c1        17      2557

###c1 end  decreases in coverage more gradually, no trimming


###c2 start
#Mtesselatus-refspades_c2        16     845
#Mtesselatus-refspades_c2        17      4251

###c2 end
#Mtesselatus-refspades_c2        3045    4201
#Mtesselatus-refspades_c2        3046    16


samtools depth  remapping/sortedMtenebrosus.bam  |  less

###c1 start
#Mtenebrosus-refspades_c1        20      144
#Mtenebrosus-refspades_c1        21      3141

###c1 end
#Mtenebrosus-refspades_c1        10266   1061
#Mtenebrosus-refspades_c1        10267   49

###c2 start has good coverage 

###c2 end
#Mtenebrosus-refspades_c2        2960    5175
#Mtenebrosus-refspades_c2        2961    603


## 2 species with 1 good fragment

samtools depth  remapping/sortedRrufozonai.bam  |  less

###c1 start has good coverage

###c1 end

#Rrufozonai-refspades_c1 8937    1002
#Rrufozonai-refspades_c1 8938    986



samtools depth  remapping/sortedMhuttonnii.bam  


###c1 start has good coverage
Mhuttonii-refspades_c1  16      57
Mhuttonii-refspades_c1  17      1104

###c1 end
Mhuttonii-refspades_c1	10262	3943
Mhuttonii-refspades_c1	10263	162



