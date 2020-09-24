library(showtext)
dest <- file.path("C:", "Windows", "Fonts", "ARIALN.ttf")
font_add("arialn", regular = dest)
showtext_auto()

# Estimating heritability of beak size
heritability <- read.csv(file.choose(), header = T)
mid_parent <- (heritability$father_beak + heritability$mother_beak) / 2
model <- lm(heritability$offspring ~ mid_parent)
h2 <- summary(model)$coeff[2, 1]
p <- summary(model)$coeff[2, 4]

# Plotting
par(bg = "#cbcbcf")
par(mar = c(4.1, 5, 4.1, 5))
plot(mid_parent, heritability$offspring_beak,
     main = "",
     xlab = "",
     ylab = "",
     axes = F,
     pch = 19,
     col = "#b33b3b")
title(main = "Heritability of Beak Size in a Population of Finches",
      family = "arialn",
      cex.main = 2,
      col.main = "#2c3136"
)
title(xlab = "Midparent Beak Size (mm)",
      font.lab = 3,
      family = "arialn",
      cex.lab = 1.5,
      col.lab = "#2c3136"
)
title(ylab = "Offspring Beak Size (mm)",
      font.lab = 3,
      family = "arialn",
      cex.lab = 1.5,
      col.lab = "#2c3136"
)
axis(side = 1, at = seq(8, 11, 0.5),
     col = "#2c3136",
     col.ticks = "#2c3136",
     col.axis = "#2c3136"
)
axis(side = 2, at = seq(7.5, 10.5, 0.5),
     col = "#2c3136",
     col.ticks = "#2c3136",
     col.axis = "#2c3136"
)
abline(model, lwd = 2, col = "#2c3136")

# Estimating the response, R, to selection
response <- read.csv(file.choose(), header = T)
mean_all <- mean(response$Beak_Size_1977)
mean_gen2 <- mean(na.omit(response$Beak_Size_Next_Gen))

# Plotting
par(bg = "#cbcbcf")
par(mar = c(4.1, 5, 4.1, 5))
hist(response$Beak_Size_1977,
     main = "",
     xlab = "",
     ylab = "",
     axes = F,
     col = "#db8710"
)
hist(response$Beak_Size_Next_Gen,
     col = "#fc5252",
     add = T
)
title(main = "Beak Size Frequency in a Population of Finches",
      family = "arialn",
      cex.main = 2,
      col.main = "#2c3136"
)
title(xlab = "Beak Size (mm)",
      font.lab = 3,
      family = "arialn",
      cex.lab = 1.5,
      col.lab = "#2c3136"
)
title(ylab = "Frequency",
      font.lab = 3,
      family = "arialn",
      cex.lab = 1.5,
      col.lab = "#2c3136"
)
legend("topright",
       legend = c("Generation 1", "Generation 2"),
       fill = c("#db8710", "#fc5252")
)
axis(side = 1, at = seq(5, 14, 1),
     col = "#2c3136",
     col.ticks = "#2c3136",
     col.axis = "#2c3136"
)
axis(side = 2, at = seq(0, 320, 20),
     col = "#2c3136",
     col.ticks = "#2c3136",
     col.axis = "#2c3136"
)
abline(v = mean_all, lwd = 2, col = "#2c3136")
abline(v = mean_gen2, lwd = 2, lty = 2, col = "#2c3136")

# Comparing R estimate to expected amount of evolution
R1 <- mean_gen2 - mean_all
R2 <- h2 * 0.44