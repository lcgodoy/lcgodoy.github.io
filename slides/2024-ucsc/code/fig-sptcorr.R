to_plot <- readRDS("data/spt-dsdt.rds")

gg_sp <-
  ggplot(data = to_plot$space,
         aes(x = dist)) +
  geom_ribbon(aes(ymin = lower2, ymax = upper2),
              fill = "#268bd2") +
  geom_ribbon(aes(ymin = lower1, ymax = upper1),
              fill = "#268bd2",
              alpha = .6) +
  geom_line(aes(y = med),
            color = 1,
            lwd = 1.2) +
  geom_rug(data = data.frame(dst = to_plot$hmat),
           aes(x = dst), alpha = .05,
           inherit.aes = FALSE) +
  scale_x_continuous(breaks = c(0, 150, 250)) +
  my_theme +
  theme(axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        legend.position = "bottom") +
  labs(y = NULL,
       x = "h (in tens of km)")

gg_time <-
  ggplot(data = filter(to_plot$time, dist >= 0),
         aes(x = dist)) +
  geom_ribbon(aes(ymin = lower2, ymax = upper2),
              fill = "#268bd2") +
  geom_ribbon(aes(ymin = lower1, ymax = upper1),
              fill = "#268bd2",
              alpha = .6) +
  geom_line(aes(y = med),
            color = 1,
            lwd = 1.2) +
  scale_x_continuous(breaks = c(0, 6, 12)) +
  my_theme +
  theme(legend.position = "bottom") +
  labs(y = "Correlation",
       x = "dt")

gg_spt <-
  ggplot(data = filter(to_plot$spt,
                       ds > 0),
         aes(y = ds, x = dt,
             fill = corr,
             color = corr)) +
  geom_tile() +
  geom_rug(data = data.frame(dst = to_plot$hmat),
           aes(y = dst), alpha = .05,
           inherit.aes = FALSE) +
  scale_fill_distiller("Cor",
                       palette = "Spectral", breaks = c(0, .25, .5)) +
  scale_color_distiller("Cor",
                        palette = "Spectral", breaks = c(0, .25, .5)) +
  scale_y_continuous(breaks = c(0, 150, 250)) +
  scale_x_continuous(breaks = c(-12, -6, 0, 6, 12)) +
  my_theme +
  labs(y = "h (in tens of km)",
       x = "dt") +
  theme(panel.grid = element_blank(),
        legend.position = "bottom")

## gg_time

## gg_sp

gg_spt + coord_flip()
