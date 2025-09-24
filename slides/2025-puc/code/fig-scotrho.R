rhos <- readRDS("data/scotrho.rds")

prho <- .01
u <- .8 * max(rhos$dists)

ggplot(mapping = aes(x = rhos$dists)) +
  geom_histogram(aes(y = after_stat(density)),
                     binwidth = bins_sturges,
                 color = 1,
                 fill = "gray70") +
  stat_function(geom = "area",
                color = "transparent",
                fill = col2,
                alpha = .5,
                lwd = 1.2,
                fun = dexp,
                args = list(rate = - log(prho) / u),
                inherit.aes = FALSE) +
  stat_function(geom = "line",
                color = col2,
                lwd = 1.2,
                fun = dexp,
                args = list(rate = - log(prho) / u),
                inherit.aes = FALSE) +
  geom_density(aes(x = rhos$rho),
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
       y = "Density")
