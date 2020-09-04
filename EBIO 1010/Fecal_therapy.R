#fecal therapy study from van Nood et al. 2013
fecal_data <- data.frame(treatment=c(rep("fecal",16), rep("vanco",13), rep("vanco+lavage",13)), outcome=c(rep(1,15),0,rep(1,4),rep(0,9),rep(1,3),rep(0,10)))

#or you can load the data as a csv file (fecal_data.csv)

#perform an analysis of variance
aov_model <- aov(outcome ~ treatment, data=fecal_data)

#summarize the data
summary(aov_model)

#compare the means for the three groups
aov_data <- TukeyHSD(aov_model)

#calculate the mean for each group
means <- rep(NA, 3)
groups <- c("fecal","vanco","vanco+lavage")

for (i in 1:3){
  means[i] <- mean(fecal_data$outcome[fecal_data$treatment==groups[i]])
}

#make a plot of the data and indicate which groups are different
barx <- barplot(means, col="grey", names=groups, las=1, ylim=c(0,1.1), ylab="Proportion infections resolved")

#write the labels for different statistical groups above each bar
#there are two groups based on the aov_data: A and B
stat_groups <- c("A",rep("B", 2))
text(barx, means+0.1, stat_groups)


