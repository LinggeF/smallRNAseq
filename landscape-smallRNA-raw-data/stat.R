dat <- read.table("tmp", header = F, stringsAsFactors = F, sep = "\t")
dat <- aggregate(V2~V1, dat, paste, collapse = ",")
tab <- table(dat$V2)
write.table(tab, "stat.smallRNA.txt", sep = "\t", quote = F, col.names = F, row.names = F)