setwd('C:/Users/Dylan/Dropbox/Code/R')

stream.dat <- read.csv('stream_data.csv')

aluminum_Nederland <- stream.dat$ï..Al_Conc_Ned
aluminum_Boulder <- stream.dat$Al_Conc_Boulder

conc_Al_mean <- aggregate(Al_Conc_Boulder ~ ï..Al_Conc_Ned,
                          data = stream.dat,
                          FUN = mean)
conc_Al_mean

# Invoking t-test
ttest <- t.test(aluminum_Nederland,
                aluminum_Boulder,
                paired = TRUE)

# Plotting data
plot(
    x = aluminum_Nederland,
    y = aluminum_Boulder,
    main = '',
    xlab = 'Location',
    ylab = 'Concentration of Aluminum (mg/L)',
    las = 1
)
