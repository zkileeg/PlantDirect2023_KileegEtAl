#!/bin/bash
#This script will apply the phyto-lrr pipeline to all species to identify those containing LRRs. It will then put it into a format that's nice to view. 
 
folder=${1}

for species in $folder/*fasta; do

	output_folder="${folder}phytolrr_output/${species##*/}/"

	if [ ! -d $output_folder ]; then
		mkdir -p $output_folder
	fi 



	
	predict-phytolrr -f $species -p $output_folder 
done

sed -i 's/let results = //; s/;$//' "${output_folder}"results.js 

