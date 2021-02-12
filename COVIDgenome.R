covid<- scan("./sequence.gb",what="character",sep="\n") #load Covid genome from genbank

Seq<-gsub(".*1 *([gatc])","\\1",covid) # remove the index number in front of the sequence

Seq<-gsub(".*ORIGIN +","",paste(Seq,collapse="")) #remove everything before origin, where the sequence begins. Collapse down to one string.

Seq<-gsub(" |//","",Seq) #remove spaces and //

Seq<-gsub("([actg])","\\U\\1",Seq,perl=T) # all uppercase

spike<-substr(Seq, start = 21563, stop = 25384) # isolate characters 21563-25384 in the string

spike # show sequence

# This gene appears to be incredibly highly conserved, with the most "different" variant still having a 99.92% sequence identity. 
# Despite the hundred different variants that were compared, there was minimal variation in the coding sequence of this protein.

