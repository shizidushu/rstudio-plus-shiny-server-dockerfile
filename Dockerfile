FROM shizidushu/rstudio-shiny:lite

# install basic r packages

RUN Rscript -e "devtools::source_url('https://raw.githubusercontent.com/shizidushu/rstudio-shiny/normal/basic-r-packages.R')" \
    && rm -rf /tmp/Rtmp*