# Note: tests should be self-contained, i.e. do not make assignments outside
# the test_that() blocks.

test_that("default lib_summary returns expected results", {
  result <- lib_summary()

  expect_s3_class(result, "data.frame")
  expect_type(result$n, "integer")
  expect_type(result$LibPath, "character")
  expect_equal(ncol(result), 2)
  expect_gte(nrow(result), 1)
  expect_equal(names(result), c("LibPath", "n"))
})


test_that("sizes argument works", {
  result <- lib_summary(sizes = TRUE)

  expect_s3_class(result, "data.frame")
  expect_type(result$n, "integer")
  expect_type(result$LibPath, "character")
  expect_type(result$size, "double")
  expect_equal(ncol(result), 3)
  expect_gte(nrow(result), 1)
  expect_equal(names(result), c("LibPath", "n", "size"))
})


test_that("lib_summary fails as expected", {
  expect_error(lib_summary(sizes = "arg"), "must be logical")
})


# Tests can go pretty far in simulating user experience. E.g. there are
# methods to create a temporary directory, save a file there, test that
# file, and then delete the temporary directory and folder all within
# a single test_that() block. See testthat documentation for instructions.
