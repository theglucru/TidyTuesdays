library(tidyverse)

billboard <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-09-14/billboard.csv')
audio_features <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-09-14/audio_features.csv')

#Helper Functions
group_count <- function(df, column_names){
  df %>% 
    group_by_at(column_names) %>% 
    summarise(n = n()) %>% 
    arrange(desc(n))
}

row_search <- function(df, col, string){
  df %>% 
    filter(str_detect(df[[col]], str_c("^", string)))
}

# Songs with most appearances
