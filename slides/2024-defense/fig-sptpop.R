rs_map |>
  right_join(my_dt,
             by = "muni_id") |>
  ggplot(data = _,
         aes(fill = pop)) +
  geom_sf(color = 1, size = .1) +
  scale_fill_distiller("Pop",
                       breaks = c(5000, 15000, 60000, 1000000),
                       labels = scales::label_number(scale = .001,
                                                     suffix = "k"),
                       transform = "log",
                       palette = "Spectral") +
  theme(legend.position = "bottom",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.background = element_rect(color = bck, fill = bck),
        plot.background  = element_rect(color = bck, fill = bck))
