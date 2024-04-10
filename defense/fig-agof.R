results_l <- readRDS("~/phd/thesis/talk/areal_gof.rds")

results_l |>
  ggplot(data = _) +
  geom_boxplot(aes(x = delta, y = measure),
               fill = "gray70",
               outlier.alpha = .5) +
  geom_vline(xintercept = 0, col = 2, lty = 1) +
  geom_vline(xintercept = -10, col = fg, lty = 2) +
  geom_vline(xintercept = 10, col = fg, lty = 2) +
  facet_grid(sim ~ sce) +
  labs(x = expression(Delta[G]),
       y = NULL) +
  scale_x_continuous(breaks = c(-20, -10, 0,
                                10, 20)) +
  scale_fill_discrete(name = "Fitted") +
  my_theme +
  theme(panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        legend.position = "bottom")

rm(results_l)
