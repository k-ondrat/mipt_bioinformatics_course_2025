#!/bin/bash

grep -oP '^.{9}\K.' fin > fout
