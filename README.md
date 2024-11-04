
<!-- README.md is generated from README.Rmd. Please edit that file -->

# libminer

<!-- badges: start -->
<!-- badges: end -->

Created as a follow-along exercise during R Package Development Workshop, 4-6 Nov 2024.

The goal of libminer is to provide an overview of your R library setup.
It is a toy package created and not meant for serious use.

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
#>                                           Library n_packages
#> 1              C:/Program Files/R/R-4.4.0/library         29
#> 2 C:/Users/brownn/AppData/Local/R/win-library/4.4        303
```
