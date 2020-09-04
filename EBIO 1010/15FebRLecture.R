data <- read.csv('iQUIT student questionaire_February 13, 2018_13.16-1.csv')
data <- data[-c(2), ]
data <- data[, -c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17)]
data
