ra <- 1.2
col1 <- get_color(scss, "^\\$clr-teal", 2)
col2 <- get_color(scss, "^\\$clr-sand", 2)
col3 <- get_color(scss, "^\\$clr-mist", 2)
col4 <- get_color(scss, "^\\$clr-charcoal", 2)
hgl <- 4

par(bg = bck, mar = c(0, 0, 0, 0))
plot(0, type = "n", axes = FALSE,
     xlab = "", ylab = "", xlim = c(-2, 3), ylim = c(-4, 4))
plotrix::draw.circle(x = -0.4, y = 0,
                     radius = ra,
                     lwd = 5,
                     border = col1,
                     col = grDevices::adjustcolor(col = col1,
                                                  alpha = .2))
plotrix::draw.circle(x = ra + .2, y = 0,
                     radius = ra,
                     lwd = 5,
                     border = col2,
                     col =
                       grDevices::adjustcolor(col = col2,
                                              alpha = .2))
text(x = c(-1.8, 2.8),
     y = c(1.5, 1.5),
     col = c(col1, col2),
     label = c("A", "B"),
     cex = 5)
segments(x0 = -1.6, x1 = .2,
         y0 = 0, y1 = 0,
         lwd = 5,
         lty = 2,
         col = col4)

par(bg = bck, mar = c(0, 0, 0, 0))
plot(0, type = "n", axes = FALSE,
     xlab = "", ylab = "",
     xlim = c(-2, 3), ylim = c(-4, 4))
plotrix::draw.circle(x = -0.4, y = 0,
                     radius = 1.2,
                     lwd = 5,
                     border = col1,
                     col = grDevices::adjustcolor(col = col1,
                                                  alpha = .2))
plotrix::draw.circle(x = ra + .2, y = 0,
                     radius = 0.6,
                     lwd = 5,
                     border = col2,
                     col = grDevices::adjustcolor(col = col2,
                                                  alpha = .2))
text(x = c(-1.8, 2.2),
     y = c(1.5, 1),
     col = c(col1, col2),
     label = c("A", "C"),
     cex = 5)
segments(x0 = -1.6, x1 = .8,
         y0 = 0, y1 = 0,
         lwd = 5,
         lty = 2,
         col = col4)

par(bg = bck, mar = c(0, 0, 0, 0))
plot(0, type = "n", axes = FALSE,
     xlab = "", ylab = "", xlim = c(-2, 3), ylim = c(-4, 4))
plotrix::draw.circle(x = 0, y = 0,
                     radius = ra,
                     lwd = 5,
                     border = col1,
                     col = grDevices::adjustcolor(col = col1,
                                                  alpha = .2))
text(x = c(-1.3, 0.35),
     y = c(1.6, .6),
     col = c(col1, col2),
     label = c("A", "D"),
     cex = 4)
segments(x0 = 0, x1 = 0,
         y0 = -2.9, y1 = .6,
         lwd = 5,
         lty = 2,
         col = col4)
plotrix::draw.circle(x = 0, y = .6,
                     radius = 0.05,
                     lwd = 3,
                     border = col2,
                     col = col2)
