#------------------------------------------------------------------------------#
# Assignment: March 15 R Homework                                              #
# Author: Dylan Oh                                                             #
# Date Created: 14 Mar 2018                                                    #
#------------------------------------------------------------------------------#

# Importing data from .csv
data <- read.csv('student_data_cleaned.csv')

#------------------------------------------------------------------------------#
#                          Employing the Linear Model                          #
#------------------------------------------------------------------------------#

# Creating variable sex defining male as 0 and female as 1
hike <- ifelse(
            data$Nature_hike_week == 'Yes',
            yes = 1,
            no = 0
        )

# Invoking a linear model comparing marijuana consumption by sex
marijuana_model <- lm(data$Marijuana_week ~ hike)

# Looking at the results of the test
summary(marijuana_model)


#------------------------------------------------------------------------------#
#                              Plotting the Data                               #
#------------------------------------------------------------------------------#

# Creating jitter vector
x_jitter <- jitter(hike,0.25)

# Plotting the data with jitter and no x-axis
plot(
    x_jitter,
    data$Marijuana_week,
    main = 'Marijuana Consumption Per Week By Sex',
    xlab = 'Hike Every Week',
    ylab = 'Marijuana Use per Week',
    xlim = c(-0.4,1.4),
    ylim = c(0,14),
    xaxt = 'n',
    las = 1
)

# Creating background colour for the plot
rect(
    par("usr")[1],
    par("usr")[3],
    par("usr")[2],
    par("usr")[4],
    col = 'floralwhite'
)

# Reapplying data points
points(
    x_jitter,
    data$Marijuana_week,
    col = 'forestgreen'
)

# Creating x-axis, replacing 0 and 1 with no and yes
axis(
    side = 1,
    at = c(0,1),
    c('No','Yes')
)

# Creating a line that connects the two means
abline(
    marijuana_model,
    lwd = 2,
    col = 'navajowhite3'
)

# Creating a line that indicates the location of x = 0
abline(
    v = 0,
    lty = 3
)

# Plotting the mean of the no data
points(
    x = 0,
    y = marijuana_model$coeff[1],
    pch = 19,
    cex = 1.5,
    col = 'royalblue'
)

# Plotting the mean of the yes data
points(
    x = 1,
    y = marijuana_model$coeff[1] + marijuana_model$coeff[2],
    pch = 19,
    cex = 1.5,
    col = 'royalblue'
)


# The Intercept Estimate is the mean for the marijuana consumption Values
# among people who did not hike every week. The hike Estimate is the difference
# between the former value and people who did hike every week. The standard
# error represents the uncertainty in the mean. The t value and p value are
# other measures of uncertainty. The fact that the p value is significantly
# greater than 0.05 indicates that there is likely no significant difference
# in marijuana consumption between people who do and do not hike every week.

#------------------------------------------------------------------------------#
#                                   Rubric                                     #
#------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------
# 1. Load the Data                                                      | YES  |
#-----------------------------------------------------------------------|------|
# 2. Hike/week Data Transformed into 0 and 1                            | YES  |
#-----------------------------------------------------------------------|------|
# 3. Construct the Model                                                | YES  |
#-----------------------------------------------------------------------|------|
# 4. Ensure Each of the Values is Recognised                            | YES  |
#-----------------------------------------------------------------------|------|
# 5. Jitter X-Values and Save as New Vector                             | YES  |
#-----------------------------------------------------------------------|------|
# 6. Make a Plot of the Data and Replace X-Axis                         | YES  |
#-----------------------------------------------------------------------|------|
# 7. Plot Axes Correct and Graph Looks Good                             | YES  |
#-----------------------------------------------------------------------|------|
# 8. Draw Model Predictions on Graph                                    | YES  |
#-----------------------------------------------------------------------|------|
# 9. Put Means on Graph                                                 | YES  |
#-----------------------------------------------------------------------|------|
# 10. Each Line of Code has Annotation                                  | YES  |
#-----------------------------------------------------------------------|------|
# 11. Submit Code and Picture of Graph                                  | YES  |
#-----------------------------------------------------------------------|------|
# 12. Add Something to Graph Extra Credit                               | NO   |
#-------------------------------------------------------------------------------
