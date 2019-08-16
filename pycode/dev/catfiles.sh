#!/usr/bin/env bash
# Gets data from files in numbered list and concatenates into one
# file with a single header.

target='dir/sh_cat.csv'
head -n 1 '001.csv' > $target
for i in *.csv; do
  tail -n +2 $i >> $target
done
