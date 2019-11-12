test_that("the useragent is set correctly", {
  expect_equal(
    matomo_package_useragent(),
    user_agent("http://github.com/ebbertd/matomoR")
  )
})
