covid<- scan("./sequence.gb",what="character",sep="\n")

Seq<-gsub(".*1 *([gatc])","\\1",paste(covid))

Seq<-gsub(".*ORIGIN +","",paste(Seq,collapse=""))

Seq<-gsub(" |//","",Seq)

Seq<-gsub("([actg])","\\U\\1",Seq,perl=T)

Seq<-gsub("(ATG([ATGC]{3})+?(TAA|TAG|TGA)+?)","-->\\1<--",Seq)
Seq
