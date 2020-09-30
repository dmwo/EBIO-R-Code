data <- read.csv('Testosterone_fathers_sons.csv')

# Extracting data
x1 <- data$Father.TS
x2 <- data$brood.size
y <- data$son.TS

# Invoking the linear model
father_model <- lm(y ~ x1)
family_model <- lm(y ~ x2)
father_family_model <- lm(y ~ x1 + x2)

# Counting the number of parameters estimated for each model
K_father <- length(father_model$coefficients)
K_family <- length(family_model$coefficients)
K_father_family <- length(father_family_model$coefficients)

# Creating vector to store each K value
K1 <- c(K_father, K_family, K_father_family)

# Getting the fit of the data to the model
SS_father <- sum(father_model$residuals ^ 2)
SS_family <- sum(family_model$residuals ^ 2)
SS_father_family <- sum(father_family_model$residuals ^ 2)

# Creating vector to store each SS value
SS <- c(SS_father, SS_family, SS_father_family)

#Getting the r-squared value for each model
r2_father <- round(summary(father_model)$r.squared, 3)
r2_family <- round(summary(family_model)$r.squared, 3)
r2_father_family <- round(summary(father_family_model)$r.squared, 3)

# Creating vector to store each R2 value
r2 <- c(r2_father, r2_family, r2_father_family)

f <- summary(father_model)$fstatistic
p_value_father <- round(pf(f[1], f[2], f[3], lower = FALSE), 3)

f <- summary(family_model)$fstatistic
p_value_family <- round(pf(f[1], f[2], f[3], lower = FALSE), 3)

f <- summary(father_family_model)$fstatistic
p_value_father_family <- round(pf(f[1], f[2], f[3], lower = FALSE), 3)

p <- c(p_value_father, p_value_family, p_value_father_family)

AIC_father <- AIC(father_model)
AIC_family <- AIC(family_model)
AIC_father_family <- AIC(father_family_model)

AIC <- c(AIC_father, AIC_family, AIC_father_family)

diff_AIC <- round(AIC - min(AIC), 2)

likelihood <- round(exp(-0.5 * diff_AIC), 4)

results <- data.frame(
    model = c(
        'Father Only',
        'Family Size',
        'Father + Family Size'
    ),
    K, SS, r2, p,
    AIC, diff_AIC,
    likelihood)

new <- results[order(-likelihood), ]

B1 <- summary(father_model)$coefficients[2,1]
SE_B1 <- summary(father_model)$coefficients[2,2]
CI_B1 <- 2 * SE_B1

B2 <- summary(family_model)$coefficients[2,1]
SE_B2 <- summary(family_model)$coefficients[2,2]
CI_B2 <- 2 * SE_B2

B3 <- summary(father_family_model)$coefficients[2,1]
SE_B3 <- summary(father_family_model)$coefficients[2,2]
CI_B3 <- 2 * SE_B3

B_values <- c(B1, B2, B3)
CI_values <- c(CI_B1, CI_B2, CI_B3)

quartz()
part(mar = c(5, 9, 4, 3))
plot(
    NA,
    NA,
    xlim = c(-2,6),
    ylim = c(0,5),
    yaxt = 'n',
    xlab = 'Extimated Effect Size',
    ylab = NA,
    main = 'Model Effect Sizes'
)

points(
    B_values,
    1:4
)

segments(
    B_values - CI_values,
    1:4,
    B_values + CI_values,
    1:4
)

axis(
    2,
    1:4,
    c(
        'Model1\nFather Only',
        'Model2\nFamily Size Only',
        'Model3\nFather',
        'Model3\nFamily Size'
    ),
    las = 1
)

abline(
    v = 0,
    lwd = 3,
    lty = 3
)
