FROM shizidushu/rstudio-shiny:normal

# install r packages collection

RUN Rscript -e "devtools::source_url('https://raw.githubusercontent.com/shizidushu/rstudio-plus-shiny-server-dockerfile/full/r-packages-collection.R')" \
  && Rscript -e "devtools::source_url('https://raw.githubusercontent.com/shizidushu/rstudio-plus-shiny-server-dockerfile/full/rstan.R')" \
    && rm -rf /tmp/Rtmp*