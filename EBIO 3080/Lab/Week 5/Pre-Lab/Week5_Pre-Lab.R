library(showtext)
dest <- file.path("C:", "Windows", "Fonts", "ARIALN.ttf")
font_add("arialn", regular = dest)
showtext_auto()
setwd("E:/Documents/GitHub/EBIO-R-Code/EBIO 3080/Lab/Week 5/Data")

flyDnDs <- read.csv("FlyDnDs.csv", header = TRUE)
meanDnDs <- mean(flyDnDs$DnDs)

par(bg = "#eee9d3")
par(mar = c(4.1, 5, 4.1, 5))
hist(flyDnDs$DnDs,
     main = "",
     xlab = "",
     ylab = "",
     axes = FALSE,
     col = "#721919"
)
title(main = "Dn/Ds of Random Genes Throughout the D. melanogaster Genome",
      family = "arialn",
      cex.main = 2,
      col.main = "#2c3136"
)
title(xlab = "Dn/Ds",
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
axis(side = 1,
     col = "#2c3136",
     col.ticks = "#2c3136",
     col.axis = "#2c3136"
)
axis(side = 2,
     col = "#2c3136",
     col.ticks = "#2c3136",
     col.axis = "#2c3136"
)
abline(v = meanDnDs, lwd = 3, col = "#2c3136")
legend("topright",
       "Mean Dn/Ds ratio",
       pch = "-",
       col = "#2c3136",
       bg = "#eee9d3",
       box.lwd = 1
)