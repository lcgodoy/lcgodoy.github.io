alpha_beta <- function(mode, concentration) {
  alpha <- 1 + concentration * mode
  beta <- 1 + concentration * (1 - mode)
  return(cbind(alpha, beta))
}

aux <- lapply(c(0.5, 1, 5, 10, 50, 100),
              \(ct) alpha_beta(mode = .75,
                               concentration = ct))

aux2 <-
  Map(\(x, lty) {
    stat_function(fun = dbeta,
                  args = list(shape1 = x[1],
                              shape2 = x[2]),
                  color = lty,
                  n = 1000)
  }, x = aux, lty = seq_along(aux))

p <- ggplot()

Reduce(`+`, c(list(p), aux2))

library(ggplot2)

ggplot() +
  stat_function(inherit.aes = FALSE,
                fun = \(x, nu, mu, sd) {
                  dt(qlogis(x) / sd, df = nu, ncp = mu) / (x * (1 - x) * sd)
                },
                args = list(mu = qlogis(0.5),
                            sd = 1,
                            nu = 4),
                n = 1000) +
  xlim(c(0, 1)) +
  theme_bw()

ggplot() +
  stat_function(inherit.aes = FALSE,
                fun = \(x, mu, sd) {
                  dnorm(qlogis(x), mean = mu, sd = sd) / (x * (1 - x))
                },
                args = list(mu = qlogis(0.5),
                            sd = 2),
                n = 1000) +
  xlim(c(0, 1)) +
  theme_bw()

ggplot() +
  stat_function(inherit.aes = FALSE,
                fun = \(x, mu, sd) {
                  dnorm(exp(x), mean = mu, sd = sd) * exp(x)
                },
                args = list(mu = 0,
                            sd = 1000),
                lty = 2,
                n = 1000) +
    stat_function(inherit.aes = FALSE,
                fun = \(x, mu, sd) {
                  dnorm(exp(x), mean = mu, sd = sd) * exp(x)
                },
                args = list(mu = 0,
                            sd = 1),
                n = 1000) +
  xlim(c(0, 10)) +
  theme_bw()

ggplot() +
  stat_function(inherit.aes = FALSE,
                fun = \(x, mu, sd) {
                  dnorm(exp(x), mean = mu, sd = sd) * exp(x)
                },
                args = list(mu = 0,
                            sd = 10),
                lty = 2,
                n = 1000) +
    stat_function(inherit.aes = FALSE,
                fun = \(x, mu, sd) {
                  dnorm(exp(x), mean = mu, sd = sd) * exp(x)
                },
                args = list(mu = 10,
                            sd = 10),
                n = 1000) +
  xlim(c(0, 10)) +
  theme_bw()

ggplot() +
  stat_function(inherit.aes = FALSE,
                fun = \(x, nu, mu, sd) {
                  dt(exp(x) / sd, df = nu, ncp = mu) * exp(x) / sd
                },
                args = list(mu = 0,
                            sd = 1,
                            nu = 3),
                n = 1000,
                lty = 2) +
  stat_function(inherit.aes = FALSE,
                fun = \(x, nu, mu, sd) {
                  dt(exp(x) / sd, df = nu, ncp = mu) * exp(x) / sd
                },
                args = list(mu = 0,
                            sd = 1,
                            nu = 30),
                n = 1000) +
  xlim(c(0, 10)) +
  theme_bw()

ggplot() +
  stat_function(inherit.aes = FALSE,
                fun = \(x, nu, mu, sd) {
                  dt(exp(x) / sd, df = nu, ncp = mu) * exp(x) / sd
                },
                args = list(mu = 10,
                            sd = 1,
                            nu = 3),
                n = 1000,
                lty = 2) +
  stat_function(inherit.aes = FALSE,
                fun = \(x, nu, mu, sd) {
                  dt(exp(x) / sd, df = nu, ncp = mu) * exp(x) / sd
                },
                args = list(mu = 0,
                            sd = 1,
                            nu = 3),
                n = 1000) +
  xlim(c(0, 10)) +
  theme_bw()

ggplot() +
  stat_function(inherit.aes = FALSE,
                fun = \(x, nu, mu, sd) {
                  dt(exp(x) / sd, df = nu, ncp = mu) * exp(x) / sd
                },
                args = list(mu = 10,
                            sd = 10,
                            nu = 3),
                n = 1000,
                lty = 2) +
  stat_function(inherit.aes = FALSE,
                fun = \(x, nu, mu, sd) {
                  dt(exp(x) / sd, df = nu, ncp = mu) * exp(x) / sd
                },
                args = list(mu = 0,
                            sd = 10,
                            nu = 3),
                n = 1000) +
  xlim(c(0, 10)) +
  theme_bw()
