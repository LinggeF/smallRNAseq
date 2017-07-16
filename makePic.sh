#!/bin/bash

for i in `cat samplelist`
do
	cd $i
	Rscript ../maketable.R
	cd ../
done
