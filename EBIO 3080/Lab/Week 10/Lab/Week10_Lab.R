##Part 1##
dest = "E:/Documents/GitHub/EBIO-R-Code/EBIO 3080/Lab/Week 10/Data"
setwd(dest)
data_cont <- read.csv("D614G.continent.csv", header=T, fileEncoding = "UTF-8-BOM")
    
n <- nrow(data_cont)
unique(data_cont$Continent)

table(data_cont$Allele)
str(data_cont)

# Calculations needed for the plot
DGfreq<-table(data_cont$Allele) /n
DGfreq
DGworld_counts<-table(data_cont[,c(1,6)])
DGworld_counts
DGworld_months <-labels(DGworld_counts)$Month_Since_Start
DGworld_months
DGworld_n <- DGworld_counts[1,]+DGworld_counts[2,]
DGworld_n
Dworld_frq <- DGworld_counts [1,] / DGworld_n
Dworld_frq
Gworld_frq <- DGworld_counts [2,] / DGworld_n
Gworld_frq

# Create the plot
windows(width=5, height=8)
par(mfcol=c(2,1),mar=c(3,3,1,.2),mgp=c(1.75,.75,0),oma=c(1,1,1,1))

# Plot the allele count
plot(DGworld_months, DGworld_counts[1,], ylim=c(0,max(DGworld_counts)), col=1, type='b', xlab="Month Since Start of Pandemic", ylab="Count of Allele", main="Worldwide")

points(DGworld_months, DGworld_counts[2,],col=2,type='b')

legend("topright", legend=c("D","G"), title="Amino Acid", bty='n', col=1:2, pch=1)

### Plot the frequency of each allele over time:

plot(DGworld_months, Dworld_frq, type='b', xlab="Months Since Start of Pandemic", ylab="Allele Frequency", main="Worldwide")
points(DGworld_months, Gworld_frq,type='b',col=2)

legend("right", legend=c("D","G"), title="Amino Acid", bty='n', col=1:2, pch=1)
### Plot the frequency of each allele over time:

plot(DGworld_months, Dworld_frq, type='b', xlab="Months Since Start of Pandemic", ylab="Allele Frequency", main="Worldwide")
points(DGworld_months, Gworld_frq,type='b',col=2)

legend("right", legend=c("D","G"), title="Amino Acid", bty='n', col=1:2, pch=1)

# North America Graph Code
Month_Since_Start_NA <- data(North_America$Month_Since_Start)
head(data_cont)

# Create needed variables for plotting
North_America <- subset(data_cont, Continent="North-America")
n_NA <- nrow(North_America)
table(North_America$Allele)
str(North_America)
DGfreq_NA<-table(North_America$Allele) /n_NA
DGfreq_NA
DGworld_counts_NA<-table(North_America[,c(1,6)])
DGworld_counts_NA
DGworld_months_NA<-c("2","3","4","5","6","7","8","9","10","11")
DGworld_months_NA
DGworld_n_NA <- DGworld_counts_NA[1,]+DGworld_counts_NA[2,]
DGworld_n_NA
Dworld_frq_NA <- DGworld_counts_NA [1,] / DGworld_n_NA
Dworld_frq_NA
Gworld_frq_NA <- DGworld_counts_NA [2,] / DGworld_n_NA
Gworld_frq_NA

# Plot the Count
windows(width=5, height=8)

plot(DGworld_months_NA<-labels(DGworld_counts_NA)$Month_Since_Start, DGworld_counts_NA[1,],ylim=c(0,max(DGworld_counts_NA)),col=1,type='b',xlab="Months since start of pandemic",ylab="Counts of D or G",main="North America")
points(DGworld_months_NA, DGworld_counts_NA[2,],col=2,type='b')
legend("topright",legend=c("D","G"),title="Amino Acid",bty='n',col=1:2,pch=1)

points(DGworld_months_NA, Dworld_frq_NA[2,],col=2,type='b')
legend("topright",legend=c("D","G"),title="Amino Acid",bty='n',col=1:2,pch=1)


points(DGworld_months_NA, North_America$DGworld_counts[2,],col=2,type='b')

legend("topright", legend=c("D","G"), title="Amino Acid", bty='n', col=1:2, pch=1)

### Plot the frequency of each allele over time:

plot(DGworld_months_NA, North_America$Dworld_frq, type='b', xlab="Months Since Start of Pandemic", ylab="Allele Frequency", main="Worldwide")
points(DGworld_months, North_America$Gworld_frq[2,],type='b',col=2)

legend("right", legend=c("D","G"), title="Amino Acid", bty='n', col=1:2, pch=1)
plot(DGWorld_months_NA<-labels(NAm_counts)$Month_Since_Start, NAm_counts[1,],ylim=c(0,max(NAm_counts)),col=1,type='b',xlab="Months since start of pandemic",ylab="Counts of D or G",main="North America")
points(NAm_months, NAm_counts[2,],col=2,type='b')
legend("topright",legend=c("D","G"),title="Amino Acid",bty='n',col=1:2,pch=1)


plot(DGworld_months_NA, Dworld_frq_NA, type='b', xlab="Months Since Start of Pandemic", ylab="Allele Frequency", main="North America")
points(DGworld_months_NA, Gworld_frq_NA,type='b',col=2)
legend("right", legend=c("D","G"), title="Amino Acid", bty='n', col=1:2, pch=1)





# Africa Plot. We used the same code for North America, just using the Afric subset
#Create variables
North_America <- subset(data_cont, Continent="Africa")
n_NA <- nrow(North_America)
table(North_America$Allele)
str(North_America)
DGfreq_NA<-table(North_America$Allele) /n_NA
DGfreq_NA
DGworld_counts_NA<-table(North_America[,c(1,6)])
DGworld_counts_NA
DGworld_months_NA<-c("2","3","4","5","6","7","8","9","10","11")
DGworld_months_NA
DGworld_n_NA <- DGworld_counts_NA[1,]+DGworld_counts_NA[2,]
DGworld_n_NA
Dworld_frq_NA <- DGworld_counts_NA [1,] / DGworld_n_NA
Dworld_frq_NA
Gworld_frq_NA <- DGworld_counts_NA [2,] / DGworld_n_NA
Gworld_frq_NA

# Plot the Counts
windows(width=5, height=8)

par(mfcol=c(2,1),mar=c(3,3,1,.2),mgp=c(1.75,.75,0),oma=c(1,1,1,1))
plot(DGworld_months_NA, North_America$DGworld_counts[1,], ylim=c(0,max(DGworld_counts_NA)),
     col=1, type='b', xlab="Month Since Start of Pandemic", ylab="Count of Allele", main="Worldwide")

plot(DGworld_months_NA<-labels(DGworld_counts_NA)$Month_Since_Start, DGworld_counts_NA[1,],ylim=c(0,max(DGworld_counts_NA)),col=1,type='b',xlab="Months since start of pandemic",ylab="Counts of D or G",main="Africa")
points(DGworld_months_NA, DGworld_counts_NA[2,],col=2,type='b')
legend("topright",legend=c("D","G"),title="Amino Acid",bty='n',col=1:2,pch=1)

### Plot the frequency of each allele over time:

plot(DGworld_months_NA, Dworld_frq_NA, type='b', xlab="Months Since Start of Pandemic", ylab="Allele Frequency", main="Africa")
points(DGworld_months_NA, Gworld_frq_NA,type='b',col=2)
legend("right", legend=c("D","G"), title="Amino Acid", bty='n', col=1:2, pch=1)
