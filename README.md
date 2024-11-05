
<!-- README.md is generated from README.Rmd. Please edit that file -->

# libminer

<!-- badges: start -->

[![R-CMD-check](https://github.com/nickawbrown/libminer/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/nickawbrown/libminer/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of libminer is to provide an overview of your R library setup.
It is a toy package created as a part of a workshop and not meant for
serious use.

## Installation

You can install the development version of libminer from
[GitHub](https://GitHub.com/) with:

``` r
# install.packages("devtools")
devtools::install_GitHub("ateucher/libminer")
```

## Example usage

To get a count of installed packages in each of your library locations,
optionally with the total sizes, use the `lib_summary()` function:

``` r
library(libminer)
lib_summary()
#>                                                                    Library
#> 1                                       C:/Program Files/R/R-4.4.0/library
#> 2                          C:/Users/brownn/AppData/Local/R/win-library/4.4
#> 3 C:/Users/brownn/AppData/Local/Temp/1/RtmpqePWMO/temp_libpath4bcc75cb33bd
#>   n_packages
#> 1         29
#> 2        306
#> 3          1
```
