FROM shizidushu/rstudio-shiny:normal

# install r packages collection

RUN Rscript -e "devtools::source_url('https://raw.githubusercontent.com/shizidushu/rstudio-shiny/full/r-packages-collection.R')" \
    && rm -rf /tmp/Rtmp*