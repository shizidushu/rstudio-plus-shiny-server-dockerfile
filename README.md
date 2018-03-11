# rstudio-shiny
Simple rstudio server and shiny server build based on rocker


## master branch
add shiny server to rocker/verse

```
docker pull shizidushu/rstudio-shiny:base
```

## lite branch
add system package and sql server driver based on master branch

```
docker pull shizidushu/rstudio-shiny:lite
```

## normal
add r packages needed for deploy based on lite branch

```
docker pull shizidushu/rstudio-shiny:normal
```

## full
add more r packages for testing purpose based on normal branch

```
docker pull shizidushu/rstudio-shiny:full
```

