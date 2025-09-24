my_dt <- readRDS("data/spt-data.rds")
rs_map <- readRDS("data/spt-map.rds")

aux_muni <- my_dt |>
  group_by(municipio) |>
  summarise(agg_tb = mean(tb / pop)) |>
  ungroup() |>
  slice_max(agg_tb, n = 3) |>
  pull(municipio) |>
  unique()

all_plot <-
  my_dt |>
  group_by(year) |>
  summarise(tb = sum(tb), pop = sum(pop)) |>
  ungroup() |>
  mutate(tb_crate = tb / pop) |>
  mutate(year = as.integer(year))

rs_map |>
  right_join(
      my_dt,
      by = "muni_id"
  ) |>
  ggplot(data = _,
         aes(fill = 100000 * tb_crate)) +
  geom_sf(color = "white", linewidth = .1) +
  scale_fill_distiller(palette = "Spectral",
                       breaks = c(0, 200, 400)) +
  facet_wrap(~ year) +
  theme(panel.background = element_rect(color = bck, fill = bck),
        plot.background  = element_rect(color = bck, fill = bck),
        legend.position = c(.85, .15),
        legend.title = element_blank(),
        legend.key.size = unit(.4, "cm"),
        legend.direction = "horizontal",
        legend.text = element_text(size = 6))
