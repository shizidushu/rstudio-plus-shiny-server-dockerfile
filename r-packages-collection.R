list.of.packages <-
  c(
    "addinslist",
    "bookdown",
    "downloader",
    "inline",
    "Rcpp",
    "RcppEigen",
    "StanHeaders",
    "KernSmooth",
    "caret",
    "clValid",
    "coda",
    "cronR",
    "d3heatmap",
    "dbplyr",
    "dbscan",
    "devtools",
    "DT",
    "dygraphs",
    "factoextra",
    "flexdashboard",
    "forcats",
    "forecast",
    "foreign",
    "formatR",
    "fpc",
    "GGally",
    "ggmap",
    "ggplot2",
    "ggraph",
    "ggrepel",
    "ggthemes",
    "ggvis",
    "glmnet",
    "googleVis",
    "haven",
    "highcharter",
    "huxtable",
    "kableExtra",
    "leaflet",
    "lubridate",
    "mclust",
    "modelr",
    "multcomp",
    "NbClust",
    "nycflights13",
    "odbc",
    "openxlsx",
    "pander",
    "pheatmap",
    "plotly",
    "pool",
    "prophet",
    "pryr",
    "pvclust",
    "quantmod",
    "randomForest",
    "Rcpp",
    "RcppEigen",
    "readr",
    "remotes",
    "rgl",
    "rJava",
    "RJDBC",
    "RMySQL",
    "RODBC",
    "rstan",
    "rticles",
    "rvest",
    "rworldmap",
    "shinydashboard",
    "shinyFiles",
    "survminer",
    "tidyverse",
    "vcd",
    "viridis",
    "viridisLite",
    "writexl",
    "XLConnect",
    "xlsx",
    "XML",
    "xtable",
    "xts"
  )

list.of.packages <- unique(list.of.packages)

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

## if some packages failed to install, reinstall with dependencies = TRUE
# new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
# if(length(new.packages)) install.packages(new.packages, dependencies=TRUE)

devtools::install_github("rstudio/httpuv")
devtools::install_github("rstudio/shiny")
#devtools::install_github('ricardo-bion/ggtech')
devtools::install_github('rstudio/blogdown')

blogdown::install_hugo()