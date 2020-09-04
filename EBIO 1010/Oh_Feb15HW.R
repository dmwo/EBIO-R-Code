#------------------------------------------------------------------------------#
# Assignment: 15 February R Bar Plotting Homework                              #
# Author: Dylan Oh                                                             #
# Date Created: 13 February 2018                                               #
#------------------------------------------------------------------------------#

# Importing data
library(plyr)
qual_data_visual <- read.csv("Test_data.csv")

#------------------------------------------------------------------------------#
#           Creating Single Bar Plot of Number of Students per Year            #
#------------------------------------------------------------------------------#

# Creating a vector of the years in college category
year_summary <- count(qual_data_visual$Year_in_college)

# Creating a vector that will change the order of the data to be correct
correct_order <- c(2,4,5,3,1)

# Plotting number of students vs year in college as a single bar plot
barplot(year_summary$freq[correct_order],
        names.arg = year_summary$x[correct_order],
        main = 'Number of Students vs Year in College',
        xlab = 'Year in College',
        ylab = 'Number of Students',
        col = 'deepskyblue3')


#------------------------------------------------------------------------------#
#           Creating Grouped Bar Plot of Percentage Gender Per Year            #
#------------------------------------------------------------------------------#

# Creating a table of biological sex and number per year in college
years <- table(qual_data_visual$Biological_sex,
               qual_data_visual$Year_in_college)

# Calculating total number of male and female students
num_females <- sum(years[1,])
num_males <- sum(years[2,])

# Converting discrete number of students of a gender into a percentage
percent_genders <- years / c(num_females, num_males) * 100

# Plotting percentage of students in each sex vs year in college as a grouped
# bar plot
barplot(percent_genders[,correct_order],
        beside = T,
        names.arg = year_summary$x[correct_order],
        main = 'Percentage of Students vs Year in College by Gender',
        ylab = 'Percent of Students',
        xlab = 'Year in College',
        ylim = c(0,50),
        col = 1:2)

# Adding a legend
legend('topright',
       legend = c('Females','Males'),
       pch = 15,
       col = 1:2)


#------------------------------------------------------------------------------#
#                                   Rubric                                     #
#------------------------------------------------------------------------------#

# Successfully made a bar plot -- YES

# Included relevant and informative x and y axis labels -- YES

# Made the bars a color -- YES

# Ordered the x-axis in a way that makes sense -- YES

# Added rubric at the end of script with items completed and capitalized -- YES

# Constructed a grouped bar plot for two variables -- YES
