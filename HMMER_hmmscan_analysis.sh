#!/bin/bash
#This script will apply the hmmer pipeline to new plant genomes to identify LRR-RLKs, malectin-RLKs, MLD-RLKs, and the malectin and MLD-RLKs that also contain LRRs
#The inputs required include - AllLRR.hmm (the concatenated Pfam hmms for all the LRR domains), Allkinase.hmm (the concatenated Pfam hmms for Pkinase and Pkinase_Tyr), malectin.hmm, and MLD.hmm
#The new genome fasta file should contain the protein sequences only and be in the format ????
 
#FILES= /mnt/c/Users/kileegza/Documents/HMMER/HMMs

for folder in /mnt/c/Users/kileegza/Documents/HMMER/Fastas/Denovo_Prediction/Augustus/*/; 
do

	
	for fasta in "${folder}*.fasta"; 
	do 
		hmmscan -E 1e-2 --domtblout /mnt/c/Users/kileegza/Documents/HMMER/HMMSCAN_Outputs/Denovo_Prediction/"${fasta##*/}.txt" /mnt/c/Users/kileegza/Documents/HMMER/HMMs/Pfam_HMM/Pfam-A.hmm $fasta 
		
		echo $fasta
	done
done
