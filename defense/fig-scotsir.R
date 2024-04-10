my_dt <- readRDS("scotsir.rds")

my_dt |>
  select(starts_with("SIR_"), SIR) |>
  tidyr::pivot_longer(1:4) |>
  mutate(name = factor(name,
                       levels = c("SIR",
                                  sprintf("SIR_%s", c("hgp",
                                                       "dagar",
                                                       "bym2"))),
                       labels = c("Observed", "HGP",
                                  "DAGAR", "BYM"))) |>
  ggplot(data = _,
         aes(fill = value)) +
  geom_sf(col = fg, lwd = .1) +
  scale_fill_distiller(palette = "Spectral",
                       guide = guide_colorbar("SIR",
                                              title.vjust = .75,
                                              ticks = FALSE)) +
  facet_wrap(~ name, labeller = label_parsed,
             nrow = 1) +
  theme_bw() +
  my_theme +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        legend.position = "bottom")
