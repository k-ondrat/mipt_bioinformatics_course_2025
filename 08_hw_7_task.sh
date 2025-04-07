#!/bin/bash

(grep -P '^1\t' clinvar_20250330.vcf | awk -F'\t' '{l=length($5)-length($4)} l>m{m=l;r=$5} END{print "Longest insertion:\n"r}'; grep -P '^2\t' clinvar_20250330.vcf | awk -F'\t' '{l=length($4)-length($5)} l>m{m=l;r=$4} END{print "Longest deletion:\n"r}') > fout
