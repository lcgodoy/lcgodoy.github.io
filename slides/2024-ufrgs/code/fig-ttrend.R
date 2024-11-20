my_dt <- readRDS("data/spt-data.rds")

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

ggplot() +
  geom_line(aes(x = as.integer(year),
                y = tb_crate,
                group = municipio),
            data = my_dt,
            alpha = .1) +
  geom_line(aes(x = as.integer(year),
                y = tb_crate,
                group = municipio),
            data = filter(my_dt, municipio %in% aux_muni),
            inherit.aes = FALSE,
            alpha = 1) +
  geom_line(aes(x = year,
                y = tb_crate),
            data = all_plot,
            inherit.aes = FALSE,
            linetype = 2,
            ## linewidth = 1,
            color = 2) +
  ggrepel::geom_label_repel(aes(x = as.integer(year),
                                y = tb_crate,
                                label = municipio),
                            data = filter(my_dt, municipio %in% aux_muni,
                                          year == max(year)),
                            nudge_x = 2,
                            inherit.aes = FALSE,
                            segment.linetype = 3,
                            color = fg,
                            fill = bck,
                            segment.color = "gray20",
                            direction = "both") +
  my_theme +
  scale_y_continuous(labels =
                       scales::label_number(scale = 100000)) +
  labs(x = "Year",
       y = NULL)
