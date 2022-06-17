# from https://dplyr.tidyverse.org/reference/slice.html
# slice() lets you index rows by their (integer) locations. It allows you to select, remove, 
# and duplicate rows. It is accompanied by a number of helpers for common use cases - 
# slice_head() and slice_tail()
# slice_sample()
# slice_min() and slice_max()

happy %>% 
  slice(1)

happy %>% 
  slice(1:3)

happy %>% 
  slice_head(n = 2)

happy %>% 
  slice_tail(n = 2)

happy %>% 
  slice_sample(n = 3)

happy %>% 
  slice_sample(prop = 3/5)

happy %>% 
  slice_min(ladder_score)

happy %>% 
  slice_min(ladder_score, n = 2)

happy %>% 
  slice_max(ladder_score)

happy %>% 
  slice_max(ladder_score, n = 2)
