library(tidyverse)

Gut <- read_csv("Guten2.csv")
dWords <- read_csv("topwords.csv")

for (i in 1:nrow(Gut)){
  filename <- toString(Gut[i,'filename'])
  text.v <- scan(filename, what="character", sep="\n")
  start.v <- (grep("\\*\\*\\*\\W*START OF TH",text.v) + 1)
  end.v <- (grep("\\*\\*\\*\\W*END OF TH",text.v) - 1)
  start.metadata.v <- text.v[1:start.v -1]
  end.metadata.v <- text.v[(end.v+1):length(text.v)]
  metadata.v <- c(start.metadata.v, end.metadata.v)
  novel.lines.v <- text.v[start.v:end.v]
  novel.v <- paste(novel.lines.v, collapse=" ")
  novel.lower.v <- tolower(novel.v)
  novel.words.l <- strsplit(novel.lower.v, "\\W")
  novel.word.v <- unlist(novel.words.l)
  not.blanks.v <- which(novel.word.v!="")
  novel.word.v <- novel.word.v[not.blanks.v]
  total.words.v <- length(novel.word.v)
  Gut[i,'total'] <- total.words.v
  for (j in 1:nrow(dWords)){
    theWord <- toString(dWords[j,'word'])
    Gut[i,theWord] <- ((length(novel.word.v[which(novel.word.v == theWord)])/total.words.v) * 100)
  }
}
my.pca <- prcomp(Gut[c(6:25)], center = TRUE, scale. = TRUE)
Gut['pc1'] <- my.pca$x[,1]
Gut['pc2'] <- my.pca$x[,2]


plot(Gut$the, Gut$that, col=Gut$color)
plot(Gut$at, Gut$that, col=Gut$color)

plot(Gut$pc1, Gut$pc2, col=Gut$color)

reduced <- Gut[c(2,26)]
distance_mat <- dist(reduced, method='euclidean')
Hierar_cl <- hclust(distance_mat, method = "average")
plot(Hierar_cl, labels=Gut$author)


