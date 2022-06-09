# from https://dplyr.tidyverse.org/reference/filter-joins.html
# semi-join
# returns all rows from x with a match in y
happy %>% 
  semi_join(happy_join, by = "country_name")

# show how this is different from an inner_join()
happy %>% 
  inner_join(happy_join, by = "country_name")

# anti-join
# return all rows from x without a match in y
happy %>% 
  anti_join(happy_join, by = "country_name")
# NOTE: don't forget the tidyexplain animations!
