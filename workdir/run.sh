#!/bin/sh
echo "Creating blast db from data.fas"
makeblastdb -in data.fas -input_type fasta -dbtype nucl -title mydb -parse_seqids -out db/mydb
echo "Running blast on search.fas for mydb and parsing xml output"
blastn -query search.fas -db db/mydb -outfmt '5' | xml2json