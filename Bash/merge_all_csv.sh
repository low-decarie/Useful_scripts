#!/bin/bash

$outputfile=$0

rm `echo "$outputfile"`
echo "$outputfile"

csvfiles=`find . -name "*.csv"`

for file in `echo "$csvfiles"`
    do     filebase=`basename $file`
         echo $filebase
         cat $file | perl -pe 's/^/'"$filebase"'\,/g' >> $outputfile
done