# from https://dplyr.tidyverse.org/reference/case_when.html
# This function allows you to vectorise multiple if_else() statements. 
# It is an R equivalent of the SQL CASE WHEN statement. If no cases match, NA is returned 

# case_when uses a sequence of two-sided formulas
# numeric example
happy %>% 
  mutate(happy_level = case_when(
    ladder_score < 3 ~ "unhappy",
    ladder_score >=3 & ladder_score <= 6 ~ "neutral",
    ladder_score > 6 ~ "happy"
  ))

# character example
happy %>% 
  mutate(name_length = case_when(
    str_count(country_name) < 5 ~ "short",
    str_count(country_name) > 5 ~ "long"
  ))

# oops! there's an NA
# one solution
happy %>% 
  mutate(name_length = case_when(
    str_count(country_name) < 5 ~ "short",
    str_count(country_name) > 5 ~ "long",
    TRUE ~ "average"
  ))
# NOTE: make sure you have a good explanation for what TRUE is doing in the code above
