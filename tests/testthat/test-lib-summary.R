# Note: tests should be self-contained, i.e. do not make assignments outside
# the test_that() blocks.

test_that("default lib_summary returns expected results", {
  result <- lib_summary()

  expect_s3_class(result, "data.frame")
  expect_type(result$n_packages, "integer")
  expect_type(result$Library, "character")
  expect_equal(ncol(result), 2)
  expect_gte(nrow(result), 1)
  expect_equal(names(result), c("Library", "n_packages"))
})


test_that("sizes argument works", {
  result <- lib_summary(sizes = TRUE)

  expect_s3_class(result, "data.frame")
  expect_type(result$n_packages, "integer")
  expect_type(result$Library, "character")
  expect_type(result$lib_size, "double")
  expect_equal(ncol(result), 3)
  expect_gte(nrow(result), 1)
  expect_equal(names(result), c("Library", "n_packages", "lib_size"))
})


test_that("lib_summary fails as expected", {
  expect_error(lib_summary("arg"), "must be logical")
})


# Tests can go pretty far in simulating user experience. E.g. there are
# methods to create a temporary directory, save a file there, test that
# file, and then delete the temporary directory and folder all within
# a single test_that() block. See testthat documentation for instructions.
