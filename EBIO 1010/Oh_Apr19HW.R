#------------------------------------------------------------------------------#
# Assignment: 19 April R Homework                                              #
# Author: Dylan Oh                                                             #
# Date Created: 16 April 2018                                                  #
#------------------------------------------------------------------------------#

# Importing data
data <- read.csv('HW_fecal_study.csv')

# Defining predictor and response variables for each model
predictor <- data$Group
responseBMI <- data$BMI
responseVanco <- data$vancomycin
responseAntibiotic <- data$days_antibiotic
responseStool <- data$stool_freq
data

# Evaluating models for each variable
modelBMI <- lm(responseBMI ~ predictor)
modelVanco <- lm(responseVanco ~ predictor)
modelAntibiotic <- lm(responseAntibiotic ~ predictor)
modelStool <- lm(responseStool ~ predictor)

deltaBMI <- modelBMI$coefficients[2]
summary(modelBMI)
summary(modelVanco)
summary(modelAntibiotic)
summary(modelStool)

results <- data.frame(
    'Characteristic' = c(
        'BMI', 'Vancomycin', 'Days on Antibiotic', 'Frequency of Stool'
    ),
    'Group 1' = c(

    )
)
