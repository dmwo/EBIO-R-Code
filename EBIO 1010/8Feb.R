#-------------------------------------------------------------------------------#
# Assignment: In-Class Cat Graphing, 8 February                                 #
# Author: Dylan Oh                                                              #
# Date Created; 8 February 2018                                                 #
#-------------------------------------------------------------------------------#



#-------------------------------------------------------------------------------#
#                             Creating Data Frame                               #
#-------------------------------------------------------------------------------#

# Creating data frame of cat information
dist <- c('2','3','4','5','6','7-8','9-32')
num_cats <- c(8,14,27,34,21,9,13)
avg_injury_score <- c(0.74,0.99,1.84,1.95,2.26,2.34,1.11)
cat_data <- data.frame(dist,num_cats,avg_injury_score)
#-------------------------------------------------------------------------------#



#-------------------------------------------------------------------------------#
#                            Plotting First Graph                               #
#-------------------------------------------------------------------------------#

# Plotting number of cats vs distance fallen without axes or labels
plot(x_axis,cat_data$num_cats,
     main = 'Number of Cats and Average Injury Score for Cats on Various Floors',
     xlab = '',
     ylab = '',
     axes = F,
     type = 'l',
     lwd = 2,
     col = 'red')

# Creating new LHS y-axis
axis(side = 2, at = seq(8,34,2), col = 'black')

# Creating new LHS y-axis label
mtext('Number of Cats', side = 2, line = 2.5)
#-------------------------------------------------------------------------------#



#-------------------------------------------------------------------------------#
#                                Adding Legend                                  #
#-------------------------------------------------------------------------------#

# Drawing a 'legend' because the built-in legend function doesn't work
rect(1,30,2,34)
text(labels = 'Number of Cats',1.7,32.7)
text(labels = 'Average Injury Score',1.7,31.3)
segments(1.2,32.7,1.4,32.7,
         col = 'red',
         lwd = 2)
segments(1.2,31.3,1.4,31.3,
         col = 'blue',
         lwd = 2)
#-------------------------------------------------------------------------------#



#-------------------------------------------------------------------------------#
#                            Plotting Second Graph                              #
#-------------------------------------------------------------------------------#

# Expanding margins to allow for second y-axis
par(mar = c(5,5,5,5))

# Plotting average injury score vs distance fallen without axes or labels
par(new = T)
plot(x_axis,cat_data$avg_injury_score,
     xlab = '',
     ylab= '',
     axes = F,
     type = 'l',
     lwd = 2,
     col = 'blue')

# Creating new RHS y-axis
axis(side = 4, at = seq(0.7,2.3,0.2), col = 'black')

# Creating new RHS y-axis label
mtext('Average Injury Score', side = 4, line = 2.5)
#-------------------------------------------------------------------------------#



#-----------------------------------------------------------------------------#
#                             Creating New x-axis                             #
#-----------------------------------------------------------------------------#

# Creating new x-axis
x_axis <- seq(1,7)

# Creating x-axis and label
axis(side = 1, at = x_axis,
     labels = cat_data$dist)
#-----------------------------------------------------------------------------#
