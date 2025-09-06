#!/bin/bash
# Script to extract Scheme Name and Asset Value from AMFI NAVAll.txt and save as TSV and JSON

URL="https://www.amfiindia.com/spages/NAVAll.txt"
TMPFILE="navall.txt"
TSVFILE="output.tsv"
JSONFILE="output.json"

# Download the file
echo "Downloading NAVAll.txt..."
curl -s "$URL" -o "$TMPFILE"

# Extract header line (skip comment lines)
HEADER_LINE=$(grep -m1 -n '^Scheme Code' "$TMPFILE" | cut -d: -f1)

HEADER_LINE=$(grep -n '^Scheme Code' "$TMPFILE" | head -n1 | cut -d: -f1)

tail -n +$HEADER_LINE "$TMPFILE" | awk -F ';' '
NR==1 {
	for(i=1;i<=NF;i++) {
		if($i=="Scheme Name") s=i;
		if($i=="Net Asset Value") n=i;
	}
	next;
}
NF>1 && s && n {
	print $s "\t" $n;
}' > "$TSVFILE"

echo "TSV output saved to $TSVFILE."

# Convert TSV to JSON (use python for better compatibility)
python3 -c '
import csv, json
rows = []
with open("'"$TSVFILE"'", newline="") as tsvfile:
	reader = csv.reader(tsvfile, delimiter="\t")
	for row in reader:
		if len(row) == 2:
			rows.append({"Scheme Name": row[0], "Net Asset Value": row[1]})
with open("'"$JSONFILE"'", "w") as jsonfile:
	json.dump(rows, jsonfile, indent=2)
'

echo "JSON output saved to $JSONFILE."

# Clean up
echo "Done."
