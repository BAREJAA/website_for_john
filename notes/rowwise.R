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


