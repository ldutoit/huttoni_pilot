# Manual editing of the Maaft alignment

This was done species by species by aligning known sequence to our contigs to see if we could extend them, and maybe merge them.

##  Micrelenchus tenebrosus
We could add 128 of COI bases at the end of contig 1 for tenebrosus from: >**KU860074.1**. 

We did not succedd in adding 16S. And we could not anything for contig 2, neither aligning with another nor with contig 1.

## Micrelenchus huttonii

We were able to add 95 bp to the beginning of Mhutonii contig 1 using COI genbkank: **AY858079**.

## Micrelenchus tesseatus

Altough COI (KU860077.1) and contig 1 aligned towards the end of the scaffold. The alignment was not perfect and we chose not to extend the sequence rather than doing it imperfectly for only a few bases.


## Roseaplagis rufozona

Here again, although our own CO1  ( see sequence below) aligned towards the end of the scaffold. Th alignment was not perfect and we chose not to extend the sequence rather than doing it imperfectly for only a few bases.

```
>R.rufozona.COI
 AAGGATATTGGGACACTTTACCTAGTTTTTGGTATTTGATCTGGGCTCGTAGGGACTGCCCTCAGATTACTTATTCGTGCTGAGTTAGGACAACCAGGGGCCTTATTAGGCGATGATCAACTATATAACGTAATTGTTACAGCTCACGCTTTTGTTATAATTTTTTTCTTAGTGATACCCCTTATAATTGGAGGATTTGGTAACTGACTAATCCCTTTGATACTAGGGGCCCCTGATATAGCTTTTCCCCGATTAAATAATATAAGTTTTTGATTACTTCCTCCTTCTTTGACCCTTTTATTAGCTTCTTCCGCTGTTGAAAGAGGGGTGGGGACAGGGTGAACAGTTTATCCGCCACTATCCGGCAACCTTGCCCACGCTGGTGCCTCAGTAGATCTAGCTATTTTCTCGCTACACTTAGCCGGTGTTTCCTCTATTCTTGGGGCTGCAAATTTTATTACAACAGTGATCAATATACGATGACAAGGCATAAAATTTGAACGCCTTCCGTTATTCGTTTGATCAGTTAAAATTACAGCTATCCTGCTATTATTGTCTCTTCCAGTGTTAGCAGGTGCCATTACAATACTCCTGACAGACCGAAACTTTAACACCTCATTCTTTGATCCCGCTGGA
 ```

### OUTPUT


the four consensus files are:

```
output_files/consensusMhuttonniiNOEDGESCOMBINED.fa
output_files/consensusMtenebrosusNOEDGESCOMBINED.fa
output_files/consensusMtesselatusNOEDGESCOMBINED.fa
output_files/consensusRrufozonaiNOEDGESCOMBINED.fa
```