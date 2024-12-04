sens_nu <- readRDS("data/spt-sens.rds") |>
  mutate(parameter = gsub("gamma", "psi", parameter))

ggplot(data =
         mutate(
             filter(sens_nu, parameter %in%
                             c("nu", "psi", "rho", "sigma")),
             parameter = factor(parameter, levels = c("sigma", "rho",
                                                      "nu", "phi"))
         ),
       aes(y = pct, x = estimate,
           group = as.factor(a),
           color = a)) +
  geom_step() +
  scale_color_distiller(expression(kappa),
                        palette = "Spectral",
                        breaks = c(.8, 1, 1.2)) +
  facet_wrap(~ parameter, labeller = label_parsed,
             scales = "free_x", ncol = 4) +
  labs(x = expression(theta),
       y = "ECDF") +
  my_theme +
  theme(legend.position = "inside",
        legend.position.inside = c(0.05, .8),
        legend.title = element_blank(),
        legend.background = element_rect(color = bck, fill = bck))

## coord_flip() +
##   scale_y_continuous(labels = scales::label_number(scale = 100000)) +
##   scale_x_discrete(labels = scales::wrap_format(10)) +
##   theme(legend.position = "inside",
##         ## legend.key.size = unit(.1, "cm"),
##         legend.position.inside = c(0.908, .1),
##         legend.title = element_blank()) +
##   facet_wrap(~ year)
