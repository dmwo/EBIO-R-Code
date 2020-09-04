data <- read.csv(file.choose(),header=TRUE,na.string=".")
attach(data)
names(data)
data

treatment1 <- c(enter treatment 1 header)
treatment2 <- c(enter treatment 2 header)
mean(treatment1)
mean(treatment2)
se <- function(x) {sd(x,na.rm=TRUE)/sqrt(length(x))}
se(treatment1)
se(treatment2)

# Paired two-sample t-test
t.test(treatment2,treatment1, paired=TRUE)

# Unpaired two-sample t-test
t.test (treatment2,treatment1)
