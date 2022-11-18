test_that("Function returns error if non-numerical input passed into col1", {
  expect_error(make_a_difference(datateachr::cancer_sample, cancer_sample$diagnosis, cancer_sample$radius_mean))
})

test_that("Function returns error message if non-numerical input passed into col2", {
  expect_error(make_a_difference(datateacher::cancer_sample, cancer_sample$radius_mean, cancer_sample$diagnosis))
})

test_that("Function successfully outputs a list", {
  expect_type((make_a_difference(iris, iris$Sepal.Length, iris$Petal.Length)), "list")
})

