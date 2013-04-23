#! /usr/bin/perl

use Data::Dumper;

my $dictFile=$ARGV[0];
my $srchFile=$ARGV[1];
(-f $dictFile and -f $srchFile) or die "Usage: $0 dictFile srchFile";

#This script was provided by "phatfingers"
#as a response to a question on stackoverflow
#http://stackoverflow.com/a/15845878/742447

#Usage
#perl compare_sequences.pl environmental_amplicon reference_sequence;
#(don't forget the semicolon in perl)
#This is adapted for fasta and fna files first converted to csv


#This script compares sequence data found in
# two files, one containing many short sequences
# (environmental amplicon next gen sequencing)
# to fewer longer sequences
# reference library (in this case 16S sequences
# of extremophiles

#It uses hash tables to accelerate the search

# Load sequence dictionary into hash table
my %dict=();
my %sizes=();
open($df, "<$dictFile") or die "Cannot open $dictFile";
while (<$df>) {
  chomp;
  my ($enviroamplicondescription, $enviroamplicon)=split(/\s*,\s*/);
  $dict{lc($enviroamplicon)}=$enviroamplicondescription;
  $sizes{length($enviroamplicon)}=1;
  #print "$enviroamplicondescription";
}

#print "Sizes:";
#print Dumper(\%sizes);
#print "Dictionary:";
#print Dumper(\%dict);

# Search file for known sequences
open($sf, "<$srchFile") or die "Cannot open $srchFile";
my $lineNo=0;
while ($line=<$sf>) {
  $lineNo++;
  chomp($line);
  # Populate a hash table with every unique sequence that could be matched
  my %sequences=();
  while ( my ($size) = each(%sizes) ) {
    for (my $i=0; $i <= length($line)-$size; $i++) {
      $sequences{substr($line,$i,$size)}=1;
    }
  }
  
#  print "\nSequences:";
#  print Dumper(\%sequences);
    
    
  # Compare each sequence with the dictionary of sequences.
  while ( my ($sequence) = each(%sequences) ) {
    if ($dict{$sequence}) {
      print "$dict{$sequence}, $sequence, $line\n";
    }
  }
}