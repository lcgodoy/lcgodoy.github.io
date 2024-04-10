covars_dt <- readRDS("spt-covars.rds")

covs_hist <-
  covars_dt |>
  ## filter(scale == "Original") |>
  ggplot(data = _,
       aes(x = observed)) +
  geom_histogram(color = 1,
                 fill = "gray70",
                 binwidth = bins_sturges) +
  facet_wrap(scale ~ covariate, scales = "free",
             nrow = 2) +
  labs(x = NULL, y = NULL) +
  my_theme

covs_hist
