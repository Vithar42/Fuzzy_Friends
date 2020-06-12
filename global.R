library(FuzzyR)



Input_data <- matrix((1:2),1,2)
fis <- tipper()
evalfis(Input_data, fis)

# .fis is a standard format, that the FuzzyR package can read.  So I can import the matlab built model directly.

fileName <- "FuzzyFriendModel5.fis"
fis <- readfis(fileName)

showrule(fis)

showfis(fis)

showGUI(fis)


JoeSAug <- c(2,5,4,7,0,4,4,3,2,9,4,3)

JoeSAug <- matrix((1:2),1,2)
JoeSAug <- matrix(c(2,5,4,7,0,4,4,3,2,9,4,3), nrow = 1, ncol = 12)

test <- evalfis(JoeSAug, fis)
test <- evalfis(JoeSAug, fis, time = 1, point_n = 101, draw = FALSE)






HRpS <- 10



LFTpH <- CYEpH / CYpLF

LFTpD <- LFTpH * HRpS