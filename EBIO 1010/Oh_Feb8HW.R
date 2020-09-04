#------------------------------------------------------------------------------#
# Assignment: 8 February R Homework                                            #
# Author: Dylan Oh                                                             #
# Date Created: 6 February 2018                                                #
#------------------------------------------------------------------------------#

# Defining information about the age groups and the percent of them online
age_groups = c("12-17","18-29","30-49","50-64","65+")
percent_online = c(93,93,81,70,38)

# Creating a data frame that contains this information
internet_access_age <- data.frame(age_groups,percent_online)

# Creating a new x vector that better portrays the information on the plot
# 1-5 for the 5 age groups
new_x_axis <- seq(1,5)

# Plotting the data
plot(new_x_axis, internet_access_age$percent_online,
     main = 'Internet Access by Age Group',
     xlab = 'Age Group',
     ylab = 'Percentage of Age Group Online December 2009',
     type = 'l',
     xaxt = 'n',
     lwd = 2,
     col = 'chartreuse4',
     ylim = c(0,100))

# Creating new labelling for the x axis
axis(1, at = new_x_axis,
     labels = internet_access_age$age_groups)
