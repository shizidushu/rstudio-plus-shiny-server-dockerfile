# rstudio-shiny
Simple rstudio server and shiny server build based on rocker


## master branch
add shiny server to rocker/verse

```
docker pull shizidushu/rstudio-shiny:base
```

## imagemagick branch
install imagemagick based on master branch

```
docker pull shizidushu/rstudio-shiny:imagemagick
```

## lite branch
add linux packages, install imagemagick and sql server driver based on master branch

```
docker pull shizidushu/rstudio-shiny:lite
```

## normal branch
add r packages needed for deploying based on lite branch. It also has the lastest tag

```
docker pull shizidushu/rstudio-shiny:normal
docker pull shizidushu/rstudio-shiny:latest
```

## full branch
add more r packages for testing purpose based on normal branch

```
docker pull shizidushu/rstudio-shiny:full
```

