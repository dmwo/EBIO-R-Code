#get the data
mutation <- read.csv('FatherAgeMutations.csv')

#look at the structure of the data
str(mutation)

#assign x and y variables to the predictor and response variables, respectively
Predictor <- mutation$AgeOfFather
Response <- mutation $numberOfNewMutations

#visualize the data as a scatterplot
plot(Predictor, Response, xlim=c(10,40), ylim=c(20,90), xlab="Age of father (years)", ylab="Number of mutations in offspring", las=1)

#perform a linear model analysis
model <- lm(Response ~ Predictor)
model_data <- summary(model)

#look at the data
print(model_data)

#draw a line showing the predicted value of Y
#first make a vector for Predictor from the minimum to the maximum value of Predictor
new_x <- seq(min(Predictor),max(Predictor))

#now harvest the two coefficients from the model
B0 <- summary(model)$coeff[1,1]
B1 <- summary(model)$coeff[2,1]

#calculate the predicted values of Y
pred_Y <- B0 + B1*new_x

#draw a line showing the predicted values of Y
lines(new_x, pred_Y, lwd=2)

#use the function predict to generate the confidence interval around the predicted (estimated mean) values of Y

#next use predict fucntion and replace the Predictor axis with the new axis (from above) and use the confidence argument for interval
predicted <- predict(model, newdata=data.frame(Predictor=new_x), interval="confidence")

#now plot the upper and lower confidence interval for the predicted (estimated mean value of Y) for each value of X
lines(new_x,predicted[ ,2],lty=3)
lines(new_x,predicted[ ,3],lty=3)

#the confidence interval estimates the uncertainty of the expected value of y (number of mutations in the offspring) for each value of father's age ranging from 15 to 37
