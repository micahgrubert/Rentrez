ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") #create a vector with ncbi codes for 3 sequences
library(rentrez)  # load rentrez library
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") # use the nuccore database, vector of ncbi codes, and the data format "fasta"

Sequences<-strsplit(Bburg, "\\n{2}") # split using the regex that finds a double new line character (as this was the delimiter between seqs)

Sequences<-unlist(Sequences)

header<- gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)