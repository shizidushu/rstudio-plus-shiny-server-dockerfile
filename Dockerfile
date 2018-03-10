FROM rocker/verse

## Add Shiny Server
RUN export ADD=shiny && bash /etc/cont-init.d/add
