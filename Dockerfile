FROM shizidushu/rstudio-plus-shiny-server:normal

# install r packages collection
## set shiny.port = 7059 for siny gadget
RUN Rscript -e "devtools::source_url('https://raw.githubusercontent.com/shizidushu/rstudio-plus-shiny-server-dockerfile/full/r-packages-collection.R')" \
  && Rscript -e "devtools::source_url('https://raw.githubusercontent.com/shizidushu/rstudio-plus-shiny-server-dockerfile/full/rstan.R')" \
  && echo "options(shiny.port = 7059)" >> /usr/local/lib/R/etc/Rprofile.site \
  && rm -rf /tmp/Rtmp*
    
# Expose 7059 for shiny gadget
EXPOSE 7059
