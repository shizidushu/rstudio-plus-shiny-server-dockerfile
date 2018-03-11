FROM shizidushu/rstudio-shiny:lite

## Install basic r packages
RUN install2.r --error --deps TRUE \
cronR dygraphs ggthemes highcharter leaflet odbc pander plotly pool pryr RJDBC shinydashboard shinyFiles writexl