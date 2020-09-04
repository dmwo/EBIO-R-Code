#--------Investigating the expectations of the null----

#---we will work with two models

#Biological hypothesis: differences in height = sex + error
#This is a more complex hypothesis than the null and posits that there are two groups (or populations) and each has a different mean height

#Null hypothesis: difference in height = error
#This is the simplest possible hypothesis and posits that there is only one group (one mean) and any observed difference simply reflects random sampling error

#we will work with data from last years class
student_height <- read.csv("Sex_height.csv")

#check out the structure
str(student_height)

#there are two variables: height (cm) and whether an individual is female or male
#lets count the number of males and females
n_males <- sum(student_height$Sex=="Male")
n_females <- sum(student_height$Sex=="Female")

#lets figure out the mean height for the males
#we are going to use a boolean argument and indexing to do this
#boolean arguments return true or false 
#the following is a boolean argument
student_height$Sex=="Male"

#notice that the computer returned FALSE and TRUE. At every place in the Sex vector where student_height$Sex was NOT = "Male", there is a FALSE. Where student_height$Sex=="Male" returnes TRUE.

#We can use this information to index the Height_cm vector.
#so if we write
student_height$Height_cm[student_height$Sex=="Male"]
#notice you get numbers. These are all the heights for the males. 

#so we can calculate the mean height of males and females
mean_height_male <- mean(student_height$Height_cm[student_height$Sex=="Male"])
mean_height_female <- mean(student_height$Height_cm[student_height$Sex=="Female"])

#now we can calculate the observed effect of sex (the parameter of interest)
dif_mean_height_mf <- mean_height_male - mean_height_female


#so how do we evaluate the null hypothesis
#in this study we sampled 25 males and 38 females and we discovered a difference in height. What if we sampled 25 individuals and calculated the mean and the 38 individuals and calculate the mean randomly from the population without regard to sex. How big is the mean difference? Lets do it once first.

#first we randomized the order of individual heights
#we need the total number of individuals
n_total <- n_males + n_females
rand_order <- sample(student_height$Height_cm, n_total)

#now we sample 24 individuals and put them into one group and put the remaining individuals in the other group
group_1 <- rand_order[1:n_males]
group_2 <- rand_order[(n_males+1):n_total]

#whats are the mean heights and the difference in mean heights
mean_group_1 <- mean(group_1)
mean_group_2 <- mean(group_2)
dif_means_grp1_grp2 <- mean_group_1 - mean_group_2

#in this case, this is the expected difference in means due to random sampling (the expectation of the null)

#obviously we need to do this many many times and generate the expectation distribution of the difference in means due to random sampling error. To do this, we will use simulation with the aid of a for loop

#first lets set the number of replicate simulations...we will use 10000
n_iterations <- 10000

#lets make a place to store the difference in mean for each simulation
dif_means_grp1_grp2 <- rep(NA, n_iterations)  

#now we will run a for loop
for (i in 1:n_iterations){
  rand_order <- sample(student_height$Height_cm, n_total)
  
  #now we sample 24 individuals and put them into one group and put the remaining individuals in the other group
  group_1 <- rand_order[1:n_males]
  group_2 <- rand_order[(n_males+1):n_total]
  
  #whats are the mean heights and the difference in mean heights
  mean_group_1 <- mean(group_1)
  mean_group_2 <- mean(group_2)
  dif_means_grp1_grp2[i] <- mean_group_1 - mean_group_2
}

#now lets summarize the expected distribution of the differences in means for the null hypothesis
hist(dif_means_grp1_grp2, col="light blue", xlab="Difference in means", main="Expectations of null", ylab="Count", las=1)

#lets see how this compares to the observed difference in means (the biological hypothesis)
abline(v=dif_mean_height_mf, lwd=3, col="blue")

#because the observed difference in means between males and females falls OUTSIDE of the expectations of the null, we can refute the null and accept the biological hypothesis: namely that the is an effect of sex on height




