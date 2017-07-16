#!/bin/bash

for i in `cat samplelist`
do
	cutadapt -q 20 -a TGGAATTCTCGGGTGCCAAGG -m 17 --untrimmed-output $i.notrim.fq -o $i.trimmed.fq $i.fastq
	seqtk seq -a $i.trimmed.fq > $i.trimmed.fasta
	~/Tools/SHRiMP_2_2_3/bin/gmapper-ls -L miRNA.hg19.final-ls $i.trimmed.fasta --max-alignments 0 -n 1 -U --local --strata > $i/$i.miRNA.best.mapping.strata.sam
	~/Tools/SHRiMP_2_2_3/bin/gmapper-ls -L piRNA.hg19.uniq-ls $i.trimmed.fasta --max-alignments 0 -n 1 -U --local --strata > $i/$i.piRNA.best.mapping.strata.sam
	~/Tools/SHRiMP_2_2_3/bin/gmapper-ls -L tRNA.hg19.final-ls $i.trimmed.fasta -n 1 --max-alignments 0 -U --local --strata > $i/$i.tRNA.best.mapping.strata.sam
	~/Tools/SHRiMP_2_2_3/bin/gmapper-ls -L rRNA.hg19.final-ls $i.trimmed.fasta -n 1 --max-alignments 0 -U --local --strata > $i/$i.rRNA.best.mapping.strata.sam
	~/Tools/SHRiMP_2_2_3/bin/gmapper-ls -L snoRNA.hg19.final-ls $i.trimmed.fasta -n 1 --max-alignments 0 -U --local --strata > $i/$i.snoRNA.best.mapping.strata.sam
	~/Tools/SHRiMP_2_2_3/bin/gmapper-ls -L snRNA.hg19.final-ls $i.trimmed.fasta -n 1 --max-alignments 0 -U --local --strata > $i/$i.snRNA.best.mapping.strata.sam
	~/Tools/SHRiMP_2_2_3/bin/gmapper-ls -L smallRNA.final-ls $i.trimmed.fasta -n 1 --max-alignments 0 -U --local --strata > $i/$i.smallRNA.best.mapping.strata.sam
done










##~/Tools/SHRiMP_2_2_3/bin/gmapper-ls -L piRNA.hg19.uniq-ls 50188.trimmed.fasta --max-alignments 0 -n 1 -U --local --strata > 50188.piRNA.best.mapping.strata.sam
##~/Tools/SHRiMP_2_2_3/bin/gmapper-ls -L tRNA.hg19.final-ls 50188.trimmed.fasta -n 1 --max-alignments 0 -U --local --strata > 50188.tRNA.best.mapping.strata.sam
##~/Tools/SHRiMP_2_2_3/bin/gmapper-ls -L rRNA.hg19.final-ls 50188.trimmed.fasta -n 1 --max-alignments 0 -U --local --strata > 50188.rRNA.best.mapping.strata.sam
##~/Tools/SHRiMP_2_2_3/bin/gmapper-ls -L snoRNA.hg19.final-ls 50188.trimmed.fasta -n 1 --max-alignments 0 -U --local --strata > 50188.snoRNA.best.mapping.strata.sam
##~/Tools/SHRiMP_2_2_3/bin/gmapper-ls -L snRNA.hg19.final-ls 50188.trimmed.fasta -n 1 --max-alignments 0 -U --local --strata > 50188.snRNA.best.mapping.strata.sam
##~/Tools/SHRiMP_2_2_3/bin/gmapper-ls -L smallRNA.final-ls 50188.trimmed.fasta -n 1 --max-alignments 0 -U --local --strata > 50188.smallRNA.best.mapping.strata.sam

