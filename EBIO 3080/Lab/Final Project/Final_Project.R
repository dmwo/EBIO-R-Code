#-----------------------------------------------------------------------------#
#                                  Overhead                                   #
#-----------------------------------------------------------------------------#
library(showtext)
library(ggplot2)
library(htmltools)
library(dplyr)
library(latex2exp)
library(tidyr)
dest1 <- "C:/Users/Dylan/AppData/Local/Microsoft/Windows/Fonts"
font_add("karla", regular = file.path(dest1, "Karla-Regular.ttf"))
setwd("E:/Documents/GitHub/EBIO-R-Code/EBIO 3080/Lab/Final Project")


#-----------------------------------------------------------------------------#
#                     Reading and Cleaning Data from CSV                      #
#-----------------------------------------------------------------------------#
# Reading csv file
data <- read.csv("survey_response.csv", fileEncoding = "UTF-8-BOM")

# Renaming columns in the data frame
names(data) <- c("Subject", "Gender", "Age", "Weight",
                 "Pers_Habits", "Pers_Days", "Pers_Amt",
                 "Parent_Drink", "Mother_Days", "Mother_Amt",
                 "Father_Days", "Father_Amt",
                 "Num_Sibs", "Sib1_Drink", "Sib1_Days", "Sib1_Amt",
                 "Sib2_Drink", "Sib2_Days", "Sib2_Amt",
                 "Sib3_Drink", "Sib3_Days", "Sib3_Amt",
                 "Sib4_Drink", "Sib4_Days", "Sib4_Amt",
                 "Sib5_Drink", "Sib5_Days", "Sib5_Amt",
                 "Sib6_Drink", "Sib6_Days", "Sib6_Amt",
                 "Sib7_Drink", "Sib7_Days", "Sib7_Amt",
                 "Sib8_Drink", "Sib8_Days", "Sib8_Amt",
                 "Sib9_Drink", "Sib9_Days", "Sib9_Amt",
                 "Sib10_Drink", "Sib10_Days", "Sib10_Amt",
                 "GP1_Drink", "GP1_Days", "GP1_Amt",
                 "GP2_Drink", "GP2_Days", "GP2_Amt",
                 "GP3_Drink", "GP3_Days", "GP3_Amt",
                 "GP4_Drink", "GP4_Days", "GP4_Amt")

data[data == ""] <- NA

# Replacing all NA/no values in personal drinking habits columns with 0
data$Pers_Days[is.na(data$Pers_Days)] <- 0
data$Pers_Amt[is.na(data$Pers_Amt)] <- "0"

# Locating column of parental drinking habits
par_idx <- match("Parent_Drink", colnames(data))
par_days_idx <- match(c("Mother_Days", "Father_Days"), colnames(data))
par_amt_idx <- match(c("Mother_Amt", "Father_Amt"), colnames(data))

# Replacing NA values in parent columns with 0 only if respondent answered "No"
# when asked if their biological parents drank
data[data[par_idx] == "No", par_days_idx] <- 0
data[data[par_idx] == "No", par_amt_idx] <- "0"

# Calculating maximum number of siblings in the data set
sib_num <- match("Num_Sibs", colnames(data))
max_sibs <- max(data[sib_num])

# Locating columns of sibling drinking habits
sib_cols <- c("Sib1_Drink", "Sib2_Drink", "Sib3_Drink", "Sib4_Drink",
              "Sib5_Drink", "Sib6_Drink", "Sib7_Drink", "Sib8_Drink",
              "Sib9_Drink", "Sib10_Drink")
sib_days_cols <- c("Sib1_Days", "Sib2_Days", "Sib3_Days", "Sib4_Days",
                   "Sib5_Days", "Sib6_Days", "Sib7_Days", "Sib8_Days",
                   "Sib9_Days", "Sib10_Days")
sib_amt_cols <- c("Sib1_Amt", "Sib2_Amt", "Sib3_Amt", "Sib4_Amt", "Sib5_Amt",
                  "Sib6_Amt", "Sib7_Amt", "Sib8_Amt", "Sib9_Amt", "Sib10_Amt")
sib_idx <- match(sib_cols, colnames(data))
sib_days_idx <- match(sib_days_cols, colnames(data))
sib_amt_idx <- match(sib_amt_cols, colnames(data))

# Clearing data of columns that exceed maximum number of siblings
data <- data[-seq(sib_idx[max_sibs + 1], sib_amt_idx[10])]
sib_idx <- sib_idx[seq(1, max_sibs)]
sib_days_idx <- sib_days_idx[seq(1, max_sibs)]
sib_amt_idx <- sib_amt_idx[seq(1, max_sibs)]

# Replacing NA values in sibling columns with 0 only if respondent answered
# "No" when asked if they had siblings that drank AND if the sibling value
# being replaced does not create a sibling when there wasn't one (i.e. if the
# number of reported siblings is less than the number of NA values)
for (i in seq(2, length(sib_amt_idx))) {
    data[data[sib_idx[i - 1]] == "Unsure" & data[sib_num] <= i - 1,
            sib_idx[i]] <- "DNE"
    data[data[sib_idx[i - 1]] == "Unsure" & data[sib_num] > i - 1,
            sib_idx[i]] <- "Unsure"
    data[data[sib_idx[i - 1]] == "No" & data[sib_num] == i - 1,
            sib_idx[i]] <- "DNE"
    data[data[sib_idx[i - 1]] == "No" & data[sib_num] == i - 1,
         sib_days_idx[i - 1]] <- 0
    data[data[sib_idx[i - 1]] == "No" & data[sib_num] == i - 1,
         sib_amt_idx[i - 1]] <- "0"
    data[data[sib_idx[i - 1]] == "No" & data[sib_num] > i - 1,
            sib_idx[i]] <- "No"
    data[data[sib_idx[i - 1]] == "No" & data[sib_num] > i - 1,
            sib_days_idx[i]] <- 0
    data[data[sib_idx[i - 1]] == "No" & data[sib_num] > i - 1,
            sib_amt_idx[i]] <- "0"
    data[data[sib_idx[i - 1]] == "No" & data[sib_num] < i - 1,
            sib_idx[i]] <- "DNE"
    data[data[sib_idx[i - 1]] == "No" & data[sib_num] < i - 1,
            sib_idx[i - 1]] <- "DNE"
    data[data[sib_idx[i - 1]] == "DNE", sib_idx[i]] <- "DNE"
    if (i == length(sib_amt_idx)) {
        data[data[sib_idx[i]] == "No" & data[sib_num] == i - 1,
             sib_idx[i]] <- "DNE"
    }
}

# Locating columns of grandparent drinking habits
gp_idx <- na.omit(match(c("GP1_Drink", "GP2_Drink", "GP3_Drink", "GP4_Drink"),
                        colnames(data)))
gp_days_idx <- na.omit(match(c("GP1_Days", "GP2_Days", "GP3_Days", "GP4_Days"),
                             colnames(data)))
gp_amt_idx <- na.omit(match(c("GP1_Amt", "GP2_Amt", "GP3_Amt", "GP4_Amt"),
                            colnames(data)))

# Carrying through "No" and "Unsure" answers through columns and replacing NA
# values with 0 only if respondent answered "No" when asked if they had
# grandparents that drank
for (i in seq_len(length(gp_idx))) {
    if (i > 1) {
        data[data[gp_idx[i-1]] == "Unsure", gp_idx[i]] <- "Unsure"
        data[data[gp_idx[i-1]] == "No", gp_idx[i]] <- "No"
    }
    data[data[gp_idx[i]] == "No", gp_days_idx[i]] <- 0
    data[data[gp_idx[i]] == "No", gp_amt_idx[i]] <- "0"
}

data$Gender[which(data$Gender != "Male" & data$Gender != "Female")] <- "Other"
data$Subject <- seq_len(nrow(data))


#-----------------------------------------------------------------------------#
#                    Performing Calculations and Analysis                     #
#-----------------------------------------------------------------------------#

mean_days <- c("", "", "", "", "")


#-----------------------------------------------------------------------------#
#                              Producing Graphs                               #
#-----------------------------------------------------------------------------#

fig1 <- ggplot(data, aes(x = Pers_Days, y = Pers_Amt)) +
    geom_point(aes(size = Father_Amt,
                   shape = Gender,
                   alpha = Father_Days),
               colour = "#65A5E2",
               position = position_jitter(w = 0.3, h = 0.3)) +
    geom_point(aes(size = Mother_Amt,
                   shape = Gender,
                   alpha = Mother_Days),
               colour = "#E57694",
               position = position_jitter(w = 0.3, h = 0.3))
    scale_size_manual(name = "Drinks Per Day",
                      values = c("0" = 1,
                                 "1 or less than 1" = 2,
                                 "2-4" = 3,
                                 "5-7" = 4,
                                 "8-10" = 5,
                                 "11+" = 6)) +
    scale_shape_manual(name = "Gender",
                       values = c("Male" = 16,
                                  "Female" = 17,
                                  "Other" = 18)) +
    ggtitle("") +
    xlab("Days Drank Some Alcohol Per Week") +
    ylab("Amount Drink Per Day") +
    theme(plot.title = element_text(color = "#2c3136", size = 16,
                                    family = "karla"),
          axis.title.x = element_text(color = "#2c3136", size = 10,
                                      family = "karla"),
          axis.title.y = element_text(color = "#2c3136", size = 10,
                                      angle = 90, family = "karla"),
          legend.title = element_text(color = "#2c3136", size = 9,
                                      family = "karla"),
          legend.position = "right",
          legend.justification = "left",
          legend.margin = margin(0,0,0,0),
          legend.box.margin = margin(-10,0,-10,-10),
          legend.key.size = unit(0.8, "line"))
print(fig1)

ggsave("test.png", units = "in", width = 5, height = 4, dpi = 1000)

fig2 <- ggplot() +
    geom_histogram(data = data,
                   color = "white",
                   aes(x = Pers_Days, fill = "#e99c9c")) +
    geom_histogram(data = data,
                   color = "white",
                   aes(x = Mother_Days, fill = "#9ba5bd")) +
    geom_histogram(data = data,
                   color = "white",
                   aes(x = Father_Days, fill = "#a3b9d3")) +
    scale_fill_identity(breaks = c("#e99c9c", "#9ba5bd", "#a3b9d3"),
                        labels = c("Subjects",
                                   "Mothers",
                                   "Fathers"),
                        guide = "legend")
print(fig2)
