# NOTE: have a separate section on just if{} else{}

# from https://rdrr.io/r/base/ifelse.html
# base R ifelse()
ifelse(happy$ladder_score > 5, TRUE, FALSE)

# dplyr has if_else()
# it looks like it does the same thing
if_else(happy$ladder_score > 5, TRUE, FALSE)

# Compared to the base ifelse(), this function is more strict. 
# It checks that true and false are the same type. This strictness makes the output type 
# more predictable, and makes it somewhat faster

# so you can use ifelse() to do something silly like
ifelse(happy$ladder_score > 5, TRUE, "apple")

# but not if_else()!
if_else(happy$ladder_score > 5, TRUE, "apple")

# example of using if_else() and mutate()
happy %>% 
  mutate(in_europe = if_else(country_name == "Spain", "yes", "no"))
  
  