#----------------------------------------------------------------------------#
# File: January 25 R Homework
# Author: Dylan Oh
#
# Created on 23 January 2018, 22:50
#----------------------------------------------------------------------------#

# Plotting petal length vs sepal length
plot(iris$Sepal.Length,iris$Petal.Length,
     main = 'Petal Length vs Sepal Length for Various Species',
     xlab = 'Sepal Length',
     ylab = 'Petal Length',
     col = iris$Species,
     cex = 0.7,
     pch = 19)

# Adding legend to the top left of the plot
legend('topleft',
       legend = levels(iris$Species),
       col = 1:3,
       pch = 19,
       cex = 0.7)

# Adding text for setosa cluster
text(4.5,2.3,'setosa')

# Adding text for versicolor cluster
text(6.5,4,'versicolor',
     col = 'red')

# Adding text for virginica cluster
text(6.8,6.3,'virginica',
     col = 'green3')

# Drawing rectangle around setosa cluster
rect(4.2,0.9,6.0,2.6)

# Drawing rectangle around versicolor cluster
rect(4.8,2.9,7.1,5.2,
     border = 'red')

# Drawing rectangle around virginica cluster
rect(4.85,4.4,8,7.1,
     border = 'green3')
