
context("logAlpha")

test_that("Exceptions are thrown",{
  m <- ex$mod
  expect_that(logAlpha(m),not(throws_error()))

  expect_that(logAlpha(1),throws_error())
})

test_that("Output has the right format",{
  m <- ex$mod
  la <- logAlpha(m)

  expect_equal(nrow(la),nrow(m$data))
  expect_equal(ncol(la),ncol(m$mle$stepPar))
})