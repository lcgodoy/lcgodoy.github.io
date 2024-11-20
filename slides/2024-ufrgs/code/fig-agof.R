results_l <- readRDS("data/areal_gof.rds")

results_l |>
  filter(grepl("3", sce)) |>
  filter(measure != "DIC") |>
  mutate(measure = factor(measure,
                          levels = c("WAIC", "LOOIC"))) |>
ggplot(data = _) +
  annotate(geom = "rect",
           xmin = -4, xmax = 4,
           ymin = -Inf, ymax = Inf,
           alpha = .15,
           fill = 1) +
  geom_vline(xintercept = 0, col = 2, lty = 1) +
  stat_ecdf(aes(x = delta,
                linetype = sim)) +
  facet_grid(. ~ measure) +
  labs(x = expression(Delta[G]),
       y = NULL) +
  scale_x_continuous(breaks = c(-40, -20,
                                -10, 0, 10,
                                20, 40)) +
  scale_y_continuous(labels = scales::percent,
                     breaks = c(0, .25, .5, .75, 1)) +
  scale_fill_discrete(name = "Fitted") +
  labs(linetype = NULL) +
  my_theme +
  theme(strip.background = element_rect(fill = "white",
                                        color = 1),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        legend.position = "inside",
        legend.position.inside = c(.1, .75))

rm(results_l)
