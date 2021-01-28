#---- Building a word count df for each gender "word counters" ----

word_counters <- purrr::map(data_split, word_counter, stem = F)

#---- Creating breaks and color pallete ----

# Color palette: red to gray to blue
col_pal <- colorRampPalette(colors = c("#f71616", "#adadad", "#283eff")) 

# Create breaks based in incomes (considering both Men and Women)
breaks <- quantile(word_counters$Total$income, probs = seq(0, 1, by = .005))

# Create a variable called color based on previous breaks at each list element
word_counters <- purrr::map(word_counters, 
                            function(data) {
                              data %<>%
                                mutate(color = cut(x = income, 
                                                   breaks = breaks, 
                                                   label = col_pal(length(breaks) - 1)
                                )
                                )
                            })