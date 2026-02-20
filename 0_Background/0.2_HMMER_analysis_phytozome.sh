#!/bin/bash
#This script will apply the hmmer pipeline to new plant genomes to identify LRR-RLKs, malectin-RLKs, MLD-RLKs, and the malectin and MLD-RLKs that also contain LRRs
#The inputs required include - AllLRR.hmm (the concatenated Pfam hmms for all the LRR domains), Allkinase.hmm (the concatenated Pfam hmms for Pkinase and Pkinase_Tyr), malectin.hmm, and MLD.hmm
 
#FILES= /mnt/c/Users/kileegza/Documents/HMMER/HMMs

for species in /mnt/c/Users/kileegza/Documents/HMMER/Fastas/Phytozome/*; do
	for file in /mnt/c/Users/kileegza/Documents/HMMER/HMMs/*; do 
		hmmsearch --tblout /mnt/c/Users/kileegza/Documents/HMMER/"${sp||PIK1_CAEELecies##*/}_${file##*/}.out.txt" --noali -E 1e-2 "$file"  "$species"
	done
done


#for /f "tokens=1 delims=_" %%a in(.\*) do echo %%a
