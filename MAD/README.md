<!-- README.md is generated from README.Rmd. Please edit that file -->

# MAD - The ‘Make a Difference’ Package

<!-- badges: start -->
<!-- badges: end -->

The goal of the MAD package is to simplify tedious difference
calculations in numeric datasets. The ‘make_a\_difference’ function
calculates the difference between two numeric variables and reports
these values in a novel column labelled “Differences” within the
dataset.

## Installation

You can install the development version of MAD like so:

``` r
Use this code chunk to install the MAD package:
  devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-BriannaBris/MAD")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(MAD)
# The most basic example of this function, taking the difference between tree Height and Girth values.
tree_diff <- make_a_difference(trees, trees$Height, trees$Girth)
#>    Girth Height Volume Difference
#> 1    8.3     70   10.3       61.7
#> 2    8.6     65   10.3       56.4
#> 3    8.8     63   10.2       54.2
#> 4   10.5     72   16.4       61.5
#> 5   10.7     81   18.8       70.3
#> 6   10.8     83   19.7       72.2
#> 7   11.0     66   15.6       55.0
#> 8   11.0     75   18.2       64.0
#> 9   11.1     80   22.6       68.9
#> 10  11.2     75   19.9       63.8
#> 11  11.3     79   24.2       67.7
#> 12  11.4     76   21.0       64.6
#> 13  11.4     76   21.4       64.6
#> 14  11.7     69   21.3       57.3
#> 15  12.0     75   19.1       63.0
#> 16  12.9     74   22.2       61.1
#> 17  12.9     85   33.8       72.1
#> 18  13.3     86   27.4       72.7
#> 19  13.7     71   25.7       57.3
#> 20  13.8     64   24.9       50.2
#> 21  14.0     78   34.5       64.0
#> 22  14.2     80   31.7       65.8
#> 23  14.5     74   36.3       59.5
#> 24  16.0     72   38.3       56.0
#> 25  16.3     77   42.6       60.7
#> 26  17.3     81   55.4       63.7
#> 27  17.5     82   55.7       64.5
#> 28  17.9     80   58.3       62.1
#> 29  18.0     80   51.5       62.0
#> 30  18.0     80   51.0       62.0
#> 31  20.6     87   77.0       66.4
print(tree_diff)
#>    Girth Height Volume Difference
#> 1    8.3     70   10.3       61.7
#> 2    8.6     65   10.3       56.4
#> 3    8.8     63   10.2       54.2
#> 4   10.5     72   16.4       61.5
#> 5   10.7     81   18.8       70.3
#> 6   10.8     83   19.7       72.2
#> 7   11.0     66   15.6       55.0
#> 8   11.0     75   18.2       64.0
#> 9   11.1     80   22.6       68.9
#> 10  11.2     75   19.9       63.8
#> 11  11.3     79   24.2       67.7
#> 12  11.4     76   21.0       64.6
#> 13  11.4     76   21.4       64.6
#> 14  11.7     69   21.3       57.3
#> 15  12.0     75   19.1       63.0
#> 16  12.9     74   22.2       61.1
#> 17  12.9     85   33.8       72.1
#> 18  13.3     86   27.4       72.7
#> 19  13.7     71   25.7       57.3
#> 20  13.8     64   24.9       50.2
#> 21  14.0     78   34.5       64.0
#> 22  14.2     80   31.7       65.8
#> 23  14.5     74   36.3       59.5
#> 24  16.0     72   38.3       56.0
#> 25  16.3     77   42.6       60.7
#> 26  17.3     81   55.4       63.7
#> 27  17.5     82   55.7       64.5
#> 28  17.9     80   58.3       62.1
#> 29  18.0     80   51.5       62.0
#> 30  18.0     80   51.0       62.0
#> 31  20.6     87   77.0       66.4
```
