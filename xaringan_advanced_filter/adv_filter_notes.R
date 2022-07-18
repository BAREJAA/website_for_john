# start with a table of relational operators
# https://stat.ethz.ch/R-manual/R-devel/library/base/html/Comparison.html

# logical operators - 
# https://stat.ethz.ch/R-manual/R-devel/library/base/html/Logic.html

# SKIP ALL OF THIS!
happy %>% 
  filter(ladder_score < 5|gdp < 9, social_support > 0.7|country_name == "Spain")

# versus
happy %>% 
  filter(ladder_score < 5|gdp < 9 & social_support > 0.7|country_name == "Spain")
# the second one is WRONG!

# you have to do
happy %>% 
  filter((ladder_score < 5|gdp < 9) & (social_support > 0.7|country_name == "Spain"))

# so `,` is like a more "robust" `&`

# another (simpler) example
happy %>% 
  filter((ladder_score < 5|gdp < 9) & social_support > 0.7)
# correct

# versus
happy %>% 
  filter(ladder_score < 5|gdp < 9 & social_support > 0.7)
# wrong

# versus
happy %>% 
  filter(ladder_score < 5|gdp < 9, social_support > 0.7)
# correct!

happy %>% 
  filter(gdp < 9 & social_support > 0.7)

happy %>% 
  filter(ladder_score < 5)

