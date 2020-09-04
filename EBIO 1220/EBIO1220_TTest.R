data <- data.frame(Visual = c(287.88,306.997,303.797,233.426,251.4978,258.5671,351.92,316.56,365.06,283.27858,357.2467,312.413,357.43),
                   Auditory = c(138.95,212.015,212.852,370.974,96.57836,111.7998,282.43,308.29,293.195,207.2893,262.3187,245.03,350.16))

treatment1 <- c(data$Visual)
treatment2 <- c(data$Auditory)
mean(treatment1)
mean(treatment2)
se <- function(x) {
    sd(x,na.rm = TRUE) / sqrt(length(x))
}
se(treatment1)
se(treatment2)
t.test(treatment2,treatment1,paired = FALSE)
(max(data$Visual) - min(data$Auditory)) / 10


set.seed(4643)
plot(jitter(rep(c(0,1), each=10)), c(treatment1, treatment2), axes=FALSE, xlim=c(-.5, 1.5),
   xlab="", ylab="")
box()
axis(side=1, at=0:1, labels=c("Visual", "Auditory"))
axis(side=2, at=seq(14,22,2))
points(c(0,1), m, pch=15, col="red")
arrows(x0=c(0,1), y0=m-se, y1=m+se, code=3, angle=90, length=.15)
