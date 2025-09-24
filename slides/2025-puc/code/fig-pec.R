pexp_corr <- function(dst, rho, nu) {
  phi <- rho / (log(10) ^ (1 / nu))
  exp(- (dst / phi)^nu)
}

pcols <- c("#99809F", col2, col1)

names(pcols) <- c("nu = 0.75", "nu = 0.5", "nu = 1")

aux_df <- data.frame()

ggplot() +
  stat_function(fun = pexp_corr,
                color = fg,
                args = list(rho = .3, nu = .25),
                xlim = c(0, 1),
                lwd = 0.8,
                n = 501) +
  stat_function(fun = pexp_corr,
                color = pcols[1],
                args = list(rho = .3, nu = .5),
                xlim = c(0, 1),
                lwd = 0.8,
                n = 501) +
  stat_function(fun = pexp_corr,
                color = pcols[2],
                args = list(rho = .3, nu = .75),
                xlim = c(0, 1),
                lwd = 0.8,
                n = 501) +
  stat_function(fun = pexp_corr,
                color = pcols[3],
                args = list(rho = .3, nu = .9999),
                xlim = c(0, 1),
                lwd = 0.8,
                n = 501) +
  geom_segment(aes(x = 0.85, xend = 0.90,
                   y = 0.95, yend = 0.95),
               color = fg,
               lwd = 1) +
  annotate(geom = "text",
           x = 0.8, y = 0.95,
           label = "nu == 0.25",
           parse = TRUE,
           color = fg) +
  geom_segment(aes(x = 0.85, xend = 0.90,
                   y = 0.85, yend = 0.85),
               color = pcols[1],
               lwd = 1) +
  annotate(geom = "text",
           x = 0.8, y = 0.85,
           label = "nu == 0.5",
           parse = TRUE,
           color = fg) +
  geom_segment(aes(x = 0.85, xend = 0.90,
                   y = 0.75, yend = 0.75),
               color = pcols[2],
               lwd = 1) +
  annotate(geom = "text",
           x = 0.8, y = 0.75,
           label = "nu == 0.75",
           parse = TRUE,
           color = fg) +
  geom_segment(aes(x = 0.85, xend = 0.90,
                   y = 0.65, yend = 0.65),
               color = pcols[3],
               lwd = 1) +
  annotate(geom = "text",
           x = 0.8, y = 0.65,
           label = "nu %~~% 1",
           parse = TRUE,
           color = fg) +
  geom_vline(xintercept = 0.3, linetype = 2) +
  scale_x_continuous(breaks = c(0, 0.3, 0.5, 0.75, 1),
                     labels = c(0, expression(rho == 0.3),
                                0.5, 0.75, 1)) +
  my_theme +
  labs(x = expression(h), y = expression(r(h)))
