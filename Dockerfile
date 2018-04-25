FROM shizidushu/rstudio-plus-shiny-server:lite

# install basic r packages

RUN Rscript -e "devtools::source_url('https://raw.githubusercontent.com/shizidushu/rstudio-plus-shiny-server-dockerfile/normal/basic-r-packages.R')" \
    && Rscript -e "tinytex::tlmgr_install(readr::read_lines('https://raw.githubusercontent.com/shizidushu/rstudio-plus-shiny-server-dockerfile/normal/latex-pkgs.txt'))" \
    && Rscript -e "tinytex::tlmgr_update()" \
    && rm -rf /tmp/Rtmp*