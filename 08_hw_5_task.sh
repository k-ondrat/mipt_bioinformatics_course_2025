#!/bin/bash

sort -t$'\t' -k2,2 -k3,3n -k4,4n fin > fout
