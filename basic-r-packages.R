list.of.packages <- c("Rcpp",
                      "devtools",
                      "tidyverse",
                      "sjmisc",
                      "lubridate",
                      "pryr",
                      "purrr",
                      "rmarkdown",
                      "knitr",
                      "forcats",
                      "configr",
                      "readr",
                      "readxl",
                      "writexl",
                      "cronR",
                      "jsonlite",
                      "showtext",
                      "ggplot2",
                      "ggmap",
                      "ggrepel",
                      "ggthemes",
                      "colorspace",
                      "viridis",
                      "htmltools",
                      "DT",
                      "Highcharter",
                      "plotly",
                      "dygraphs",
                      "DiagrammeR",
                      "MetricsGraphics",
                      "odbc",
                      "pool",
                      "XML",
                      "tinytex",
                      "pander",
                      "magrittr",
                      "urltools"
                      )

list.of.packages <- unique(list.of.packages)

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, 
                                          repo = 'https://mirrors.tuna.tsinghua.edu.cn/CRAN/')

devtools::install_github("ricardo-bion/ggtech", dependencies=TRUE)
devtools::install_github("rstudio/httpuv")
devtools::install_github("jbkunst/highcharter")
devtools::install_github("hrbrmstr/metricsgraphics")
devtools::install_github("rstudio/crosstalk")
devtools::install_github("jcheng5/d3scatter")
devtools::install_github("rstudio/leaflet")
devtools::install_github('trestletech/plumber')


