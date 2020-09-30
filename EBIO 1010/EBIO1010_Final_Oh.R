#-----------------------------------------------------------------------------#
# Assignment: Final Exam
# Author: Dylan Oh
# Date Created: 8 May 2018
#-----------------------------------------------------------------------------#

#-----------------------------------------------------------------------------#
#                                 Challenge 1                                 #
#-----------------------------------------------------------------------------#
# Importing data
data <- read.csv('Hippocampus.csv')

# Creating response and predictor variables for linear model
predictor <- data$lesion
response <- data$memory

# Invoking linear model
model <- lm(response ~ predictor)

# Generating new x axis
new_x <- seq(
    min(predictor),
    max(predictor)
)

# Extracting coefficients
b0 <- summary(model)$coeff[1,1]
b1 <- summary(model)$coeff[2,1]

# Calculating the predicted values of y
predicted_y <- b0 + b1 * new_x

# Calculating the 95% confidence interval for the data
confidence <- predict(
    model,
    newdata = data.frame(predictor = new_x),
    interval = 'confidence'
)

# Plotting the data points
plot(
    x = predictor,
    y = response,
    main = 'Effect of Hippocampal Lesions on Memory in Rats',
    xlab = 'Lesion Size',
    ylab = 'Spatial Memory Score',
    las = 1
)

# Adding lines for residuals, which are the difference between each observed
# data point and the mean, and is an indicator of how each individual point
# varies from the mean.
for (i in 1:length(predictor)){
    arrows(
        x0 = predictor[i],
        y0 = b0 + b1 * predictor[i],
        x1 = predictor[i],
        y1 = response[i],
    )
}

# Adding a line to represent the mean
lines(
    x = new_x,
    y = predicted_y,
    lty = 1
)

# Adding a line to represent the lower confidence interval
lines(
    x = new_x,
    y = confidence[ ,2],
    lty = 2
)

# Adding a line to represent the upper confidence interval
lines(
    x = new_x,
    y = confidence[ ,3],
    lty = 2
)

# Increasing the size of hippocampal lesions in rats decreases their spatial
# memory score. The graph shows that scores decrease from a mean of 10 in rats
# with no lesions to 5 in rats with lesions of size 100

#------------------------------------------------------------------------------#
#                                 Challenge 2                                  #
#------------------------------------------------------------------------------#
# Importing data
worm_data <- read.csv('Wormy_fish.csv')

# Creating table of the data
results <- table(worm_data)

# Reversing the data
results <- rbind(results[ ,1],results[ ,2])

# Plotting
barx <- barplot(
    results,
    main = 'Survival Rates of Fish Based on Trematode Infection',
    ylim = c(0,60),
    xaxt = 'n',
    col = c('lightblue','darkgrey'),
    beside = T
)

# Adding new x axis
axis(
    side = 1,
    at = c(2,5),
    label = c(
        'Infected',
        'Uninfected'
    )
)

# Inserting legend
legend(
    x = 3.5,
    y = 50,
    legend = c('Eaten','Survived'),
    pch = 15,
    col = c('lightblue','darkgrey')
)

# Parameter being estimated is the difference in the percentage of infected fish
# that are eaten to the percentage of uninfected fish that are eaten.

fish_param <- (results[1,1] / sum(results[,1])) - (results[1,2] / sum(results[,2]))

# Trematode infection dramatically increases the number of fish that are eaten.
# While the number of fish that survive are comparable between fish who are and
# are not infected, there are much more fish who are eaten that are infected
# than fish who are not. The percentage of uninfected fish who survive is almost
# 100%, while the percentage for infected fish who survive are around 50%.

#------------------------------------------------------------------------------#
#                                 Challenge 3                                  #
#------------------------------------------------------------------------------#
# Importing data
drink_data <- read.csv('mozzy_beer.csv')

# Creating variable drink defining water as 0 and beer as 1
drink <- ifelse(
            drink_data$drink == 'beer',
            yes = 1,
            no = 0
        )

# Invoking a linear model comparing attraction change to drink consumed
drink_model <- lm(drink_data$attraction_change ~ drink)

# Creating jitter vector
x_jitter <- jitter(drink,0.25)

# Plotting the data with jitter and no x-axis
plot(
    x_jitter,
    drink_data$attraction_change,
    main = 'Attractiveness to Mosquitos Based on Alcohol Consumption',
    xlab = 'Drink',
    ylab = 'Change in Attractiveness to Mosquitos',
    xlim = c(-0.4,1.4),
    ylim = c(-0.5,0.7),
    xaxt = 'n',
    las = 1
)

# Creating x-axis, replacing 0 and 1 with water and beer
axis(
    side = 1,
    at = c(0,1),
    c('Water','Beer')
)

# Creating a line that connects the two means
abline(
    drink_model,
    lwd = 2
)

# Plotting the mean of the water data
points(
    x = 0,
    y = drink_model$coeff[1],
    pch = 19,
    cex = 1.5
)

# Plotting the mean of the beer data
points(
    x = 1,
    y = drink_model$coeff[1] + drink_model$coeff[2],
    pch = 19,
    cex = 1.5,
)

# Parameter being estimated is the difference of means in the change of
# attractiveness to mosquitos based on the beverage drunk.
drink_param <- drink_model$coeff[2] - drink_model$coeff[1]

# Attractiveness to mosquitos increases when drinking beer compared to drinking
# water. The data shows that the mean change in attractiveness is greater among
# those who drank beer than those who drank water of about 0.15
