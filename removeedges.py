
#!/usr/bin/env python

#Ugly script to remove the edges of sequences in fasta file based on known information about coverage
import fasta_tools as ft
import os
os.system(" mkdir -p combinewithknownseq")




##TESSELATUS



filename = "remapping/consensusMtesselatus.fa"
startofc1 =18 # 0 based
startofc2 = 18
endofc2 = 3046


#trim and output
fasta =ft.parse_fasta_to_dict(filename, output_format='string')
newc1 =fasta["Mtesselatus-refspades_c1"][startofc1
:]
newc2 = fasta["Mtesselatus-refspades_c2"][startofc2
:endofc2+1]
newfastadict={"c1":newc1, "c2":newc2}
ft.dict_to_fasta(newfastadict, "combinewithknownseq/consensusMtesselatusNOEDGES.fa")


###TENEBROSUS

filename ="remapping/consensusMtenebrosus.fa"
startofc1 =22
endofc1 =10267 # 0 based
startofc2 = 0
endofc2 = 2961


#trim and output
fasta =ft.parse_fasta_to_dict(filename, output_format='string')
newc1 =fasta["Mtenebrosus-refspades_c1"][startofc1
:endofc1+1]
newc2 = fasta["Mtenebrosus-refspades_c2"][startofc2
:endofc2+1]
newfastadict={"c1":newc1, "c2":newc2}
ft.dict_to_fasta(newfastadict, "combinewithknownseq/consensusMtenebrosusNOEDGES.fa")
#less "remapping/consensusMtenebrosus.fa"  | grep -v ">" | wc -c 
#less  "combinewithknownseq/consensusMtenebrosusNOEDGES.fa"  | grep -v ">" | wc -c 



###HUTONII


filename ="remapping/consensusMhuttonnii.fa"
startofc1 =18
endofc1 =10263 # 0 based



#trim and output
fasta =ft.parse_fasta_to_dict(filename, output_format='string')
newc1 =fasta["Mhuttonii-refspades_c1"][startofc1
:endofc1+1]

newfastadict={"c1":newc1}
ft.dict_to_fasta(newfastadict, "combinewithknownseq/consensusMhuttonniiNOEDGES.fa")
#less "remapping/consensusMhuttonnii.fa"  | grep -v ">" | wc -c 
#less  "combinewithknownseq/consensusMhuttonniiNOEDGES.fa"  | grep -v ">" | wc -c 






##Rrufozona


filename ="remapping/consensusRrufozonai.fa"
startofc1 =0
endofc1 =8938 # 0 based



#trim and output
fasta =ft.parse_fasta_to_dict(filename, output_format='string')
newc1 =fasta["Rrufozonai-refspades_c1"][startofc1
:endofc1+1]

newfastadict={"c1":newc1}
ft.dict_to_fasta(newfastadict, "combinewithknownseq/consensusRrufozonaiNOEDGES.fa")
#less "remapping/consensusRrufozonai.fa"  | grep -v ">" | wc -c 
#less  "combinewithknownseq/consensusRrufozonaiNOEDGES.fa"  | grep -v ">" | wc -c 


