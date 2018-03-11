FROM shizidushu/rstudio-shiny:normal

## Install basic r packages
RUN install2.r --error --deps TRUE \
addinslist bookdown KernSmooth caret clValid d3heatmap devtools factoextra flexdashboard \\
forcats forecast formatR fpc GGally ggraph glmnet googleVis haven huxtable kableExtra \\
mclust modelr multcomp NbClust nycflights13 openxlsx pheatmap prophet pvclust quantmod \\
randomForest readr remotes rgl rJava RMySQL RODBC rstan rticles rvest rworldmap survminer \\
vcd viridis viridisLite XLConnect xlsx XML xtable xts