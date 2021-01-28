#---- Creating - Word Clouds ----
library(ggplot2)

sysfonts::font_add_google("Space Mono")

# Men

# Using just te 20% more frequent words
wc_obj_men <- word_counters$Male %>% 
  filter(freq > quantile(freq, .8))

men_colors <- wc_obj_men$color

# Data structure utilized by wordcloud2
wc_obj_men %<>% select(word, freq)

wc_men <- wordcloud2::wordcloud2(data = wc_obj_men, color = men_colors,
                                 backgroundColor = "black",
                                 fontFamily = "Space Mono", shuffle = F, 
                                 size = .5) # use rstudio Viewer to export html as image

# Women

# Using just te 20% more frequent words
wc_obj_women <- word_counters$Female %>% 
  filter(freq > quantile(freq, .8))

women_colors <- wc_obj_women$color

# Data structure utilized by wordcloud2
wc_obj_women %<>% select(word, freq)

(wc_women <- wordcloud2::wordcloud2(data = wc_obj_women, color = women_colors,
                                    backgroundColor = "black",
                                    fontFamily = "Space Mono", shuffle = F, size = .5)) # use rstudio Viewer to export html as image

#---- Getting legends ----

legends <- ggplot(word_counters$Total, aes(x = freq, y = income, fill = income)) +
  geom_point(alpha = .7) + 
  scale_fill_gradientn(colours = c("#f71616", "#ffffff", "#283eff"), 
                       guide = guide_colorbar(title = "Avg. Income", 
                                              title.position = "top", 
                                              label.position = "bottom",
                                              label.theme = element_text(angle = 90,
                                                                         size = 6.5,
                                                                         family = "Space Mono"),
                                              ticks = F),
                       breaks = c(min(breaks), max(breaks)),
                       labels = c("low", "high")) +
  theme(legend.justification = "bottom", 
        legend.direction = "horizontal", 
        legend.title = element_text(family = "Space Mono",
                                    size = 8))
  

legends <- cowplot::get_legend(legends)
