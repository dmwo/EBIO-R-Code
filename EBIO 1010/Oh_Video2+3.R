#----------------------------------------------------------------------------#
# File: R Tutorials Video 2 & 3 Annotation                                   #
# Author: Dylan Oh                                                           #
#                                                                            #
# Created on 18 January 2018, 20:58                                          #
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
#                        Introduction to Vectors in R                        #
#----------------------------------------------------------------------------#

# Creating a vector labelled v using the 'c' function (concatenate) and
# assigning the values 1,2,3,4 to it
v <- c(1,2,3,4)

# Creating a scalar object labelled x and assigning the object the value 2
x <- 2

# Adding x and v together (3,4,5,6)
x + v

# Subtracting v from x (1,0,-1,-2)
x - v

# Multiplying x by y (2,4,6,8)
x * v

# Creating a vector labelled v and assigning the values 1,5,4,3,0,0 to it
v <- c(1,5,4,3,0,0)

# Identifying the type or class of the object v ("numeric")
class(v)

# Determining the length of the vector v (6)
length(v)

# Bringing up information about the vector v; class, indices, values
str(v)
