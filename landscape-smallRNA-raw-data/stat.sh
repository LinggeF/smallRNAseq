#!/bin/bash

for i in `cat samplelist`
do
	echo "Finding the beginning line..."
	lines=$(grep -n 'shanggao' $i/$i.smallRNA.best.mapping.strata.sam | awk -F ":" '{print $1}')
	echo "done! Line number is $lines"
	echo "Processing the data..."
	time awk -F "\t" -v "lines=$lines" 'NR>lines {print $1"\t"$3}' $i/$i.smallRNA.best.mapping.strata.sam | sed -r 's/[0-9]+_//' | sed 's/hsa-//' | sed -r 's/-.+//' | sed 's/hsa_//' | sed -r 's/_.+//' | sort | uniq > $i/tmp
	wc -l $i/tmp
	echo "done!"
	cd $i
	echo "Using R to get the landscape table..."
	time Rscript ../stat.R
	echo "done!"
	cd ../
done


