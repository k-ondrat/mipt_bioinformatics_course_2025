#!/bin/bash

grep -iv '[xy]' "$1" | grep '[0-9]' | grep -E '^[a-zA-Z0-9\-.,:; ]*$' | awk '{sum += length($0)} END{print sum}'
