data(Loblolly)
write.csv(Loblolly, "Loblolly.csv", quote = F, row.names = T)

lob <- read.csv("Loblolly.csv", header = T)

library(showtext)
font_add_google("Roboto Condensed", "rc")
showtext_auto()

plot(lob$age, lob$height,
     main = "",
     xlab = "",
     ylab = "",
     pch = 19,
     col = "#1a501a79")
title("Height vs Age for Loblolly Pine Trees",
      family = "rc", cex.main = 2)
title(xlab = "Loblolly Age (years)",
      font.lab = 3,
      family = "rc",
      cex.lab = 1.5)
title(ylab = "Loblolly Height (m)",
      font.lab = 3, family = "rc", cex.lab = 1.5)