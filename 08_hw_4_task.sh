#!/bin/bash

grep -B1 '777' fin | grep -v '^--$' > fout
