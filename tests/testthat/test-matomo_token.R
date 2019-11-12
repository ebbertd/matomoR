test_that("the token is read correctly", {
  Sys.setenv(MATOMO_TOKEN = "anonymous")
  expect_equal(matomo_token(), "anonymous")
})

test_that("an error is thrown when the token is not set", {
  Sys.unsetenv("MATOMO_TOKEN")
  expect_error(matomo_token())
})
