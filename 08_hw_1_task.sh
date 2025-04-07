#!/bin/bash

awk -F '\t' '{sum=0; for(i=1; i<=NF; i++) sum+=$i; print sum}' fin > fout
