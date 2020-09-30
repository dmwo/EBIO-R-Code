#------------------------------------------------------------------------------#
# Assignment: 10 April In Class CSI                                            #
# Author: Dylan Oh                                                             #
# Date Created: 10 April 2018                                                  #
#------------------------------------------------------------------------------#

# Importing data
data <- read.csv('HypoxanthineTimeOfDeath-1.csv')

#------------------------------------------------------------------------------#
#                           Calculating Linear Model                           #
#------------------------------------------------------------------------------#
# Declaring response and predictor variables
predictor <- hypoxanthine_data$hypoxanthine
response <- hypoxanthine_data$hours

# Invoking the linear model
model <- lm(response ~ predictor)

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

# Calculating the prediction interval for the predicted values
predicted <- predict(
    model,
    newdata = data.frame(predictor = new_x),
    interval = 'prediction'
)

# Calculating the confidence interval for the predicted values
confidence <- predict(
    model,
    newdata = data.frame(predictor = new_x),
    interval = 'confidence'
)

# Calculating the expected mean values
predicted_individual_y <- predict(
    model,
    newdata = data.frame(predictor = 103),
    interval = 'prediction'
)


#------------------------------------------------------------------------------#
#                              Plotting the Data                               #
#------------------------------------------------------------------------------#
# Plotting the data points
plot(
    x = predictor,
    y = response,
    main = 'Amount of Hypoxanthine Over Time',
    xlab = 'Amount of Hypoxanthine',
    ylab = 'Time (Hours)',
    las = 1
)

# Adding a line that shows the expected mean
lines(
    x = new_x,
    y = predicted_y,
    lty = 1
)

# Adding a line that shows the lower prediction interval
lines(
    x = new_x,
    y = predicted[ ,2],
    lty = 1
)

# Adding a line that shows the upper prediction interval
lines(
    x = new_x,
    y = predicted[ ,3],
    lty = 1
)

# Adding a line that shows the lower confidence interval
lines(
    x = new_x,
    y = confidence[ ,2],
    lty = 3
)

# Adding a line that shows the upper confidence interval
lines(
    x = new_x,
    y = confidence[ ,3],
    lty = 3
)

# Adding a point indicating the actual amount of hypoxanthine found in the
# senator's eye
points(
    x = 103,
    y = 25,
    pch = 18,
    cex = 1.5,
    col = 'red'
)

# Claim: It is conceivable that the plane crash was a cover up for a murder.
# The actual amount of hypoxanthine in the eye of the dead senator after 25 hrs
# was 103; in our predicted model, that level of hypoxanthine was achieved
# after 27.9 hours, which falls within the 95% confidence interval of the
# linear model. However, the prediction interval extends from ~9 to ~47 hours,
# so there is a wide range of potential error in the prediction. Because of this,
# the results are inconclusive and causation cannot be implied. Moreover, this
# result is not generalisable to more than one individual: the senator.
