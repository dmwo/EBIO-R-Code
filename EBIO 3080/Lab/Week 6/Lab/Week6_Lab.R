library(ggplot2)
library(latex2exp)
library(reactable)
library(htmltools)
setwd("E:/Documents/GitHub/EBIO-R-Code/EBIO 3080/Lab/Week 6/Data")

sites <- read.csv("sites.csv", header = TRUE, sep = ",",
                  fileEncoding = "UTF-8-BOM")
sites$FABR <- round(sites$FABR, 3)

total_cols <- c("Total_AB_Neg", "Total_AB_Pos", "FABR")
colour_cols <- c("White_AB_Neg", "Light_Yellow_AB_Neg", "Dark_Yellow_AB_Neg",
                 "Pink_AB_Neg")
sitestbl <- sites[, c("Site", "Distance", total_cols, colour_cols)]
total_column <- function(maxWidth = 150, ...) {
    colDef(maxWidth = maxWidth, align = "center", class = "cell number", ...)
}
colour_column <- function(maxWidth = 100, ...) {
    colDef(maxWidth = maxWidth, class = "cell number", ...)
}

table1 <- reactable(
    sitestbl,
    pagination = FALSE,
    defaultSorted = "Site",
    defaultSortOrder = "asc",
    defaultColGroup = colGroup(headerClass = "group-header"),
    columnGroups = list(
        colGroup(name = "Total Number of Colonies", columns = total_cols),
        colGroup(name = paste("Number of ... Colonies in ",
                              "Antibiotic-Negative Plate"),
                 columns = colour_cols)
    ),
    defaultColDef = colDef(class = "cell", headerClass = "header"),
    columns = list(
        Site = colDef(
            name = "Site",
            align = "left",
            maxWidth = 50,
            class = "cell number",
            headerStyle = list(fontWeight = 700)
        ),
        Distance = colDef(
            name = "Distance from Site 1 (km)",
            defaultSortOrder = "asc",
            align = "center",
            maxWidth = 120,
            class = "cell number",
            headerStyle = list(fontWeight = 700)
        ),
        Total_AB_Neg = total_column(
            name = "Antibiotic-Negative Plate"
        ),
        Total_AB_Pos = total_column(
            name = "Antibiotic-Positive Plate"
        ),
        FABR = total_column(
            name = "Relative Frequency of Antibiotic Resistance"
        ),
        White_AB_Neg = colour_column(name = "White", maxWidth = 80),
        Light_Yellow_AB_Neg = colour_column(name = "Light Yellow"),
        Dark_Yellow_AB_Neg = colour_column(name = "Dark Yellow"),
        Pink_AB_Neg = colour_column(name = "Pink", maxWidth = 50)
    ),
    rowClass = JS("
        function(rowInfo, state) {
            const firstSorted = state.sorted[0]
            if (firstSorted && firstSorted.id === 'group') {
                const nextRow = state.pageRows[rowInfo.viewIndex + 1]
                    if (nextRow && rowInfo.row.group !== nextRow.group) {
                        return 'group-last'
                    }
            }
        }"
    ),
    showSortIcon = FALSE,
    borderless = TRUE,
    class = "colonies-table"
)

div(class = "colonies",
    div(class = "title",
        h2("Classification of bacterial colonies in antibiotic-positive and -negative environments"),
        "Observed for six sites along the Boulder Creek watershed"
    ),
    table1
)

'
tags$link(href = "https://fonts.googleapis.com/css?family=Karla:400,700|Fira+Mono&display=fallback", rel = "stylesheet")
'

'
.colonies {
    font-family: Karla;
    font-size: 14px;
}
.title {
    margin: 18px 0;
    font-size: 16px;
}
.title h2 {
    font-size: 20px;
    font-weight: 600;
}
.standings-table {
    margin-bottom: 20px;
}
.header,
.group-header {
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
}
.header {
    border-bottom-color: #555;
    font-size: 13px;
    font-weight: 400;
    text-transform: uppercase;
}
.header:hover,
.header[aria-sort="ascending"],
.header[aria-sort="descending"] {
    background-color: #eee;
}
.border-left {
    border-left: 2px solid #555;
}
.cell {
    box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.15);
}
.group-last .cell {
    box-shadow: inset 0 -2px 0 #555;
}
.group {
    font-size: 19px;
}
.number {
    font-family: "Fira Mono";
    font-size: 16px;
    line-height: 30px;
    white-space: pre;
}
'

'
.main-container {
    max-width: 1054px !important;
}
.contents {
    width: 1054px;
}
.page-header {
    display: none;
}
'

'
body {
    font-family: Karla;
    font-size: 12pt;
}
code {
    font-family: "Fira Mono";
}
'

# Importing csv file
bacteria_data <- read.csv("sites.csv", header = TRUE, sep = ",",
                          fileEncoding = "UTF-8-BOM")

# FABR was calculated in the csv file, but the calculation would have been:
# bacteria_data$FABR <- bacteria_data$Total_AB_Pos/bacteria_data$Total_AB_Neg

# Calculating linear model parameters for FABR vs distance
linear_model <- lm(FABR ~ Distance, data = bacteria_data)

# Plotting
plot(bacteria_data$Distance, bacteria_data$FABR,
     xlab = "Distance from Site 1 (km)",
     ylab = "Relative Frequency of Antibiotic Resistance",
     main = "Relative Frequency of Antibiotic Resistance at Different Sites")
abline(linear_model, col = "blue")

# Importing csv file
bacteria_data <- read.csv("sites.csv", header = TRUE, sep = ",",
                          fileEncoding = "UTF-8-BOM")

# FABR was calculated in the csv file, but the calculation would have been:
# bacteria_data$FABR <- bacteria_data$Total_AB_Pos/bacteria_data$Total_AB_Neg

# Calculating linear model parameters for FABR vs distance
linear_model <- lm(FABR ~ Distance, data = bacteria_data)

# Plotting
fig1 <- ggplot(bacteria_data, aes(x = Distance, y = FABR)) +
    geom_point(size = 2, shape = 19) +
    geom_smooth(method = "lm", formula = y ~ x) +
    ggtitle("Relative Frequency of Antibiotic Resistance at Different Sites",
            paste("For bacterial plates grown from bacteria collected at 6",
                  "sites across the Boulder Creek watershed")) +
    xlab("Distance from Site 1 (km)") +
    ylab("Relative Frequency of Antibiotic Resistance") +
    theme(plot.title = element_text(color = "#2c3136", size = 20,
                                    family = "karla"),
          plot.subtitle = element_text(color = "#5f6a75", size = 12,
                                       family = "karla"),
          axis.title.x = element_text(color = "#2c3136", size = 13,
                                      family = "karla",
                                      face = "italic"),
          axis.title.y = element_text(color = "#2c3136", size = 13,
                                      family = "karla",
                                      face = "italic"),
          plot.margin = unit(c(0.5, 1.5, 0.25, 0), "cm"))
print(fig1)

# Importing csv and creating dataframe
class_data <- read.csv("Lab06_plate.csv", header = TRUE)
site5 <- subset(class_data, Sample_Site_No. == 5)[4:5]

# Statistics for the data (output not shown)
mean(site5$Total_No._Colonies_AB_Neg)
sd(site5$Total_No._Colonies_AB_Neg)
percentile <- length(which(site5$Total_No._Colonies_AB_Neg <= 66)) /
              length(site5$Sample_Site_No.) * 100
quantile(site5$Total_No._Colonies_AB_Neg, c(0, 0.25, 0.5, 0.75, 1))

# Plotting
boxplot(site5$Total_No._Colonies_AB_Neg, col = c("darkblue"),
        main = "Differences in Bacterial Colony Count in Class Data",
        xlab = "Site 5 Data",
        ylab = "Bacteria Colony Count")

# Importing csv and creating dataframe
class_data <- read.csv("Lab06_plate.csv", header = TRUE)
site5 <- subset(class_data, Sample_Site_No. == 5)[4:5]

# Plotting
fig2 <- ggplot(site5,
               aes(x = Sample_Site_No., y = Total_No._Colonies_AB_Neg)) +
    geom_boxplot(width = 0.75) +
    ggtitle("Variation in Colony Counts Between Groups",
            subtitle = paste("Sampled from 32 group observations of colony",
                             "count at site 5")) +
    scale_x_discrete(name = "Sample Site Number", limits = 5) +
    ylab("Total Number of Colonies on Antibiotic-Negative Plate") +
    theme(plot.title = element_text(color = "#2c3136", size = 15,
                                    family = "karla"),
          plot.subtitle = element_text(color = "#5f6a75", size = 9,
                                       family = "karla"),
          axis.title.x = element_text(color = "#2c3136", size = 10,
                                      family = "karla",
                                      face = "italic"),
          axis.title.y = element_text(color = "#2c3136", size = 10,
                                      family = "karla",
                                      face = "italic"),
          plot.margin = unit(c(0.5, 1.5, 0.25, 0), "cm"))
print(fig2)

class_data <- read.csv("Lab06_plate.csv", header = TRUE)
site5 <- subset(class_data, Sample_Site_No. == 5)[4:5]
box_data <- unname(quantile(site5$Total_No._Colonies_AB_Neg,
                            c(0, 0.25, 0.5, 0.75, 1)))
per0 <- box_data[1]
per25 <- box_data[2]
per50 <- box_data[3]
per75 <- box_data[4]
per100 <- box_data[5]

quant_data <- data.frame(per0, per25, per50, per75, per100)

table2 <- reactable(
    quant_data,
    pagination = FALSE,
    defaultColDef = colDef(class = "cell", headerClass = "header"),
    columns = list(
        per0 = colDef(
            name = "0th Percentile",
            headerStyle = list(fontWeight = 700)
        ),
        per25 = colDef(
            name = "25th Percentile",
            headerStyle = list(fontWeight = 700)
        ),
        per50 = colDef(
            name = "50th Percentile",
            headerStyle = list(fontWeight = 700)
        ),
        per75 = colDef(
            name = "75th Percentile",
            headerStyle = list(fontWeight = 700)
        ),
        per100 = colDef(
            name = "100th Percentile",
            headerStyle = list(fontWeight = 700)
        )
    ),
    showSortIcon = FALSE,
    borderless = TRUE,
    class = "colonies-table"
)

div(class = "colonies",
    div(class = "title",
        h2("Quantile Data")
    ),
    table2
)