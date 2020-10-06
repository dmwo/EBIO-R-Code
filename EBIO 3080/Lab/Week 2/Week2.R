# Adding typeface to R
library(showtext)
dest <- file.path("C:", "Windows", "Fonts", "ARIALN.ttf")
font_add("arialn", regular = dest)
showtext_auto()

# Importing csv data
flower_data <- read.csv(file.choose(new = FALSE), header = T)
flower_data$avg_seeds <- rowMeans(flower_data[, 5:9], na.rm = T)

# Creating a subset of sunflowers and burdock, calculating mean and std
sunflower <- subset(flower_data, Scientific_name == "Helianthus annus")
burdock <- subset(flower_data, Scientific_name == "Arctium minus")
sunflower_mean <- mean(sunflower$avg_seeds)
sunflower_std <- sd(sunflower$avg_seeds)

# Constructing plot
par(bg = "#1e1d23")
par(mar = c(4.1, 5, 4.1, 5))
hist(sunflower$avg_seeds,
     main = "",
     xlab = "",
     ylab = "",
     axes = F,
     col = "#b86d07"
)
title(expression(paste("Seed Production in ", italic("Helianthus annus"))),
      family = "arialn",
      cex.main = 2,
      col.main = "#fffbf1"
)
title(xlab = "Number of Seeds",
      font.lab = 3,
      family = "arialn",
      cex.lab = 1.5,
      col.lab = "#fffbf1"
)
title(ylab = "Frequency",
      font.lab = 3,
      family = "arialn",
      cex.lab = 1.5,
      col.lab = "#fffbf1"
)
axis(side = 1, col = "#fffbf1", col.ticks = "#fffbf1", col.axis = "#fffbf1")
axis(side = 2, col = "#fffbf1", col.ticks = "#fffbf1", col.axis = "#fffbf1")
abline(v = sunflower_mean, col = "#fffbf1", lty = 1, lwd = 2)

# Constructing figure caption
text(x = 1, y = -0.5,
     lab = str_c("Figure 1: Seed count distribution (mean: ",
                 toString(signif(sunflower_mean, digits = 2)),
                 ") (σ: ±",
                 toString(signif(sunflower_std), digits = 2),
                 ") of Helianthus annus flowers."),
     family = "arialn",
     col = "#fffbf1"
)