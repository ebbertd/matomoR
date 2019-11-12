test_that("the hostname is read correctly", {
  Sys.setenv(MATOMO_HOST = "https://demo.matomo.org")
  expect_equal(matomo_hostname(), "https://demo.matomo.org/index.php")
})

test_that("an error is thrown when the hostname is not set", {
  Sys.unsetenv("MATOMO_HOST")
  expect_error(matomo_hostname())
})
