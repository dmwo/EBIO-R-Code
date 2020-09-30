#training script for linear models involving a comparison of two means

#get the data
student_data <- read.csv("student_data_cleaned.csv")
str(student_data)

#we will look at the difference in cell phone use between males and females
#convert male and female to 0 and 1
#the ifelse function works by setting a condition and assigning a value and if the condition is not met is assigns a different value
sex <- ifelse(student_data$Sex == "Female", yes=1, no=0)

#now we can use a linear model. We will use the function lm

model_phone_sex <- lm(student_data$Smartphone_hours_day ~ sex)  #this reads smartphone use depends on sex

#summarize the results of the analysis
summary(model_phone_sex)

#lets plot the data
plot(sex, student_data$Smartphone_hours_day)

#notice that you can't see a lot of the data because it's hidden behind other points...we can do what is known as jittering.
#in this case we will add or subtract a small amount to each of the x values (0 and 1) so we can see all the data
new_x <- jitter(sex,0.25)
plot(new_x, student_data$Smartphone_hours_day)

#obviously we need to clean up the graph by changing the x-axis, labeling etc
plot(new_x, student_data$Smartphone_hours_day, xaxt="n", las=1, xlim=c(-0.4,1.4), ylim=c(0,14), xlab="Sex", ylab="Cell phone use (hours/day)")
axis(1, c(0,1), c("Male","Female"))

#plot the line showing the difference in means on the graph
abline(model_phone_sex)

#put a vertical line at x = 0
abline(v=0, lty=3)

#use the coefficients from the model to put the means for each sex on the graph
#we can get the coefficients from the model using model_phone_sex$coeff[1] and model_phone_sex$coeff[2]
print(model_phone_sex$coeff)

#so remember from the reading that the y-intercept is the mean for x = 0 is the mean for males so we use the first coefficient and plot it on the graph using points. WE are going to use a filled circle and make is slightly bigger than the individual observations
points(0, model_phone_sex$coeff[1], pch=19, cex=1.5)

#recall that the second coefficient is the estimated parameter, namely the difference in means so we add the difference in means to the y-intercept to get the mean for females
points(1, model_phone_sex$coeff[1]+model_phone_sex$coeff[2], pch=19, cex=1.5)

#you can also look at the data using a boxplot (you should look up what the different lines, shapes, and points represent)
boxplot(sex, student_data$Smartphone_hours_day, names=c("Male","Female"), ylab="Cell phone use (hours/day)")
