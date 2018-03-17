FROM shizidushu/rstudio-shiny:lite


ENV MAGICK_URL "http://imagemagick.org/download/releases"
ENV MAGICK_VERSION 7.0.7-26


# http://www.imagemagick.org/script/advanced-unix-installation.php#configure
RUN apt-get update -y \
  && apt-get install -y ghostscript gnupg2 \
  && apt-get install -y --no-install-recommends \
    libx11-dev libxext-dev zlib1g-dev libfreetype6-dev libxml2-dev libpng-dev libjpeg-dev libtiff-dev\
  && gpg --keyserver pool.sks-keyservers.net --recv-keys 8277377A \
  && apt-get remove -y imagemagick \
  && cd /tmp \
  && curl -SLO "${MAGICK_URL}/ImageMagick-${MAGICK_VERSION}.tar.xz" \
  && curl -SLO "${MAGICK_URL}/ImageMagick-${MAGICK_VERSION}.tar.xz.asc" \
  && gpg --verify "ImageMagick-${MAGICK_VERSION}.tar.xz.asc" "ImageMagick-${MAGICK_VERSION}.tar.xz" \
  && tar xf "ImageMagick-${MAGICK_VERSION}.tar.xz" \
  && cd "ImageMagick-${MAGICK_VERSION}" \
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