basis_all <- readRDS("simscen.rds")
dt_all <- readRDS("simscen-dt.rds")

basis_all <-
  basis_all |>
  mutate(type = as.character(type)) |>
  mutate(type = if_else(type == "Unobserved",
                        "Unobserved (DF only)",
                        type)) |>
  mutate(type = factor(type, levels = c("Observed",
                                        "Unobserved (DF only)")))

dt_all <- dt_all |>
  mutate(type = as.character(type)) |>
  mutate(type = if_else(type == "Unobserved",
                        "Unobserved (DF only)",
                        type)) |>
  mutate(type = factor(type, levels = c("Observed",
                                        "Unobserved (DF only)")))

ggplot() +
  geom_sf(data = basis_all,
          fill = bck,
          color = fg,
          linewidth = .8) +
  geom_sf(data = dt_all,
          fill = bck,
          color = fg) +
  facet_grid(rows = vars(type),
             cols = vars(scenario)) +
  my_theme

data(GGHB.IZ, package = "CARBayesdata")
data(respiratorydata, package = "CARBayesdata")

my_dt <- merge(x = GGHB.IZ,
               y = respiratorydata, by = "IZ",
               all.x = FALSE) |>
  mutate(scenario = "Scenario 3 (areal only)")

ggplot() +
  geom_sf(data = my_dt,
          fill = bck,
          color = fg,
          linewidth = .2) +
  facet_wrap(~ scenario) +
  my_theme +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank())
