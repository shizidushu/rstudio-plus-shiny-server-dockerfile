FROM shizidushu/rstudio-shiny:lite

# install basic r packages

RUN Rscript -e "devtools::source_url('https://raw.githubusercontent.com/shizidushu/rstudio-shiny/normal/basic-r-packages.R')" \
    && Rscript -e "tinytex::tlmgr_install(read_lines('https://raw.githubusercontent.com/shizidushu/rstudio-shiny/normal/latex-pkgs.txt'))" \
    && Rscript -e "tinytex::tlmgr_update()" \
    && rm -rf /tmp/Rtmp*