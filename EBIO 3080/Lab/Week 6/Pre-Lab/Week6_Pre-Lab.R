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
setwd("E:/Documents/GitHub/EBIO-R-Code/EBIO 3080/Lab/Week 6/Data")

paw_data <- read.csv("paw_hands.csv", header = TRUE)
human <- subset(paw_data, Source == "human")
dog <- subset(paw_data, Source == "dog")
mean_human <- mean(human$Colonies_AB_neg)
mean_dog_neg <- mean(dog$Colonies_AB_neg)
mean_dog_pos <- mean(dog$Colonies_AB_pos)
plate <- c(1, 2, 3, 4, 5, 6)
distance <- c(0, 11, 23, 35, 49, 69)
sites <- data.frame(distance, plate)

fig1 <- ggplot() +
    geom_histogram(data = human,
                   alpha = 0.5,
                   aes(x = Colonies_AB_neg, fill = "#559adf")) +
    geom_histogram(data = dog,
                   alpha = 0.5,
                   aes(x = Colonies_AB_neg, fill = "#cf4d4d")) +
    geom_vline(aes(xintercept = as.numeric(mean_human),
                   color = "#316080"),
               size = 1) +
    geom_vline(aes(xintercept = as.numeric(mean_dog_neg),
                   color = "#6d3232"),
               size = 1) +
    scale_fill_identity(name = "",
                        breaks = c("#559adf", "#cf4d4d"),
                        labels = c("Human-Sourced Colonies  ",
                                   "Dog-Sourced Colonies"),
                        guide = "legend") +
    scale_color_identity(name = "",
                         breaks = c("#316080", "#6d3232"),
                         labels = c("Human-Sourced Colonies Average  ",
                                    "Dog-Sourced Colonies Average"),
                         guide = "legend") +
    ggtitle(paste("Number and Frequency of Bacterial Colonies in",
                  "Ampicillin-Negative Environment", sep = " "),
            "Comparison between human- and dog-sourced bacteria") +
    xlab("Number of Colonies") +
    ylab("Frequency") +
    theme(plot.title = element_text(color = "#2c3136", size = 20,
                                    family = "hkgroteskbo"),
          axis.title.x = element_text(color = "#2c3136", size = 13,
                                      family = "hkgroteskli"),
          axis.title.y = element_text(color = "#2c3136", size = 13,
                                      family = "hkgroteskli"),
          legend.position = "bottom",
          legend.key.size = unit(0.8, "line"))
print(fig1)

fig2 <- ggplot() +
    geom_histogram(data = dog,
                   fill = "#426d97", alpha = 0.5,
                   aes(x = Colonies_AB_neg)) +
    geom_histogram(data = dog,
                   fill = "#864040", alpha = 0.5,
                   aes(x = Colonies_AB_pos)) +
    geom_vline(aes(xintercept = as.numeric(mean_dog_neg),
                   color = "#316080"),
               size = 1) +
    geom_vline(aes(xintercept = as.numeric(mean_dog_pos),
                   color = "#6d3232"),
               size = 1) +
    scale_color_identity(name = "",
                         breaks = c("#316080", "#6d3232"),
                         labels = c("Antibiotic-Negative Colonies Average  ",
                                    "Antibiotic-Positive Colonies Average"),
                         guide = "legend") +
    ggtitle(paste("Number and Frequency of Bacterial Colonies Collected",
                  "From Dogs", sep = " "),
            paste("Bacteria grown in agar plates in both",
                  "antibiotic-positive and negative environments")) +
    xlab("Number of Colonies") +
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

fig3 <- ggplot(sites, aes(x = distance, y = plate)) +
    geom_point(size = 4, shape = 19) +
    xlab("Distance from Site 1 (km)") +
    ylab("Sample Plate Number") +
    theme(plot.title = element_text(color = "#2c3136", size = 20,
                                    family = "hkgroteskbo"),
          axis.title.x = element_text(color = "#2c3136", size = 13,
                                      family = "hkgroteskli"),
          axis.title.y = element_text(color = "#2c3136", size = 13,
                                      family = "hkgroteskli"))
print(fig3)