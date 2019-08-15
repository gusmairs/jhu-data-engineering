#!/usr/bin/env bash

# Experimenting with merge of many data files into one .csv file
# This runs on all files in 'specdata' in about 3 seconds
# Pandas does it in 2, base R in 20, haven't tested better R tools

function clr {
	cat header.csv > alldat.csv
}

function merge {
	for n in $@; do
		file=$(echo $(printf "%03d" $n)".csv")
		echo $file
		tail -n +2 $file >> ../alldat.csv
	done
}
