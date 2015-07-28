
test_that("The output is in the right format",{
  nbStates <- 2
  nbCovs <- 2
  par <- c(0.001,0.999,0.5,0.7,1500.3,0.001)
  parSize <- c(2,1)
  bounds <- matrix(c(0,1,0,1,0,1,
                     0,1,0,Inf,0,Inf),
                   byrow=TRUE,ncol=2)
  beta <- matrix(rnorm(6),ncol=2,nrow=3)
  delta <- c(0.6,0.4)
  wpar <- n2w(par,bounds,beta,delta,nbStates)
  p <- w2n(wpar,bounds,parSize,nbStates,nbCovs)

  expect_equal(length(p$stepPar),parSize[1]*nbStates)
  expect_equal(length(p$anglePar),parSize[2]*nbStates)
  expect_equal(dim(p$beta),dim(beta))
  expect_equal(length(p$delta),length(delta))
})

test_that("w2n and n2w are inverse",{
  nbStates <- 2
  nbCovs <- 2
  par <- c(0.001,0.999,0.5,0.7,1500.3,0.001)
  parSize <- c(2,1)
  bounds <- matrix(c(0,1,0,1,0,1,
                     0,1,0,Inf,0,Inf),
                   byrow=TRUE,ncol=2)
  beta <- matrix(rnorm(6),ncol=2,nrow=3)
  delta <- c(0.6,0.4)
  wpar <- n2w(par,bounds,beta,delta,nbStates)
  p <- w2n(wpar,bounds,parSize,nbStates,nbCovs)

  expect_equal(c(t(p$stepPar)),par[1:(parSize[1]*nbStates)])
  expect_equal(c(t(p$anglePar)),par[(parSize[1]*nbStates+1):(sum(parSize)*nbStates)])
  expect_equal(p$beta,beta)
  expect_equal(p$delta,delta)
})