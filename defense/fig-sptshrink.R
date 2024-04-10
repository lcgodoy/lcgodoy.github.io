my_dt <- readRDS("spt-shrink.rds")

ggplot(data = my_dt,
       aes(x = muni,
           y = value,
           color = name)) +
  ggstats::geom_stripped_cols(color = "transparent") +
  geom_hline(yintercept = 0, lty = 2, col = 2) +
  geom_linerange(aes(ymin = ll, ymax = hh),
                 data = filter(my_dt, name == "Estimated"),
                 lwd = 1) +
  geom_linerange(aes(ymin = l, ymax = h),
                 data = filter(my_dt, name == "Estimated"),
                 lwd = 2) +
  scale_color_manual(values = c(col2, col1)) +
  scale_fill_manual(values = c(col2, col1)) +
  guides(color = "none") +
  scale_x_discrete(limits = rev) +
  geom_point(aes(fill = name),
             color = 1,
             shape = 21,
             size = 2) +
  my_theme +
  labs(x = NULL, y = "TB cases per 100k inhab.") +
  coord_flip() +
  scale_y_continuous(labels = scales::label_number(scale = 100000)) +
  scale_x_discrete(labels = scales::wrap_format(10)) +
  theme(legend.position = "inside",
        ## legend.key.size = unit(.1, "cm"),
        legend.position.inside = c(0.908, .1),
        legend.title = element_blank()) +
  facet_wrap(~ year)
