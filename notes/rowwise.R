# rowwise notes
# https://www.tidyverse.org/blog/2020/04/dplyr-1-0-0-rowwise/

library(dplyr)
df <- tibble(
  student_id = 1:4, 
  test1 = 10:13, 
  test2 = 20:23, 
  test3 = 30:33, 
  test4 = 40:43
)
df

df %>% mutate(avg = mean(c(test1, test2, test3, test4)))
# this just produces 
mean(c(mean(10:13), mean(20:23), mean(30:33), mean(40:43)))
# no it doesn't!!

df %>% 
  rowwise(student_id) %>% 
  mutate(avg = mean(c(test1, test2, test3, test4)))

# happy emaples
# simple example - compute the mean of all the numeric metrics for `happy` for each country
# naive approach
happy %>% 
  mutate(average = mean(c(ladder_score, gdp, social_support))) # we have to use c()
# the problem is that this produces mean over the whole data frame, not for each country
# solution -
happy %>% 
  rowwise() %>% 
  mutate(average = mean(c(ladder_score, gdp, social_support)))
# now it works!

# rowwise() works well with c_across()
# c_across() is designed to work with rowwise() to make it easy to perform row_wise aggregations
# It also designed to work with selection helpers
# simple example - 
happy %>% 
  rowwise() %>% 
  mutate(avergae = mean(c_across(where(is.numeric))))

# from https://dplyr.tidyverse.org/dev/articles/rowwise.html
# dplyr, and R in general, are particularly well suited to performing operations over columns, 
# and performing operations over rows is much harder

# There are three common use cases that we discuss in this vignette:
# - Row-wise aggregates (e.g. compute the mean of x, y, z).
# - Calling a function multiple times with varying arguments.
# - Working with list-columns. 

# combining row-wise and column-wise operations
happy %>% 
  rowwise() %>% 
  mutate(total = sum(c_across(where(is.numeric)))) %>% 
  ungroup() %>% 
  mutate(across(ladder_score:social_support, ~ ./total * 100))
# the rest is too complex for now...

# from https://dplyr.tidyverse.org/reference/c_across.html 

happy %>% 
  rowwise() %>% 
  mutate(
    average = mean(c_across(where(is.numeric))),
    total = sum(c_across(where(is.numeric)))
  )

# NOTE: state that knowing when to use c_across() vs. across() can be tricky, so remind students
# that c_across() goes with rowwise()