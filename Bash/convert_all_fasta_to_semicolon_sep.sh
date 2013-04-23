#!/bin/bash

fnafiles=`find . -name "*.fna"`
for i in `echo "$fnafiles"`
    do
    echo $i
    convert_fasta_to_semicolon_sep.rb < $i > $i.csv
done

fnafiles=`find . -name "*.fasta"`
for i in `echo "$fnafiles"`
 do
 echo $i
 convert_fasta_to_semicolon_sep.rb < $i > $i.csv
done


#To move
#find . -type f -name "*.csv" -exec mv {} ./csv_EarthMicroBiomeProject/ \;