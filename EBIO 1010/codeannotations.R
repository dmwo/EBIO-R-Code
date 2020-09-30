#----------------------------------------------------------------------------#
# File: R Video Code Annotation
# Author: Dylan Oh
#
# Created on 18 January 2018, 20:58
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
#            Introduction to R: Objects, Assignments, Basic Math             #
#----------------------------------------------------------------------------#

# Variable Assignment
x <- 1           # The number 1 assigned to numeric object'x' via the op '<-'
y <- 5

# Arithmetic Operations
x + y            # x added to y; result printed to console, but not stored
add <- x + y     # same as above, but result assigned to variable 'add'

subtract <- x - y
multiply <- x * y
divide <- x / y
exp <- x ^ y

#----------------------------------------------------------------------------#
#                        Introduction to Vectors in R                        #
#----------------------------------------------------------------------------#

v <- c(1,2,3,4)     # Creating a vector using the 'c' function (concatenate)
x <- 2              # Creating a scalar using traditional assignment

# Vector Arithmetic
x + v               # Scalar + Vector = every vector element added by scalar
x - v               # S - V = every vector element subtracted by scalar
x * v               # S * V = every vector element multiplied by scalar

# Vector Information
v <- c(1,5,4,3,0,0)
class(v)            # 'Class' function identifies the type of object
length(v)           # 'Length' function calculates length of object
str(v)              # 'Str' function identifies type, indices, & value of object

#----------------------------------------------------------------------------#
#                       Introduction to Functions in R                       #
#----------------------------------------------------------------------------#

vec <-  c(5,3,2)
length(vec)

# Using '?' before a function name pulls up a documentation page
?length

# 'sqrt' function finds the square root of the value passed into it
sqrt(81)

# 'log' function finds the natural logarithm of the value passed
log(3)

# 'exp' function finds e ^ (value passed)
exp(5)

# 'round' function rounds the first value to the place of the 'digits' value
round(1.0472, digits = 2)

#----------------------------------------------------------------------------#
#                             Special Vectors in R                           #
#----------------------------------------------------------------------------#

# Using the colon operator creates a vector from 1st value to 2nd, incremented by 1
x <- 0:10

# 'seq' function accomplishes the same thing, with variable increment
y <- seq(0,10, by = 2)

# 'length.out' creates a vector of a certain length, automatically choosing increment
z <- seq(0,10, length.out = 40)

# 'rep' function replicates a vector passed in a certain amount of times
w <- rep(x,2)

# 'each' parameter replicates every element of a vector a certain amount of times
w <- rep(x, each = 2)

#----------------------------------------------------------------------------#
#                   Relational Operators and Logical Results                 #
#----------------------------------------------------------------------------#

# '==' operator checks for equality; returns 'TRUE' or 'FALSE'
1 == 1

# Using '==' with a vector checks each element for equality and returns a vector
# of the same length with 'TRUE' or 'FALSE' for each element
v <- 1:10
v == 1

# '!=' operator checks for inequality
v != 1

# '>' checks if LHS variable is greater than RHS variable
v > 5

# '>=' checks if LHS variable is greater than or equal to RHS variable
v >= 5

test <- v <= 7
class(test)
length(test)
str(test)

#----------------------------------------------------------------------------#
#                               Characters in R                              #
#----------------------------------------------------------------------------#

# Placing text inside single or double quotes creates a character object
x <- 'my text'
str(x)

# Placing characters into a vector creates a character vector
y <- c('red','green','blue')
str(y)

# Logic is performable on character vectors
y == 'red'

#----------------------------------------------------------------------------#
#                              2D Data Structures                            #
#----------------------------------------------------------------------------#

vals <- 1:10

# 'matrix' function creates a matrix from (a) vector(s) and # of rows and columns
M <- matrix(vals, nrow = 5, ncol = 2)

group <- rep(c('group_a','group_b'), 5)

# 'data.frame' combines vectors into a data structure
df <- data.frame(group,vals)

#----------------------------------------------------------------------------#
#                           Introduction to Indexing                         #
#----------------------------------------------------------------------------#

v <- c(5.5,2.3,1,0,0.8)

# Vector name followed by a number in [] yields the value(s) stored in that index
v[1:4]

mat <- matrix(1:12, nrow = 4)

# Matrix name followed by numbers in [] yields value stored in that row, column
mat[2,2]

# Leaving one argument blank yields all the values in the row/column of the other argument
mat[,3]

v[v > 1]

#----------------------------------------------------------------------------#
#                      Data Frame Indexing and Subsetting                    #
#----------------------------------------------------------------------------#

# Default data frame
iris
str(iris)

# Returns every value from row 1 to row 10
iris[1:10,]

# Returns every value in the first column
iris[,1]

# '$' operator grabs every value stored in the following variable of a data frame
iris$Sepal.Length

# Returning the values for two variables by indexing a vector of characters
iris[c('Sepal.Length','Sepal.Width')]

# Accomplishing the same as above, but only for data points from the species setosa
iris[iris$Species == 'setosa',
     c('Sepal.Length','Sepal.Width')]

#----------------------------------------------------------------------------#
#                           Introduction to R Style                          #
#----------------------------------------------------------------------------#

# i.e. where I learn that all the formatting I've done up to this point is wrong

# Spacing
x <- 9        # Spaces between operators and values
y <- 3
z <- x + y

# Run-on Lines
# Long lines like this:
iris[iris$Species == 'setosa', c('Sepal.Length','Sepal.Width')]

# Can be separated into separate lines like this:
setosa_ROWS <- iris$Species == 'setosa'
sepal_COLS <- c('Sepal.Length','Sepal.Width')
iris[setosa_ROWS, sepal_COLS]

# Workspace Management
# 'ls' function lists all objects in the global environment
ls()

# 'rm' function removes objects
rm(y)

#----------------------------------------------------------------------------#
#                           Working with Data in R                           #
#----------------------------------------------------------------------------#

# Easiest data to import is .csv files

# 'read.csv' function is used to open .csv files; creates a data structure
d <- read.csv('PATH_TO_FILE')

# Missing values are interpreted as 'NA'

# Mixing character and numeric values in a .csv file causes a mixed-type error
# where numbers are interpreted as character strings as opposed to integers

# 'is.na' function identifies 'NA' values inside of an imported data structure

#----------------------------------------------------------------------------#
#                               Plotting in R                                #
#----------------------------------------------------------------------------#

# 'plot' function plots data in y vs x cartesian form
# Has various parameters for changing plot labels and features
# 'col' determines the colour
# 'xlab' and 'ylab' label the axes
plot(x = iris$Petal.Width,
     y = iris$Petal.Length,
     xlab = 'Petal Width',
     ylab = 'Petal Length',
     col = iris$Species)

# 'jitter' function adds random error to each point
plot(x = jitter(iris$Petal.Width),
     y = iris$Petal.Length,
     xlab = 'Petal Width',
     ylab = 'Petal Length',
     col = iris$Species)

# 'hist' function creates a histogram of data
# 'breaks' function allows user to specify custom breakpoints on the x-axis
hist(iris$Petal.Length,
     breaks = seq(0,7.5,0.5))

# 'l' parameter creates a line plot
# 'p' parameter creates a dot or scatter plot
plot(sunspots, type = 'l')

x <- seq(0,10,0.1)
y <- x ^ 2 * cos(x)

# 'lines' function adds lines between points of a dot plot
plot(x,y)
lines(x,y)

# 'points' function adds points on a line plot
plot(x,y, type = 'l')
points(x,y)

err <- 5

y_MIN <- y - err
y_MAX <- y + err

# 'segments' allows user to add error bars to each data point by passing in
# minimum and maximum values of error
segments(x0 = x, x1 = x,
         y0 = y_MIN, y1 = y_MAX)

# 'abline' draws both horizontal and vertical lines
# 'lty' determines the length of the lines
abline(h = 0, lty = 2)

plot(x = iris$Sepal.Length,
     y = iris$Petal.Length,
     col = iris$Species)

# 'legend' adds a legend to a plot; pass in location of the legend, and content
# 'pch' determines the plotting character
legend('topleft',
       legend = levels(iris$Species),
       col = 1:3,
       pch = 1)

# 'text' adds text at a certain x,y location
text(7,2.5,'This is my text')

x <- seq(-3,3,0.03)
y <- exp(-(x ^ 2)) * sin(x ^ 3)

# 'cex' expands the size of the points
# 'pch' determines the type of the points
plot(x,y,
     cex = 2,
     pch = 19,
     col = 'red')

# 'colours()' will list all colours in R

# 'lwd' changes the thickness of a line
# 'lty' changes the type of the line
plot(x,y,
     type = 'l',
     lwd = 2,
     lty = 6,
     col = 'blue')

#----------------------------------------------------------------------------#
#                               Looping in R                                 #
#----------------------------------------------------------------------------#

n <- 10
res <- rep(NA,10)

# For loop syntax: incrementing variable i steps from 1 to n by 1
for(i in 1:n){
  res[i] <- i + i ^2
}

#----------------------------------------------------------------------------#
#                          Summary Statistics in R                           #
#----------------------------------------------------------------------------#

# Another default data structure in R
data(treering)
str(treering)
plot(treering)

# 'mean' calculates the mean of a set of data
mu_bar <- mean(treering)

# 'sd' calculates the standard deviation of a set of data
sigma_bar <- sd(treering)

# Creating a histogram of treering data
hist(treering)
abline(v = mu_bar,
       col = 'red',
       lty = 2,
       lwd = 3)

text(0.5,1000,
     paste("sd =",round(sigma_bar,2)))

# 'median' identifies the median of a set of data
median(treering)

# 'var' function calculates the value of the std. deviation squared
var(treering)

#----------------------------------------------------------------------------#
#                               Sampling in R                                #
#----------------------------------------------------------------------------#

# 'sample' draws elements out of vectors at random, by default does not replace
sample(1:10,3)

# Initialising some variables
sample_size <- 30
n_rep <- 10000
s_means <- rep(NA,n_rep)

# Creating a for loop that takes out sample_size amount of random points from lynx
# and calculates the mean of those points for n_rep iterations
for(i in 1:n_rep){
  my_sample <- sample(lynx,sample_size)
  s_means[i] <- mean(my_sample)
}

# Visualising the obtained data using a histogram
hist(s_means, breaks = 30)
abline(v - mean(lynx),lty = 3)

# Increasing the sample size creates a more normal distribution

#----------------------------------------------------------------------------#
#                               Debugging in R                               #
#----------------------------------------------------------------------------#

# 'setwd' sets the working directory

# Initialising some variables
coin <- c(0,1)
sample(coin,1)
flips <- 20
reps <- 100
res <- matrix(NA,nrow=reps,ncol=flips)

# Creating for loop to randomly flip a coin 20 times and repeat that 100 times
for(i in 1:reps){
  # flips coin
  tmp <- sample(coin,flips,replace = TRUE)    # must set replace TRUE
  # store result
  res[i,] <- tmp    # leaving column blank forces index to fill out each row
}

#----------------------------------------------------------------------------#
#                       Simulation: Role of Sample Size                      #
#----------------------------------------------------------------------------#

# How does the sample size affect the sampling distribution of means?
str(iris)

# Deciding number of iterations
iter <- 10000
n <- 10

# Initialising empty vector
means <- rep(NA,iter)

# Creating for loop to randomly sample 5 petal length data and store the mean
for(i in 1:iter){
  d <- sample(iris$Petal.Length,n)
  means[i] <- mean(d)
}

# Creating a histogram to display the results
hist(means)
abline(v = mean(iris$Petal.Length),
       lty = 2,
       lwd = 3,
       col = 'blue')

# As sample size increases, the bounds of the means decreases, effectively
# 'pulling' the data closer together

#----------------------------------------------------------------------------#
#                            Conveying Uncertainty                           #
#----------------------------------------------------------------------------#

# Another default data frame
str(mtcars)
plot(jitter(mtcars$cyl,0.2),mtcars$mpg,
     pch = 19,
     col = 'darkgrey')

# 'unique' removes duplicate elements of a vector or data frame
cyls <- unique(mtcars$cyl)
n_groups <- length(cyls)

# Initialising some objects
sample_mean <- rep(NA,n_groups)
cis <- matrix(nrow = n_groups,ncol = 2)

for(i in 1:n_groups){
  # Extract relevant data
  rows <- which(mtcars$cyl == cyls[i])
  observations <- mtcars$mpg[rows]
  
  # Store sample mean
  sample_mean[i] <- mean(observations)
  
  # Construct confidence interval
  stdev <- sd(observations)
  n <- length(observations)
  se_mean <- stdev / sqrt(n)
  
  # Store confidence interval
  cis[i,1] <- sample_mean[i] - 2 * se_mean
  cis[i,2] <- sample_mean[i] + 2 * se_mean
}

# Plotting the sample means for each group of data
points(x = cyls,y = sample_mean,
       col = 'red',
       cex = 2)

# Plotting the confidence intervals of the sample means
segments(x0 = cyls,x1 = cyls,
         y0 = cis[,1],y1 = cis[,2],
         col = 'red',
         lwd = 3)

#----------------------------------------------------------------------------#
#                            Differences in Means                            #
#----------------------------------------------------------------------------#

# Another default data frame
str(sleep)

y <- sleep$extra

# 'as.numeric' pulls only numeric values from a vector or data frame
group <- as.numeric(sleep$group)

# '~' operator separates the LHS and RHS in a model formula
plot(y ~ group)

y_hat1 <- mean(y[group == 1])
y_hat2 <- mean(y[group == 2])
d_hat <- y_hat1 - y_hat2

iter <- 100000
d_null <- rep(NA, iter)

for(i in 1:iter){
  # Sampling without a specified amount just rearranges group
  shuffled_group <- sample(group)
  d_null[i] <- mean(y[shuffled_group == 1]) - mean(y[shuffled_group == 2])
}

hist(d_null,breaks = seq(-4,4,0.1))
abline(v = d_hat,
       lty = 2,
       lwd = 5,
       col = 'red')