data <- read.csv('candy_bag_2018.csv')

hist(data$Weight_g,
     breaks = seq(0,60,2),
     main = 'Candy Weights',
     xlab = 'Weight (g)',
     las = 1,
     col = 'deepskyblue3')

true_mean <- mean(data$Weight_g)
abline(v = true_mean,
       lwd = 5,
       col = 'grey')

hist(data$Weight_g,
     breaks = seq(0,60,2),
     xlab = 'Weight (g)',
     main = 'Candy Weights',
     col = 'white',
     las = 1,
     ylim = c(0,100),
     border = 'white')

abline(v = true_mean,
       lwd = 5,
       col = 'grey')

reps <- 100

sample_size <- 15

estimated_means <- rep(NA, reps)

for(i in 1:reps){
    d <- sample(candy$Weight_g, sample_size)
    estimated_means[i] <- mean(d)
    points(est_means[i], i, cex = 0.4)
    arrows(true_mean, i, estimated_means[i], i, length = 0.05)
}

abline(v = true_mean,
       lwd = 5, 
       col = 'dark grey')

hist(estimated_means, 
    breaks = seq(0,20),
    col = 'deepskyblue3')

abline(v = true_mean,
    lwd = 5,
    col = 'dark grey')

error <- estimated_means - true_mean

hist(error,
    col = 'deepskyblue3')

abline(v = 0, lwd = 5)

difference <- (temp_sample - estimated_means[i]) ^ 2

variance <- sum(difference) / (sample_size - 1)

std_dev <- sqrt(variance)

std_dev <- sd(data$Weight_g)

sample_size <- seq(1,100)

std_error <- std_dev / sqrt(sample_size)

plot(sample_size, std_error,
    type = 1,
    lwd = 3
