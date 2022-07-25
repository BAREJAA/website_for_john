# between() - 
# https://dplyr.tidyverse.org/reference/between.html

# near()
# https://dplyr.tidyverse.org/reference/near.html
happy %>% 
  filter(near(ladder_score, 6, 0.5))

happy %>% 
  filter(near(ladder_score, mean(ladder_score), tol = sd(ladder_score)))

