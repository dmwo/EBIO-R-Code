#------------------------------------------------------------------------------#
# Assignment: 26 Apr R Homework                                                #
# Author: Dylan Oh                                                             #
# Date Created: 25 April 2018                                                  #
#------------------------------------------------------------------------------#

# Importind data
data <- read.csv(
    'student_data_cleaned.csv'
)

#------------------------------------------------------------------------------#
#           Extracting Data and Performing Preliminary Calculations            #
#------------------------------------------------------------------------------#
# Creating a vector defining the two sex possibilities
sex <- c(
    'Female',
    'Male'
)

# Extracting information about IQUIT sexes
sexData <- data$Sex

# Creating vector storing the probability of a student at CU being female
prob_female = c(
    0.473, 1 - 0.473
)

# Declaring sample size (number of students in IQUIT)
n <- length(sexData)

# Calculating observed proportion of females in IQUIT
obs_proportion <- sum((sexData == 'Female') / n)
obs_proportion
# Declaring number of repetitions (number of students at CU)
reps <- 33246

# Creating vector of trials to be taken, with a length of the sample size
trials <- rep(NA, n)

# Creating another empty vector, this time with the length of reps
simulated_female <- rep(NA, reps)

#------------------------------------------------------------------------------#
#                          Taking Probability Samples                          #
#------------------------------------------------------------------------------#
# Using a nested for loop to iterate through reps and trials
for (i in 1:reps){
    for (j in 1:n){
        # Taking a probability sample from sex
        trials[j] <- sample(sex, 1, prob = prob_female)
    }
    # Storing the number of females in the length 50 trials vector
    num_female <- sum(trials == 'Female')
    # Calculating the proportion of females in the trials
    simulated_female[i] <- num_female / n
}

#------------------------------------------------------------------------------#
#                                Plotting Data                                 #
#------------------------------------------------------------------------------#
# Summarising data in a histogram
hist(
    simulated_female,
    col = 'deepskyblue3'
)

# Adding a line showing the proportion of females in IQUIT
abline(
    v = obs_proportion,
    lwd = 2,
    lty = 3
)

#------------------------------------------------------------------------------#
#                                    Claim                                     #
#------------------------------------------------------------------------------#

# The proportion of female students in EBIO (represented by the number of
# students in IQUIT) is greater than expected given the proportion of females on
# the CU campus. This is supported by the data, which shows that the observed
# proportion (66%) vastly exceeds the probability distribution that is created
# using the wider CU student body (43.7%) as a model.

#------------------------------------------------------------------------------#
#                                    Rubric                                    #
#------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------
# 1. Find Proportion of Females for Fall 2017 Class                     | YES  |
#-----------------------------------------------------------------------|------|
# 2. Calculate Observed Proportion of Females in IQUIT                  | YES  |
#-----------------------------------------------------------------------|------|
# 3. Set Up Outcomes and Probabilities for Coin Flip                    | YES  |
#-----------------------------------------------------------------------|------|
# 4. Identify Number of Coin Flips for Generating Est. Proportion       | YES  |
#-----------------------------------------------------------------------|------|
# 5. Execute a Nested For Loop                                          | YES  |
#-----------------------------------------------------------------------|------|
# 6. Summarise Expected Distribution of Females in EBIO w/Histogram     | YES  |
#-----------------------------------------------------------------------|------|
# 7. Draw a Line for the Sample Value                                   | YES  |
#-----------------------------------------------------------------------|------|
# 8. Include Informative Annotations and Only Challenge Code            | YES  |
#-----------------------------------------------------------------------|------|
# 9. Submit Graph and R Script                                          | YES  |
#-----------------------------------------------------------------------|------|
# 10. Include Claim Based on Evidence                                   | YES  |
#-------------------------------------------------------------------------------
