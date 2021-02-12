ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") #create a vector with ncbi codes for 3 sequences
library(rentrez)  # load rentrez library
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") # use the nuccore database, vector of ncbi codes, and the data format "fasta"

Sequences<-strsplit(Bburg, "\\n{2}") # split using the regex that finds a double new line character (as this was the delimiter between seqs)

Sequences<-unlist(Sequences)

header<- gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences) # pull sequence titles and create an object including them
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences) # pull sequences and create and object including them
Sequences<-data.frame(Name=header,Sequence=seq) # create dataframe


hello<-gsub("\n","",Sequences$Sequence) #remove new line characters in Seqeunces and  create a new object
Sequences<-data.frame(Name=header,Sequence=hello) # create a final df

write.csv(Sequences,"Sequences.csv") #make csv with created df

