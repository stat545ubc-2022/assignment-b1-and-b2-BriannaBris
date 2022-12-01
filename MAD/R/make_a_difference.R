#' @title Make a Difference Function
#' @description Introducing the 'Make a Difference' Function - This function calculates the difference between 2 variables, then creates a new column to hold these calculations in the dataset.

#' INPUTS:
#' @param data The dataset containing the chosen variables to apply this function on
#' @param col1 The first chosen column/variable within the dataset.  It must contain only numeric values.
#' @param col2 The second chosen column/variable within the dataset. It must contain only numeric values.

#' OUTPUTS:
#' @return The creation of a "Difference" column in the dataset containing the calculated differences of all the data points between the 2 variables.
#' @examples 
#' tree_diff <- make_a_difference(trees, trees$Height, trees$Girth)
#' iris_diff <- make_a_difference(iris, iris$Petal.Width, iris$Sepal.Width)
#' @export

make_a_difference <- function(data, col1, col2) {
  if(!is.numeric(col1)) {
    stop("Sorry, but this function only works on numeric inputs for col1! You input a variable of class: ", class(col1))
  }
  if(!is.numeric(col2)) {
    stop("Sorry, but this function only works on numeric input for col2! You input a variable of class: ", class(col2))
  }
  return <- (dplyr::mutate(data, Difference = col1-col2))
  print(return)
}
