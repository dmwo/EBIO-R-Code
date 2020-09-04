#------------------------------------------------------------------------------#
# Assignment: 5 April R Homework                                               #
# Author: Dylan Oh                                                             #
# Date Created: 2 April 2018                                                   #
#------------------------------------------------------------------------------#

# Importing data
data <- read.csv('Mammals_BrainBody_weight.csv')

#------------------------------------------------------------------------------#
#                           Calculating Linear Model                           #
#------------------------------------------------------------------------------#
# Creating predictor and response variables from data
predictor <- data$log10_body_weight_kg
response <- data$log10_brain_weight_g

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


#------------------------------------------------------------------------------#
#                           Calculating Linear Model                           #
#------------------------------------------------------------------------------#
# Plotting the data points in a scatter plot
plot(
    x = predictor,
    y = response,
    xlim = c(-3,3.5),
    ylim = c(-1,4),
    main = 'Effect of Body Weight on Brain Weight',
    xlab = 'Log Transformed Body Weight (kg)',
    ylab = 'Log Transformed Brain Weight (g)',
    las = 1
)

# Plotting a line representing the predicted values of y
lines(
    new_x,
    predicted_y,
    lwd = 3
)

# Plotting the lower confidence interval
lines(
    new_x,
    predicted[ ,2],
    lty = 3
)

# Plotting the upper confidence interval
lines(
    new_x,
    predicted[ ,3],
    lty = 3
)


#------------------------------------------------------------------------------#
#                                   Rubric                                     #
#------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------
# 1. Load the data                                                      | YES  |
#-----------------------------------------------------------------------|------|
# 2. Plot Data with Appropriate Axes Labels                             | YES  |
#-----------------------------------------------------------------------|------|
# 3. Construct a Linear Model and Get Summary of Data                   | YES  |
#-----------------------------------------------------------------------|------|
# 4. Use Linear Model to Show Predicted Mean Values of y                | YES  |
#-----------------------------------------------------------------------|------|
# 5. Use the Model to Generate the 95% Confidence Intervals             | YES  |
#-----------------------------------------------------------------------|------|
# 6. Graph is Submitted to Canvas                                       | YES  |
#-----------------------------------------------------------------------|------|
# 7. R Script is Submitted to Canvas                                    | YES  |
#-----------------------------------------------------------------------|------|
# 8. Script Includes Name on the First Line                             | YES  |
#-------------------------------------------------------------------------------
