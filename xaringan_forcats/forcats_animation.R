library(tidyverse)
library(gganimate)

df_f <- tribble(
  ~letter, ~time, ~y, ~x,
  "F", 1, 1, 1,
  "F", 2, 1, 1
)

df_a <- tribble(
  ~letter, ~time, ~y,
  "A", 1, 1,
  "A", 2, 1
)
df_a$x <- seq(5, 2, length.out=2)

df_c <- tribble(
  ~letter, ~time, ~y,
  "C", 1, 1,
  "C", 2, 1
)
df_c$x <- seq(4, 3, length.out=2)

df_t <- tribble(
  ~letter, ~time, ~y,
  "T", 1, 1,
  "T", 2, 1
)
df_t$x <- seq(6, 4, length.out=2)

df_o <- tribble(
  ~letter, ~time, ~y,
  "O", 1, 1,
  "O", 2, 1
)
df_o$x <- seq(2, 5, length.out=2)

df_r <- tribble(
  ~letter, ~time, ~y,
  "R", 1, 1,
  "R", 2, 1
)
df_r$x <- seq(3, 6, length.out=2)

df_s <- tribble(
  ~letter, ~time, ~y,
  "S", 1, 1,
  "S", 2, 1
)
df_s$x <- 7

df <- bind_rows(df_f, df_a, df_c, df_t, df_o, df_r, df_s)

# animation
df %>% 
  ggplot(aes(x, y)) +
  geom_text(aes(label = letter)) +
  theme_void() +
  transition_states(
    time
  ) 

animate(df_anim, nframes = 100)

