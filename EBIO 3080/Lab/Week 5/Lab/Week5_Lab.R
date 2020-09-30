library(showtext)
library(ggplot2)
library(latex2exp)
dest <- "C:/Users/Dylan/AppData/Local/Microsoft/Windows/Fonts"
font_add("hkgroteskli", regular = file.path(dest, "HKGrotesk-LightItalic.ttf"))
font_add("hkgroteskr", regular = file.path(dest, "HKGrotesk-Regular.ttf"))
font_add("hkgroteskbo", regular = file.path(dest, "HKGrotesk-Bold.ttf"))
font_add("hel", regular = file.path(dest, "Helvetica.ttf"))
font_add("heli", regular = file.path(dest, "Helvetica-Oblique.ttf"))
showtext_auto()
dest <- "E:/Documents/GitHub/EBIO-R-Code/EBIO 3080/Lab/Week 5/Data"

# Reading CSV data and calculating means
CO1 <- read.csv(file.path(dest, "COIDnDs.csv"), header = TRUE)
lysin <- read.csv(file.path(dest, "LysinDnDs.csv"), header = TRUE)
mean_CO1 <- mean(CO1$DnDs_windowed, na.rm = TRUE)
mean_lysin <- mean(lysin$DnDs_windowed, na.rm = TRUE)

# Plotting Dn/Ds vs codons for lysin and CO1
fig1 <- ggplot() +
  geom_line(data = CO1,
            size = 1.2,
            aes(x = Codon, y = DnDs_windowed, color = "#72b46d")) +
  geom_line(data = lysin,
            size = 1.2,
            aes(x = Codon, y = DnDs_windowed, color = "#ad88d3")) +
  geom_hline(yintercept = 1) +
  scale_color_identity(name = "",
                       breaks = c("#72b46d", "#ad88d3"),
                       labels = c("Lysin", "CO1"),
                       guide = "legend") +
  ggtitle(TeX("$\\mathrm{D_n/D_s}$ of Lysin and CO1 Genes")) +
  xlab("Codon") +
  ylab(TeX("$\\mathrm{D_n/D_s}$")) +
  theme(plot.title = element_text(color = "#2c3136", size = 20,
                                  family = "hkgroteskbo"),
        axis.title.x = element_text(color = "#2c3136", size = 13,
                                    family = "hkgroteskli"),
        axis.title.y = element_text(color = "#2c3136", size = 13,
                                    family = "hkgroteskli"),
        legend.position = "right")
print(fig1)

# Reading CSV data and calculating percentiles/means
DnDs <- read.csv(file.path(dest, "FlyDnDs.csv"), header = TRUE)
dnds <- DnDs$DnDs
per_CO1 <- signif(length(which(mean_CO1 >= dnds))/length(dnds)*100, 2)
per_lysin <- signif(length(which(mean_lysin >= dnds))/length(dnds)*100, 2)
random <- mean(dnds, na.rm = TRUE)

# Plotting a histogram of D. melanogaster Dn/Ds
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