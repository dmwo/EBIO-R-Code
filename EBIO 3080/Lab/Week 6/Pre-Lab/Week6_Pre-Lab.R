library(showtext)
dest <- file.path("C:", "Windows", "Fonts", "ARIALN.ttf")
font_add("arialn", regular = dest)
showtext_auto()
setwd("E:/Documents/GitHub/EBIO-R-Code/EBIO 3080/Lab/Week 6/Data")

paw_data <- read.csv("paw_hands.csv", header = TRUE)
human <- subset(paw_data, Source == "human")
dog <- subset(paw_data, Source == "dog")

fig2 <- ggplot() +
  geom_histogram(data = DnDs,
                 color = "white", fill = "#5e6164",
                 aes(x = DnDs)) +
  geom_vline(aes(xintercept = 1, color = "#aaaaaa"), size = 1) +
  geom_vline(aes(xintercept = as.numeric(mean_CO1),
                 color = "#72b46d"),
             size = 1) +
  geom_vline(aes(xintercept = as.numeric(mean_lysin),
                 color = "#ad88d3"),
             size = 1) +
  scale_color_identity(name = "",
                       breaks = c("#72b46d", "#aaaaaa", "#ad88d3"),
                       labels = c("Lysin Average",
                                  "Random Gene Average",
                                  "CO1 Average"),
                       guide = "legend") +
  ggtitle(TeX("$\\mathrm{D_n/D_s}$ for Randomly Selected Drosophila Genes")) +
  xlab(TeX("$\\mathrm{D_n/D_s}$")) +
  ylab("Frequency") +
  theme(plot.title = element_text(color = "#2c3136", size = 20,
                                  family = "hkgroteskbo"),
        axis.title.x = element_text(color = "#2c3136", size = 13,
                                    family = "hkgroteskli"),
        axis.title.y = element_text(color = "#2c3136", size = 13,
                                    family = "hkgroteskli"),
        legend.position = "bottom",
        legend.key.size = unit(0.8, "line"))
print(fig2)