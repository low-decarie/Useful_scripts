#!/bin/bash

fnafiles=`find . -name "*.fna"`
for i in `echo "$fnafiles"`; do echo $i; convert_fasta_to_csv.rb < $i > $i.csv; done

fnafiles=`find . -name "*.fasta"`
for i in `echo "$fnafiles"`; do echo $i; convert_fasta_to_csv.rb < $i > $i.csv; done