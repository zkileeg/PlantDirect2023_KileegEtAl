import json
import csv



# 1. Load the data from results.js
# The file contains a JSON array of sequence objects
with open('results.js', 'r') as f:
    data = json.load(f)

# 2. Define the output CSV filename
output_file = 'filtered_results.csv'

# 3. Process and write to CSV
with open(output_file, 'w', newline='') as csvfile:
    # Fieldnames including the motif details found in the file
    fieldnames = ['seq_id', 'seq', 'motif_offset', 'motif_score', 'motif_length']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()

    for entry in data:
        seq_id = entry.get('seq_id')
        seq = entry.get('seq')
        # Retrieve the list of motif objects for this sequence
        motifs = entry.get('motifs_16', [])

        # Filter the motifs to keep only those with a score >= 10
        filtered_motifs = [m for m in motifs if m.get('score', 0) >= 10]

        
            # Write a row for each motif that passed the score filter
        for motif in filtered_motifs:
            writer.writerow({
                'seq_id': seq_id,
                'seq': seq,
                'motif_offset': motif.get('offset'),
                'motif_score': motif.get('score'),
                'motif_length': motif.get('length')
            })

print(f"Conversion complete! Filtered results saved to {output_file}")
