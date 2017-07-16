library(stringr)
stat <- read.table("stat.smallRNA.txt", sep = "\t", header = F, stringsAsFactors = F)

stat$V1 <- gsub("le.+", "miRNA", stat$V1)
stat$V1 <- gsub("mi.+", "miRNA", stat$V1)
stat$V1 <- gsub("piR,rRNA", "rRNA", stat$V1)
stat$V1 <- gsub("piR,snRNA", "snRNA", stat$V1)
stat$V1 <- gsub("piR,snoRNA", "snoRNA", stat$V1)
stat$V1 <- gsub("piR,tRNA", "tRNA", stat$V1)
stat$V1[str_length(stat$V1) > 8] <- "Multiple alignment"
stat <- aggregate(V2~V1, stat, sum)
stat$V3 <- stat$V2/sum(stat$V2)

write.table(stat, "stat.smallRNA.summary", sep = "\t", row.names = F, col.names = F, quote = F)