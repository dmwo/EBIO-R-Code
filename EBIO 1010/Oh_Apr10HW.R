#------------------------------------------------------------------------------#
# Assignment: 10 April R Homework                                              #
# Author: Dylan Oh                                                             #
# Date Created: 10 April 2018                                                  #
#------------------------------------------------------------------------------#

# Importing data
data <- read.csv('FatherAgeMutations.csv')

#------------------------------------------------------------------------------#
#                           Calculating Linear Model                           #
#------------------------------------------------------------------------------#
# Declaring response and predictor variables
response <- data$numberOfNewMutations
predictor <- data$AgeOfFather

# Invoking the linear model
model <- lm(response ~ predictor)

# Showing summary of the linear model results
model_data <- summary(model)

# Creating new x vector that extends the range of predictor
new_x <- seq(
    min(predictor),
    max(predictor)
)

# Extracting coefficients
b0 <- summary(model)$coeff[1,1]
b1 <- summary(model)$coeff[2,1]

# Calculating the predicted values of y
predicted_y <- b0 + b1 * new_x

# Generating the confidence interval for the predicted values
predicted <- predict(
    model,
    newdata = data.frame(predictor = new_x),
    interval = 'confidence'
)

# Use the predict function to generate confidence interval for predicting a
# value for a single individual (instead the expected (mean) value for the
# response variable given a predictor variable value)
predicted_individual_y <- predict(
    model,
    newdata = data.frame(predictor = new_x),
    interval = 'prediction'
)

plot(
    x = predictor,
    y = response,
    xlim = c(10,45),
    ylim = c(20,90),
    main = 'Effect of Age of Father on Number of Mutations in Offspring',
    xlab = 'Age of Father (years)',
    ylab = 'Number of Mutations',
    las = 1
)

lines(
    new_x,
    predicted_y,
    lwd = 3
)

lines(
    new_x,
    predicted[ ,2],
    lty = 3
)

lines(
    new_x,
    predicted[ ,3],
    lty = 3
)

# Now plot the upper and lower confidence interval for the predicted value of
# individuals (estimated value of Y for an individual) for each value of X
lines(
    new_x,
    predicted_individual_y[ ,2],
    lty = 2
)

lines(
    new_x,
    predicted_individual_y[ ,3],
    lty = 2
)

# Individuals are subject to much more variability due to various environmental
# pressures, social pressures, etc.. Looking at large populations of Individuals
# removes quite a lot of those uncertainties because individuals who vary
# drastically from the "norm" are pushed further out as outliers rather than a
# standard. Which is why the confidence intervals for individuals are so much
# wider; individuals are harder to predict than populations.
