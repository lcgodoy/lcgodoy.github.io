#---- Function: extracts individuals and income per word ----

# if stem is TRUE, words will be "stemmed"

word_counter <- function(data, stem = T) { 
  
  stopwords <- tm::stopwords('en') # aux to remove stopwords
  
  if(stem == T) {
    data %<>% 
      mutate(occup_text = occupation %>% stringr::str_to_lower() %>% 
               stringr::str_replace_all('–', "") %>% 
               # VectorSource() %>% 
               # Corpus() %>% 
               tm::removePunctuation() %>% 
               tm::removeNumbers() %>% 
               tm::removeWords(stopwords) %>% 
               tm::stemDocument() %>%
               tm::stripWhitespace()) 
    
    dtm <- data$occup_text %>%
      VectorSource() %>% 
      Corpus() %>% 
      TermDocumentMatrix() 
    
    df_word <- as.matrix(dtm) %>% 
      rowSums() %>% 
      sort(decreasing=TRUE) %>% 
      names
  }
  else {
    data %<>% 
      mutate(occup_text = occupation %>% stringr::str_to_lower() %>% 
               stringr::str_replace_all('–', "") %>% 
               # VectorSource() %>% 
               # Corpus() %>% 
               tm::removePunctuation() %>% 
               tm::removeNumbers() %>% 
               tm::removeWords(stopwords) %>% 
               # tm::stemDocument() %>%
               tm::stripWhitespace()) 
    
    dtm <- data$occup_text %>%
      VectorSource() %>% 
      Corpus() %>% 
      TermDocumentMatrix() 
    
    df_word <- as.matrix(dtm) %>% 
      rowSums() %>% 
      sort(decreasing=TRUE) %>% 
      names
  }
  
  
  (df_word <- tibble(word = df_word))
  
  df_word$freq <- NA_real_
  df_word$income <- NA_real_
  aux <- NULL
  
  for(i in seq_len(nrow(df_word))) {
    aux <- data[stringr::str_detect(data$occup_text, df_word$word[i]),]
    df_word$freq[i] <- sum(aux$individuals)
    df_word$income[i] <- sum(aux$average_taxable_income*aux$individuals)/df_word$freq[i]
    aux <- NULL
  }
  
  return(df_word)
}
