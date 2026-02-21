#!/bin/bash
#This is one version of parsing for phytolrr. It requires jq. There is also a python script that does the same if easier. 
 
sed 's/let results = //; s/;$//' results.js | jq -r '
  ["seq_id", "seq", "motif_offset", "motif_score", "motif_length"] as $cols |
  $cols,
  (.[] | .seq_id as $id | .seq as $s |
      .motifs_16[] | [$id, $s, .offset, .score, .length]
  ) | @csv' | sed '/^[" ,]*$/d' | \
awk -F ',' 'NR==1 || $4 > 10' > results_detailed.csv

