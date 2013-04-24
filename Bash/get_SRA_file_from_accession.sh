#!/bin/bash

accession=$0

accession=SRR094470

echo $accession

type=`echo $accession|grep -Eos "SRR|ERR|DRR"`

collection=`echo $accession|grep -Eos "SRR[0-9]{3}|ERR[0-9]{3}|DRR[0-9]{3}"`

wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByRun/sra/$type/$collection/$accession/$accession.sra > $accession.sra