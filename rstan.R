## install rstan
## https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Mac-or-Linux
dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) dir.create(dotR)
M <- file.path(dotR, "Makevars")
if (!file.exists(M)) file.create(M)
cat("\nCXXFLAGS=-O3 -mtune=native -march=native -Wno-unused-variable -Wno-unused-function  -Wno-macro-redefined",
    file = M, sep = "\n", append = TRUE)
## use g++ -v to check g++ version
## If you use g++ version 6 or higher, you may want to turn off some verbose warnings that are not relevant to Stan by executing
cat("\nCXXFLAGS += -Wno-ignored-attributes -Wno-deprecated-declarations", 
    file = M, sep = "\n", append = TRUE)
## Checking your work
cat(readLines(M), sep = "\n")
cat(M)

## Building from source
### use 2 processes / 使用2个处理器线程 后续可更改

Sys.setenv(MAKEFLAGS = "-j2")

install.packages("rstan", type = "source")
