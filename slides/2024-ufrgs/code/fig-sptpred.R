my_dt <- readRDS("data/spt-pred.rds")

rs_map |>
  right_join(my_dt,
             by = "muni_id") |>
  tidyr::pivot_longer(cols = c(m, tb_crate)) |>
  mutate(name = if_else(name == "m", "Predicted", "Observed")) |>
  ggplot(data = _,
         aes(fill = value)) +
  geom_sf(color = 1, size = .1) +
  scale_fill_distiller("",
                       labels = scales::label_number(scale = 100000),
                       palette = "Spectral") +
  facet_wrap(~ name) +
  theme(legend.position = "bottom",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.background = element_rect(color = bck, fill = bck),
        plot.background  = element_rect(color = bck, fill = bck))
