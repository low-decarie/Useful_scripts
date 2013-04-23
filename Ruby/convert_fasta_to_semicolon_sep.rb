#!/usr/bin/ruby

#Converts fasta to csv

#Script provided by Aleksandr Levchuk
# as an answer on BioStar
# http://www.biostars.org/p/3722/#3724

#Usage
#ruby ./convert_fasta_to_csv.rb < f001.fasta > f001.fasta.csv

#Batch use
#for i in *.fasta; do ruby ./convert_fasta_to_csv.rb < $i > $i.csv; done

#Recursive (all files within a folder) batch use
#fnafiles=`find . -name "*.fna"`
#echo $fnafiles"
#for i in `echo "$fnafiles"`; do echo $i; ruby ./convert_fasta_to_csv.rb < $i > $i.csv; done

first_line = true

while line = STDIN.gets
  line.chomp!

  if line =~ /^>/
    puts unless first_line
    print line[1..-1]
    print ";"  # <-- Change this to "\t" and it's a convert-fasta-to-tab
  else
    print line
  end

  first_line = false
end
puts