my_dt <- readRDS("df-pred.rds")

my_dt |>
  mutate(model = factor(model, levels = c("HGP", "AGP[1]", "AGP[2]"))) |>
  ggplot(data = _,
       aes(fill = median_prd,
           color = median_prd)) +
  geom_sf() +
  scale_fill_viridis_c(option = "H",
                       ## limits = range(my_dt$pm25),
                       guide = guide_colorbar(expression(atop(Predicted, PM[2.5])),
                                              title.vjust = 1,
                                              ticks = FALSE)) +
  scale_color_viridis_c(option = "H",
                        ## limits = range(my_dt$pm25),
                        guide = guide_colorbar(expression(atop(Predicted, PM[2.5])),
                                               title.vjust = 1,
                                               ticks = FALSE)) +
  facet_wrap(~ model, labeller = label_parsed) +
  my_theme +
  theme(legend.position = "bottom",
        axis.text = element_blank(),
        axis.ticks = element_blank())
