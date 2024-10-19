psd_dt <- readRDS("data/psd.rds")

my_theme <-
  theme_bw() +
  theme(plot.background = element_rect(fill = bck,
                                       color = bck),
        panel.background = element_rect(fill = bck,
                                        color = bck),
        panel.grid = element_blank(),
        line = element_line(color = fg),
        text = element_text(color = fg),
        rect = element_rect(color = fg),
        axis.ticks = element_line(color = fg),
        axis.line = element_line(color = fg),
        panel.border = element_rect(fill = NA, color = fg),
        strip.background = element_rect(fill = bck, color = fg),
        legend.ticks = element_blank(),
        legend.background = element_rect(fill = bck, color = bck))

ggplot(data = psd_dt,
         aes(x = phi,
             y = nu,
             alpha = low >= 0,
             fill = low)) +
  geom_raster() +
  scale_alpha_manual(values = c(.6, 1)) +
  scale_fill_viridis_c(expression(lambda[1]),
                       option = "H",
                       direction = 1) +
  guides(fill = guide_colorbar(ticks = FALSE,
                               reverse = TRUE,
                               ## title.vjust = .75,
                               ## barheight = .2
                               barwidth = .5),
         alpha = "none") +
  facet_wrap(proj ~ .,
             scales = "free_x") +
  my_theme +
  labs(x = expression(rho),
       y = expression(nu))
