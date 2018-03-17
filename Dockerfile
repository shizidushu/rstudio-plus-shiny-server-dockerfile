FROM shizidushu/rstudio-shiny:lite


# http://www.imagemagick.org/script/advanced-unix-installation.php#configure
RUN cd /tmp \
  && wget --no-verbose "http://imagemagick.org/download/releases/ImageMagick-7.0.7-26.tar.xz" -O ImageMagick.tar.xz\
  && tar xf ImageMagick.tar.xz \
  && cd ImageMagick \
  && ./configure \
    --disable-static \
    --enable-shared \
    --with-gslib \
    --with-jpeg \
    --with-jp2 \
    --with-openjp2 \
    --with-png \
    --with-tiff \
    --with-quantum-depth=8 \
  && make \
  && make install \
  && ldconfig /usr/local/lib \
  && apt-get -y autoclean \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install basic r packages

RUN Rscript -e "devtools::source_url('https://raw.githubusercontent.com/shizidushu/rstudio-shiny/normal/basic-r-packages.R')" \
    && rm -rf /tmp/Rtmp*