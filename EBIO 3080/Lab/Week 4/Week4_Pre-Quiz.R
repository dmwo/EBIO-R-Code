library(showtext)
dest <- file.path("C:", "Windows", "Fonts", "ARIALN.ttf")
font_add("arialn", regular = dest)
showtext_auto()

beak <- read.csv(file.choose(new = FALSE), header = T)
survive <- subset(beak, Survived == 1)
mean_all <- mean(beak$Beak_Size)
mean_survive <- mean(survive$Beak_Size)

par(bg = "#cbcbcf")
par(mar = c(4.1, 5, 4.1, 5))
hist(beak$Beak_Size,
     main = "",
     xlab = "",
     ylab = "",
     axes = F,
     col = "#db8710"
)
hist(survive$Beak_Size,
     col = "#fc5252",
     add = T
)
title(main = "Beak Size Frequency in a Population of Finches",
      family = "arialn",
      cex.main = 2,
      col.main = "#2c3136"
)
title(xlab = "Beak Size",
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
       legend = c("Entire Population", "Survivors Only"),
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
abline(v = mean_all, col = "#2c3136", lwd = 1.5)
abline(v = mean_survive, col = "#2c3136", lwd = 1.5)