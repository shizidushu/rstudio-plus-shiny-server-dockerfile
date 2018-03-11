## install rstan
## https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Mac-or-Linux
dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) dir.create(dotR)
M <- file.path(dotR, "Makevars")
if (!file.exists(M)) file.create(M)
cat("\nCXXFLAGS=-O3 -mtune=native -march=native -Wno-unused-variable -Wno-unused-function", 
    file = M, sep = "\n", append = TRUE)
## use g++ -v to check g++ version
cat("\nCXXFLAGS+=-flto -ffat-lto-objects  -Wno-unused-local-typedefs", 
    file = M, sep = "\n", append = TRUE)
cat("\nCXXFLAGS += -Wno-ignored-attributes -Wno-deprecated-declarations", 
    file = M, sep = "\n", append = TRUE)
cat(readLines(M), sep = "\n")
cat(M)



Sys.setenv(MAKEFLAGS = "-j4") 
install.packages("rstan", repos = "https://cloud.r-project.org/", dependencies=TRUE)
install.packages("rstan", type = "source")
install.packages(c("Rcpp", "rstan"), type = "source")

devtools::install_github("stan-dev/rstan", ref = "develop", subdir = "rstan/rstan", dependencies = TRUE)
