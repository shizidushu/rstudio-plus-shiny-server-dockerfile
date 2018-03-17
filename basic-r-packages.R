list.of.packages <- c("cronR",
                      "DT",
                      "dygraphs",
                      "ggmap",
                      "ggrepel",
                      "ggthemes",
                      "highcharter",
                      "leaflet",
                      "odbc",
                      "pander",
                      "plotly",
                      "pool",
                      "pryr",
                      "RJDBC", 
                      "shinydashboard",
                      "shinyFiles",
                      "tidyverse",
                      "writexl")

list.of.packages <- unique(list.of.packages)

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

devtools::install_github("rstudio/httpuv")

## ggtech cause rstudio server addins turns grey (2017.12.14)
# devtools::install_github("ricardo-bion/ggtech", dependencies=TRUE)


library(tinytex)

## Install misssing latex package for texi2dvi
tlmgr_install(c("ctex", "dvisvgm", "environ", "fandol", "mathtools", "pgf", "preview", "trimspaces", "ulem", "xcolor", "xecjk", "zhnumber"))
