# NOTE - col-wise should come after selection helpers
# Introduce this section by talking about how select() naturally (and by definition) is built to 
# easily worth with multiple columns

# from https://dplyr.tidyverse.org/dev/articles/colwise.html
# It’s often useful to perform the same operation on multiple columns, 
# but copying and pasting is both tedious and error prone
# example
happy_full %>% 
  group_by(region) %>% 
  summarise(mean_ladder = mean(ladder_score),
            mean_ss = mean(social_support),
            mean_hle = mean(healthy_life_expectancy))

# This vignette will introduce you to the across() function, 
# which lets you rewrite the previous code more succinctly:
happy_full %>% 
  group_by(region) %>% 
  summarise(across(c(ladder_score, social_support, healthy_life_expectancy), mean))

# across() has two primary arguments - 
# The first argument, .cols, selects the columns you want to operate on. 
# It uses tidy selection (like select()) so you can pick variables by position, name, and type
# The second argument, .fns, is a function or list of functions to apply to each 
# column. This can also be a purrr style formula (or list of formulas) like ~ .x / 2
# across() makes it easy to apply the same transformations to multiple columns
# across() returns a tibble with one column for each column in `.cols` and each functions in `.fns`

# another across example
happy_full %>% 
  summarise(across(where(is.character), n_distinct))

# applying multiple functions
# use happy here for simplicity
happy %>% 
  summarise(across(where(is.numeric), list(mean, sum)))

# versus (for better titles)
happy %>% 
  summarise(across(where(is.numeric), list(average = mean, total = sum)))

# show this also? maybe not...
# Control how the names are created with the .names argument which takes a glue spec:
happy %>% 
  summarise(across(where(is.numeric), list(average = mean, total = sum), .names = "{.col}_{.fn}"))

# other verbs
# So far we’ve focused on the use of across() with summarise(), but it works 
# with any other dplyr verb that uses data masking 
# simple example - 
happy %>% 
  mutate(across(where(is.numeric), ~. * 10))

# a more complex example
# BONUS - combines row-wise with col-wise
happy %>% 
  rowwise() %>% 
  mutate(total = sum(c_across(where(is.numeric)))) %>% 
  ungroup() %>% 
  mutate(across(ladder_score:social_support, ~ ./total * 100))
# break this example down into smaller parts
# NOTE: should this go at the end of the rowwise module?

# applying across to character AND numeric variables
happy %>% 
  summarise(
    across(where(is.character), list(distinct = n_distinct)),
    across(where(is.numeric), list(average = mean))
  )

# NOTE - show the filter examples in your "advanced filter" module
# if_any(), if_all()

# other examples
happy %>% 
  mutate(across(contains("_") & !country_name, ~ . * 100))
# NOTE: don't put contains() in where()!!!!!


