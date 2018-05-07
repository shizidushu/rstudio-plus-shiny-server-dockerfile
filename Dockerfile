FROM shizidushu/rstudio-plus-shiny-server:normal

# install r packages collection
## use 2 processes / 使用2个处理器线程 后续可更改
## set shiny.port = 7059 for siny gadget
RUN mkdir -p $HOME/.R/ \
  && echo "CXXFLAGS=-O3 -mtune=native -march=native -Wno-unused-variable -Wno-unused-function  -Wno-macro-redefined \n" >> $HOME/.R/Makevars \
  && echo "CXXFLAGS += -Wno-ignored-attributes -Wno-deprecated-declarations \n" >> $HOME/.R/Makevars \
  && Rscript -e "install.packages("rstan", type = "source")" \
  && echo "options(mc.cores = parallel::detectCores())\n" >> /home/rstudio/.Rprofile \
  && Rscript -e "devtools::source_url('https://raw.githubusercontent.com/shizidushu/rstudio-plus-shiny-server-dockerfile/full/r-packages-collection.R')" \
  && echo "options(shiny.port = 7059)\n" >> /usr/local/lib/R/etc/Rprofile.site \
  && rm -rf /tmp/Rtmp*
    
# Expose 7059 for shiny gadget
EXPOSE 7059
