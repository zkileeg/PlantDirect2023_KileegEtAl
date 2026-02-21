#!/bin/ash

for sequence in /mnt/d/Sequence_Data/Phylogenetics_Project/Input_FASTAs/20200805_Fastas/20200801_LRR_pkinase_domains/*.fasta;do
	
	#echo "${folder##*/}/${sequence##*/}.fasta"
	#echo "$folder"
	#echo "$sequence"
	
	#Align sequences using mafft and output MSAs. Regex "##*/" pulls out only basename of file and folder 
	mafft --auto --inputorder "$sequence" > /mnt/d/Sequence_Data/Phylogenetics_Project/Aligned_FASTAs/20200801_LRR_pkinase_domains/"${sequence##*/}.fasta"
	
done