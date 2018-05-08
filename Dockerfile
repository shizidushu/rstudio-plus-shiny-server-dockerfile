FROM shizidushu/rstudio-plus-shiny-server:normal

# install r packages collection
## set shiny.port = 7059 for siny gadget
RUN Rscript -e "devtools::source_url('https://raw.githubusercontent.com/shizidushu/rstudio-plus-shiny-server-dockerfile/full/rstan.R')" \
  && echo "options(mc.cores = parallel::detectCores())\n" >> /home/rstudio/.Rprofile \
  && Rscript -e "devtools::source_url('https://raw.githubusercontent.com/shizidushu/rstudio-plus-shiny-server-dockerfile/full/r-packages-collection.R')" \
  && rm -rf /tmp/Rtmp*
