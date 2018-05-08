FROM shizidushu/rstudio-plus-shiny-server:lite

# install basic r packages

RUN Rscript -e "devtools::source_url('https://raw.githubusercontent.com/shizidushu/rstudio-plus-shiny-server-dockerfile/normal/basic-r-packages.R')" \
    && Rscript -e "tinytex::tlmgr_install(readr::read_lines('https://raw.githubusercontent.com/shizidushu/rstudio-plus-shiny-server-dockerfile/normal/latex-pkgs.txt'))" \
    && Rscript -e "tinytex::tlmgr_update()" \
    && echo "options(shiny.port = 7059)\n" >> /usr/local/lib/R/etc/Rprofile.site \
    && rm -rf /tmp/Rtmp*
 
EXPOSE 7059
