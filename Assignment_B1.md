Assignment B1
================

The following code chunk is required to load in packages used within
this assignment.

``` r
# Load libraries required to run function
library(datateachr)
library(testthat)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following object is masked from 'package:testthat':
    ## 
    ##     matches

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(tidyverse)
```

    ## ── Attaching packages
    ## ───────────────────────────────────────
    ## tidyverse 1.3.2 ──

    ## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
    ## ✔ tibble  3.1.8     ✔ stringr 1.4.1
    ## ✔ tidyr   1.2.1     ✔ forcats 0.5.1
    ## ✔ readr   2.1.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ readr::edition_get()   masks testthat::edition_get()
    ## ✖ dplyr::filter()        masks stats::filter()
    ## ✖ purrr::is_null()       masks testthat::is_null()
    ## ✖ dplyr::lag()           masks stats::lag()
    ## ✖ readr::local_edition() masks testthat::local_edition()
    ## ✖ tidyr::matches()       masks dplyr::matches(), testthat::matches()

# Exercise 1/2 - Documenting the Creation of my New Function

## Introducing the ‘Make a Difference’ Function:

This function calculates the difference between 2 variables, then
creates a new column to hold this data in the dataset.

``` r
#' @description Introducing the 'Make a Difference' Function - This function calculates the difference between 2 variables, then creates a new column to hold these calculations in the dataset. 

#' INPUTS:
#' @param data The dataset containing the chosen variables to apply this function on
#' @param col1 The first chosen column/variable within the dataset.  It must contain only numeric values.
#' @param col2 The second chosen column/variable within the dataset. It must contain only numeric values.

#' OUTPUTS:
#' @result The creation of a "Difference" column in the dataset containing the calculated differences of all the data points between the 2 variables

make_a_difference <- function(data, col1, col2, ...) {
  if(!is.numeric(col1)) {
    stop("Sorry, but this function only works on numeric inputs for col1! You input a variable of class: ", class(col1))
  }
  if(!is.numeric(col2)) {
    stop("Sorry, but this function only works on numeric input for col2! You input a variable of class: ", class(col2))
  }
  result <- (mutate(data, Difference = col1-col2))
  print(result)
  }
```

# Exercise 3 - Use Examples

## Example 1

``` r
# An example using the cancer_samples dataset, selecting only for the desired variables, and reporting the difference between perimeter_worst and perimeter_mean in malignant samples only
example1 <- cancer_sample %>% 
  select(c(diagnosis, perimeter_mean, perimeter_worst)) %>% 
  make_a_difference(cancer_sample$perimeter_worst, cancer_sample$perimeter_mean) %>% 
  filter(diagnosis == "M")
```

    ## # A tibble: 569 × 4
    ##    diagnosis perimeter_mean perimeter_worst Difference
    ##    <chr>              <dbl>           <dbl>      <dbl>
    ##  1 M                  123.            185.        61.8
    ##  2 M                  133.            159.        25.9
    ##  3 M                  130             152.        22.5
    ##  4 M                   77.6            98.9       21.3
    ##  5 M                  135.            152.        17.1
    ##  6 M                   82.6           103.        20.8
    ##  7 M                  120.            153.        33.6
    ##  8 M                   90.2           111.        20.4
    ##  9 M                   87.5           106.        18.7
    ## 10 M                   84.0            97.6       13.7
    ## # … with 559 more rows

## Example 2

``` r
# An example using the penguins dataset with variables containing numeric and NA values
Adelie <- palmerpenguins::penguins %>% 
  filter(species == "Adelie")
# After filtering for only the Adelie species, used the make_a_difference function to calculate the difference between bill length and depth
example2 <- Adelie %>% 
  make_a_difference(Adelie$bill_length_mm, Adelie$bill_depth_mm)
```

    ## # A tibble: 152 × 9
    ##    species island    bill_length_mm bill_d…¹ flipp…² body_…³ sex    year Diffe…⁴
    ##    <fct>   <fct>              <dbl>    <dbl>   <int>   <int> <fct> <int>   <dbl>
    ##  1 Adelie  Torgersen           39.1     18.7     181    3750 male   2007    20.4
    ##  2 Adelie  Torgersen           39.5     17.4     186    3800 fema…  2007    22.1
    ##  3 Adelie  Torgersen           40.3     18       195    3250 fema…  2007    22.3
    ##  4 Adelie  Torgersen           NA       NA        NA      NA <NA>   2007    NA  
    ##  5 Adelie  Torgersen           36.7     19.3     193    3450 fema…  2007    17.4
    ##  6 Adelie  Torgersen           39.3     20.6     190    3650 male   2007    18.7
    ##  7 Adelie  Torgersen           38.9     17.8     181    3625 fema…  2007    21.1
    ##  8 Adelie  Torgersen           39.2     19.6     195    4675 male   2007    19.6
    ##  9 Adelie  Torgersen           34.1     18.1     193    3475 <NA>   2007    16  
    ## 10 Adelie  Torgersen           42       20.2     190    4250 <NA>   2007    21.8
    ## # … with 142 more rows, and abbreviated variable names ¹​bill_depth_mm,
    ## #   ²​flipper_length_mm, ³​body_mass_g, ⁴​Difference

## Example 3

``` r
# The most basic version of this function, taking the difference between tree Height and Girth values.
example3 <- make_a_difference(trees, trees$Height, trees$Girth)
```

    ##    Girth Height Volume Difference
    ## 1    8.3     70   10.3       61.7
    ## 2    8.6     65   10.3       56.4
    ## 3    8.8     63   10.2       54.2
    ## 4   10.5     72   16.4       61.5
    ## 5   10.7     81   18.8       70.3
    ## 6   10.8     83   19.7       72.2
    ## 7   11.0     66   15.6       55.0
    ## 8   11.0     75   18.2       64.0
    ## 9   11.1     80   22.6       68.9
    ## 10  11.2     75   19.9       63.8
    ## 11  11.3     79   24.2       67.7
    ## 12  11.4     76   21.0       64.6
    ## 13  11.4     76   21.4       64.6
    ## 14  11.7     69   21.3       57.3
    ## 15  12.0     75   19.1       63.0
    ## 16  12.9     74   22.2       61.1
    ## 17  12.9     85   33.8       72.1
    ## 18  13.3     86   27.4       72.7
    ## 19  13.7     71   25.7       57.3
    ## 20  13.8     64   24.9       50.2
    ## 21  14.0     78   34.5       64.0
    ## 22  14.2     80   31.7       65.8
    ## 23  14.5     74   36.3       59.5
    ## 24  16.0     72   38.3       56.0
    ## 25  16.3     77   42.6       60.7
    ## 26  17.3     81   55.4       63.7
    ## 27  17.5     82   55.7       64.5
    ## 28  17.9     80   58.3       62.1
    ## 29  18.0     80   51.5       62.0
    ## 30  18.0     80   51.0       62.0
    ## 31  20.6     87   77.0       66.4

# Exercise 4 - Testing my Function

Below I perform 4 tests to attack my function using the `testthat()`.
Here, I am checking to see if my function returns error messages when
expected and produces the expected output when used correctly.

## Test 1

This test is to ensure that when a non-numeric variable is passed into
the *col1* parameter, an error message is returned.

``` r
test_that("Function returns error if non-numerical input passed into col1", {
  expect_error(make_a_difference(cancer_sample, cancer_sample$diagnosis, cancer_sample$radius_mean))
})
```

    ## Test passed 🎉

## Test 2

This test is to ensure that when a non-numeric variable is passed into
*col2* parameter, an error message is returned.

``` r
test_that("Function returns error message if non-numerical input passed into col2", {
  expect_error(make_a_difference(cancer_sample, cancer_sample$radius_mean, cancer_sample$diagnosis))
})
```

    ## Test passed 🥇

## Test 3

This test is designed to confirm a tibble is being printed following use
of the function.

``` r
test_that("Function successfully prints a tibble", {
  expect_true(is.tibble(make_a_difference(cancer_sample, cancer_sample$texture_worst, cancer_sample$texture_mean)))
})
```

    ## # A tibble: 569 × 33
    ##          ID diagnosis radius_m…¹ textu…² perim…³ area_…⁴ smoot…⁵ compa…⁶ conca…⁷
    ##       <dbl> <chr>          <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
    ##  1   842302 M               18.0    10.4   123.    1001   0.118   0.278   0.300 
    ##  2   842517 M               20.6    17.8   133.    1326   0.0847  0.0786  0.0869
    ##  3 84300903 M               19.7    21.2   130     1203   0.110   0.160   0.197 
    ##  4 84348301 M               11.4    20.4    77.6    386.  0.142   0.284   0.241 
    ##  5 84358402 M               20.3    14.3   135.    1297   0.100   0.133   0.198 
    ##  6   843786 M               12.4    15.7    82.6    477.  0.128   0.17    0.158 
    ##  7   844359 M               18.2    20.0   120.    1040   0.0946  0.109   0.113 
    ##  8 84458202 M               13.7    20.8    90.2    578.  0.119   0.164   0.0937
    ##  9   844981 M               13      21.8    87.5    520.  0.127   0.193   0.186 
    ## 10 84501001 M               12.5    24.0    84.0    476.  0.119   0.240   0.227 
    ## # … with 559 more rows, 24 more variables: concave_points_mean <dbl>,
    ## #   symmetry_mean <dbl>, fractal_dimension_mean <dbl>, radius_se <dbl>,
    ## #   texture_se <dbl>, perimeter_se <dbl>, area_se <dbl>, smoothness_se <dbl>,
    ## #   compactness_se <dbl>, concavity_se <dbl>, concave_points_se <dbl>,
    ## #   symmetry_se <dbl>, fractal_dimension_se <dbl>, radius_worst <dbl>,
    ## #   texture_worst <dbl>, perimeter_worst <dbl>, area_worst <dbl>,
    ## #   smoothness_worst <dbl>, compactness_worst <dbl>, concavity_worst <dbl>, …
    ## ── Warning (<text>:2:3): Function successfully prints a tibble ─────────────────
    ## `is.tibble()` was deprecated in tibble 2.0.0.
    ## ℹ Please use `is_tibble()` instead.
    ## Backtrace:
    ##  1. testthat::expect_true(...)
    ##  4. tibble::is.tibble(...)

## Test 4

``` r
glimpse(cancer_sample)
```

    ## Rows: 569
    ## Columns: 32
    ## $ ID                      <dbl> 842302, 842517, 84300903, 84348301, 84358402, …
    ## $ diagnosis               <chr> "M", "M", "M", "M", "M", "M", "M", "M", "M", "…
    ## $ radius_mean             <dbl> 17.990, 20.570, 19.690, 11.420, 20.290, 12.450…
    ## $ texture_mean            <dbl> 10.38, 17.77, 21.25, 20.38, 14.34, 15.70, 19.9…
    ## $ perimeter_mean          <dbl> 122.80, 132.90, 130.00, 77.58, 135.10, 82.57, …
    ## $ area_mean               <dbl> 1001.0, 1326.0, 1203.0, 386.1, 1297.0, 477.1, …
    ## $ smoothness_mean         <dbl> 0.11840, 0.08474, 0.10960, 0.14250, 0.10030, 0…
    ## $ compactness_mean        <dbl> 0.27760, 0.07864, 0.15990, 0.28390, 0.13280, 0…
    ## $ concavity_mean          <dbl> 0.30010, 0.08690, 0.19740, 0.24140, 0.19800, 0…
    ## $ concave_points_mean     <dbl> 0.14710, 0.07017, 0.12790, 0.10520, 0.10430, 0…
    ## $ symmetry_mean           <dbl> 0.2419, 0.1812, 0.2069, 0.2597, 0.1809, 0.2087…
    ## $ fractal_dimension_mean  <dbl> 0.07871, 0.05667, 0.05999, 0.09744, 0.05883, 0…
    ## $ radius_se               <dbl> 1.0950, 0.5435, 0.7456, 0.4956, 0.7572, 0.3345…
    ## $ texture_se              <dbl> 0.9053, 0.7339, 0.7869, 1.1560, 0.7813, 0.8902…
    ## $ perimeter_se            <dbl> 8.589, 3.398, 4.585, 3.445, 5.438, 2.217, 3.18…
    ## $ area_se                 <dbl> 153.40, 74.08, 94.03, 27.23, 94.44, 27.19, 53.…
    ## $ smoothness_se           <dbl> 0.006399, 0.005225, 0.006150, 0.009110, 0.0114…
    ## $ compactness_se          <dbl> 0.049040, 0.013080, 0.040060, 0.074580, 0.0246…
    ## $ concavity_se            <dbl> 0.05373, 0.01860, 0.03832, 0.05661, 0.05688, 0…
    ## $ concave_points_se       <dbl> 0.015870, 0.013400, 0.020580, 0.018670, 0.0188…
    ## $ symmetry_se             <dbl> 0.03003, 0.01389, 0.02250, 0.05963, 0.01756, 0…
    ## $ fractal_dimension_se    <dbl> 0.006193, 0.003532, 0.004571, 0.009208, 0.0051…
    ## $ radius_worst            <dbl> 25.38, 24.99, 23.57, 14.91, 22.54, 15.47, 22.8…
    ## $ texture_worst           <dbl> 17.33, 23.41, 25.53, 26.50, 16.67, 23.75, 27.6…
    ## $ perimeter_worst         <dbl> 184.60, 158.80, 152.50, 98.87, 152.20, 103.40,…
    ## $ area_worst              <dbl> 2019.0, 1956.0, 1709.0, 567.7, 1575.0, 741.6, …
    ## $ smoothness_worst        <dbl> 0.1622, 0.1238, 0.1444, 0.2098, 0.1374, 0.1791…
    ## $ compactness_worst       <dbl> 0.6656, 0.1866, 0.4245, 0.8663, 0.2050, 0.5249…
    ## $ concavity_worst         <dbl> 0.71190, 0.24160, 0.45040, 0.68690, 0.40000, 0…
    ## $ concave_points_worst    <dbl> 0.26540, 0.18600, 0.24300, 0.25750, 0.16250, 0…
    ## $ symmetry_worst          <dbl> 0.4601, 0.2750, 0.3613, 0.6638, 0.2364, 0.3985…
    ## $ fractal_dimension_worst <dbl> 0.11890, 0.08902, 0.08758, 0.17300, 0.07678, 0…
