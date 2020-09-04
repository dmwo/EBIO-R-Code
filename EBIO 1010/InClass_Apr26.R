#------------------------------------------------------------------------------#
# Assignment: In Class R 26 Apr                                                #
# Author: Dylan Oh                                                             #
# Date Created: 26 April 2018                                                  #
#------------------------------------------------------------------------------#

# Importing data
bird_data <- read.csv('chap09q04PigeonRumps.csv')

# Creating table of the data
results <- table(bird_data)

# Reversing the data
results <- rbind(results[ ,1],results[ ,2])

# Plotting
barx <- barplot(
    results,
    main = 'Survival Rates of Blue and White Tailed Pigeons',
    ylim = c(0,100),
    xaxt = 'n',
    col = c('lightblue','darkgrey'),
    beside = T
)

# Adding new x axis
axis(
    side = 1,
    at = c(2,5),
    label = c(
        'Blue',
        'White'
    )
)

# Inserting legend
legend(
    x = 3,
    y = 50,
    legend = c('Killed','Survived'),
    pch = 15,
    col = c('lightblue','darkgrey')
)

# Calculating chi-squared
chisq.test(results)

# Blue-rumped pigeons are significantly more likely to be killed by peregrine
# falcons than white-rumped pigeons due to their colour. This is supported by
# a chi-squared test which yielded a value of 130.9 with 1 degree of freedom
# and a p-value < 2.2e-16
