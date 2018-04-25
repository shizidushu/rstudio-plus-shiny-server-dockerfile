# rstudio-shiny
Simple rstudio server and shiny server build based on rocker


## master branch
add shiny server to rocker/verse

```
docker pull shizidushu/rstudio-plus-shiny-server:base
```

## imagemagick branch
install imagemagick based on master branch

I struggled with ImageMagick a lot of days. It seems rmarkdown require it to convert pictures sometimes.

```
docker pull shizidushu/rstudio-plus-shiny-server:imagemagick
```


## lite branch
add linux packages, install imagemagick and sql server driver based on master branch

```
docker pull shizidushu/rstudio-plus-shiny-server:lite
```

## normal branch
add r packages needed for deploying based on lite branch.

```
docker pull shizidushu/rstudio-plus-shiny-server:normal
```


## full branch
Just add more r packages for testing purpose based on normal branch

```
docker pull shizidushu/rstudio-plus-shiny-server:full
```



