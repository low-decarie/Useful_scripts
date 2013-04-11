#!/bin/bash

fnafiles=`find . -name "*.fna"`
echo $fnafiles"
for i in `echo "$fnafiles"`; do echo $i; ruby ./convert_fasta_to_csv.rb < $i > $i.csv; done

fnafiles=`find . -name "*.fasta"`
echo $fnafiles"
for i in `echo "$fnafiles"`; do echo $i; ruby ./convert_fasta_to_csv.rb < $i > $i.csv; done