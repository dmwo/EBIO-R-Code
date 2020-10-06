library(showtext)
library(ggplot2)
library(latex2exp)
library(reactable)
library(htmltools)
dest <- "C:/Users/Dylan/AppData/Local/Microsoft/Windows/Fonts"
font_add("hkgroteskli", regular = file.path(dest, "HKGrotesk-LightItalic.ttf"))
font_add("hkgroteskr", regular = file.path(dest, "HKGrotesk-Regular.ttf"))
font_add("hkgroteskbo", regular = file.path(dest, "HKGrotesk-Bold.ttf"))
font_add("hel", regular = file.path(dest, "Helvetica.ttf"))
font_add("heli", regular = file.path(dest, "Helvetica-Oblique.ttf"))
showtext_auto()
setwd("E:/Documents/GitHub/EBIO-R-Code/EBIO 3080/Lab/Week 6/Data")

sites <- read.csv("sites.csv", header = TRUE)

table1 <- reactable(
    sites,
    defaultSortOrder = "desc",
    defaultSorted = "ï..Site",
    showSortIcon = FALSE,
    compact = TRUE,
    pagination = FALSE,
    defaultColDef = colDef(
        headerStyle = list(
            testAlign = "left",
            fontSize = "11px",
            lineHeight = "14px",
            textTransform = "uppercase",
            color = "#0c0c0c",
            fontWeight = "500",
            borderBottom = "2px solid #e9edf0",
            paddingBottom = "3px",
            verticalAlign = "bottom",
            fontFamily = "hkgroteskbo"
        ),
        style = list(
            fontFamily = "hkgroteskr",
            fontSize = "14px",
            verticalAlign = "center",
            align = "left"
        )
    ),
    columns = list(
        ï..Site = colDef(name = "Site"),
        Total_AB. = colDef(name = paste("Total Number of Colonies in ",
                                        "Antibiotic-Negative Plate")),
        Total_AB..1 = colDef(name = paste("Total Number of Colonies in ",
                                        "Antibiotic-Positive Plate")),
        White_AB. = colDef(name = paste("Number of White Colonies in ",
                                        "Antibiotic-Negative Plate")),
        Light_Yellow_AB. = colDef(name = paste("Number of Light Yellow ",
                                               "Colonies in ",
                                               "Antibiotic-Negative Plate")),
        Dark_Yellow_AB. = colDef(name = paste("Number of Dark Yellow ",
                                              "Colonies in ",
                                              "Antibiotic-Negative Plate")),
        Pink_AB. = colDef(name = paste("Number of Pink Colonies in ",
                                       "Antibiotic-Negative Plate"))
    ),
)

.table {
    margin: 0 auto;
    width: 675px;
}
.tableTitle {
    margin: 6px 0;
    font-size: 16px;
    font-family: "hkgroteskli"
}
.tableTitleh2 {
    font-size: 16px;
    font-family: "hkgroteskbo"
}
.tableTitle p {
    font-size: 14px;
    font-weight: 500;
}

div(class = "tableTitle",
    div(class = "title",
        h2(paste("Classification of bacterial colonies in ",
                 "antibiotic-positive and -negative environments")),
        p("Observed for six sites along the Boulder Creek watershed")
    )
)