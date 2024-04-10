rhos <- readRDS("scotrho.rds")

prho <- .01
u <- .8 * max(rhos$dists)

ggplot(mapping = aes(x = rhos$dists)) +
  geom_histogram(binwidth = bins_sturges,
                 color = 1,
                 fill = "gray70") +
  stat_function(aes(y = after_stat(y) * 5000),
                geom = "area",
                color = "transparent",
                fill = col2,
                alpha = .5,
                lwd = 1.2,
                fun = dexp,
                args = list(rate = - log(prho) / u),
                inherit.aes = FALSE) +
  stat_function(aes(y = after_stat(y) * 5000),
                geom = "line",
                color = col2,
                lwd = 1.2,
                fun = dexp,
                args = list(rate = - log(prho) / u),
                inherit.aes = FALSE) +
  geom_density(mapping = aes(x = rhos$rho,
                             y = after_stat(density) * 5000),
               fill = col1,
               color = col1,
               alpha = .5,
               adjust = 2,
               lwd = 1.1) +
  theme_bw() +
  my_theme +
  theme(axis.text.y = element_blank(),
        axis.ticks.y = element_blank()) +
  labs(x = "Hausdorff distance (in km)",
       y = NULL)
