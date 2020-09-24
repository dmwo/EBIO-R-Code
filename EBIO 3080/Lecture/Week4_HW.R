library(showtext)
dest <- file.path("C:", "Windows", "Fonts", "ARIALN.ttf")
font_add("arialn", regular = dest)
showtext_auto()

data <- c(0.75, 0.05, 0.10, 0, 1.0, 0.05, 0.10, 0.25, 1.0, 1.0,
         0, 1.0, 0, 0.75, 0, 0, 0, 0.05, 0.75, 1.0,
         0, 0.50, 0.05, 1.2, 0, 1.0, 0.25, 0.05, 0.25, 0,
         0, 0.50, 1.0, 1.0, 0, 0, 0, 0, 0.05, 0,
         0, 1.0, 1.0, 0, 0, 0.75, 1.0, 0.05, 0.05, 1.0,
         0.75, 1.2, 0.10, 0, 0.50, 1.0, 1.0, 0.05, 0.50, 0.50,
         0.05, 1.0, 1.0, 1.0, 1.0, 0.10, 0, 0, 0, 0.25,
         1.0, 0.05, 1.0, 0.05, 0.75, 0.10, 0.05, 0.05, 1.0, 0,
         1.0, 0.05, 0.05, 0.75, 1.0, 0.05, 1.0, 0.05, 1.0, 0)
counts <- c(sum(data == 0), sum(data == 0.05), sum(data == 0.1),
            sum(data == 0.25), sum(data == 0.5), sum(data == 0.75),
            sum(data == 1), sum(data == 1.2))

par(bg = "#cbcbcf")
par(mar = c(4.1, 5, 4.1, 5))
barplot(counts,
     main = "",
     xlab = "",
     ylab = "",
     names.arg = c("0", "0.05", "0.1", "0.25", "0.5", "0.75", "1", "1.2"),
     axes = F,
     col = "#db8710"
)
title(main = "Effect of Spontaneous Mutation on Yeast Colony Size",
      family = "arialn",
      cex.main = 2,
      col.main = "#2c3136"
)
title(xlab = "Ratio of Experimental/Control Cell Size",
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
axis(side = 2,
     col = "#2c3136",
     col.ticks = "#2c3136",
     col.axis = "#2c3136"
)