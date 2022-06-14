# unite
# from https://tidyr.tidyverse.org/reference/unite.html
# simple example
happy_full %>% 
  unite("country_region", c(country_name, region))
# point out that the default separator is an underscore and that we can specify what this

# keep the original columns
happy_full %>% 
  unite("country_region", c(country_name, region), remove = FALSE)


# specify separator
happy_full %>% 
  unite("country_region", c(country_name, region), sep = ".")

# separate
# https://tidyr.tidyverse.org/reference/separate.html
# show two examples
happy_full %>% 
  unite("country_region", c(country_name, region), remove = TRUE) %>% 
  separate(country_region, c("country_name", "region"), sep = "_")

# also show this because of the literal "." trick
happy_full %>% 
  unite("country_region", c(country_name, region), remove = TRUE, sep = ".") %>% 
  separate(country_region, c("country_name", "region"), sep = "\\.")
# show why the following won't work - 
happy_full %>% 
  unite("country_region", c(country_name, region), remove = TRUE, sep = ".") %>% 
  separate(country_region, c("country_name", "region"), sep = ".")
# this doesn't work because if `sep = ` is a character, it will be interpreted as a REGULAR EXPRESSION
# refer to the stringr cheatsheet for similar such exceptions
