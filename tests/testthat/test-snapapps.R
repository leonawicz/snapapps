context("snapapps")

test_that("snapp returns expected errors", {
  err1 <- "Invalid app `id`. See `snapps` for available apps."
  err2 <- "`local_mode` must be 'normal' or 'showcase'."
  expect_error(snapp("a"), err1)
  expect_error(snapp("a", local_mode = "b"), err2)
  expect_error(snapp("a", source = "remote"), err1)
  expect_error(snapp("a", source = "remote", local_mode = "b"), err2)
})

test_that("metadata returns as expected", {
  x <- snapps()
  expect_is(x, "tbl_df")
  expect_equal(ncol(x), 6)
  expect_true(all(c("id", "name", "description", "url", "redirect", "status") %in% names(x)))
})

test_that("resource paths are returned", {
  x <- snapp_resources()
  expect_is(x, "character")
  expect_identical(basename(x), "images")
})
