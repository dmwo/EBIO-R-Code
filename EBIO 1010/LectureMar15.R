#------------------------------------------------------------------------------#
# Assignment: March 15 R Lecture                                              #
# Author: Dylan Oh                                                             #
# Date Created: 15 Mar 2018                                                    #
#------------------------------------------------------------------------------#

# Importing data from .csv
data <- read.csv('mercury_v2.csv')

#------------------------------------------------------------------------------#
#                          Employing the Linear Model                          #
#------------------------------------------------------------------------------#

# Creating variable species defining albacares as 0 and obesus as 1
species <- ifelse(
            data$species == 'obesus',
            yes = 1,
            no = 0
        )

# Invoking a linear model comparing mercury concentration by species
mercury_model <- lm(data$mercury_ppm ~ species)

# Saving statistics generated from the linear model
lm_stats <- summary(mercury_model)$coeff

# Making an object of the estimated effect
effect <- lm_stats[2,1]

# Making an object with the CI for the effect
CI_effect <- lm_stats[2,2] * 2


#------------------------------------------------------------------------------#
#                              Plotting the Data                               #
#------------------------------------------------------------------------------#

# Creating jitter vector
x_jitter <- jitter(species,0.25)

# Plotting the data with jitter and no x-axis
plot(
    x = x_jitter,
    y = data$mercury_ppm,
    main = 'Mercury Concentration in Two Species of Fish',
    xlab = 'Species',
    ylab = 'Mercury (ppm)',
    xlim = c(-0.4,1.4),
    ylim = c(0,3),
    xaxt = 'n'
)

axis(
    side = 1,
    at = c(0,1),
    c('Albacares','Obesus')
)

# Creating a line that connects the two means
abline(
    mercury_model,
    lwd = 2,
    col = 'navajowhite3'
)

# Creating a line that indicates the location of x = 0
abline(
    v = 0,
    lty = 3
)

# Plotting the mean of the albacares data
points(
    x = 0,
    y = mercury_model$coeff[1],
    pch = 19,
    cex = 1.5,
    col = 'royalblue'
)

# Plotting the mean of the obesus data
points(
    x = 1,
    y = mercury_model$coeff[1] + mercury_model$coeff[2],
    pch = 19,
    cex = 1.5,
    col = 'royalblue'
)


#------------------------------------------------------------------------------#
#                           Plotting the Effect Size                           #
#------------------------------------------------------------------------------#

# Plotting the effect size in relation to the null hypothesis
plot(
    x = NA,
    y = NA,
    main = 'Effect Size in Relation to the Null Hypothesis',
    xlab = 'Effect Size',
    ylab = NA,
    xlim = c(-0.5,1),
    ylim = c(0,4),
    yaxt = 'n'
)

# Plotting a line indicating the location of x = 0
abline(
    v = 0,
    lwd = 3,
    lty = 3
)

# Plotting the best estimate of effect size
points(
    x = effect,
    y = 2,
    pch = 19,
    col = 'forestgreen'
)

# Drawing the confidence interval
arrows(
    effect - CI_effect,
    2,
    effect + CI_effect,
    2,
    angle = 90,
    length = 0.1,
    code = 3
)


#------------------------------------------------------------------------------#
#                                   Rubric                                     #
#------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------
# 1. Graph the Data with Each Group as 0 or 1                           | YES  |
#-----------------------------------------------------------------------|------|
# 2. Data are Jittered for X-Axis                                       | YES  |
#-----------------------------------------------------------------------|------|
# 3. Two Means Clearly Identifiable                                     | YES  |
#-----------------------------------------------------------------------|------|
# 4. Expected Line is Drawn on Graph                                    | YES  |
#-----------------------------------------------------------------------|------|
# 5. Graph of the Effect Size and Uncertainty Rel. to Null              | YES  |
#-----------------------------------------------------------------------|------|
# 6. Axes Labelled and Correct                                          | YES  |
#-----------------------------------------------------------------------|------|
# 7. Both Graphs and Script Submitted                                   | YES  |
#-------------------------------------------------------------------------------
