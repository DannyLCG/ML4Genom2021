library(tidyverse)
library(gapminder)

p1 <- starwars %>%
  ggplot(aes(x = height)) +
  geom_histogram(binwidth = 20,
                 show.legend = F,
                 alpha = .5) +
  labs(title = "Histogram",
       x = "Height",
       y = "Count")

p2 <- starwars %>%
  ggplot(aes(x = height)) +
  geom_density(aes(fill = "blue"),
               show.legend = F,
               alpha = .5) +
  labs(title = "Density plot",
       x = "Height",
       y = "Probability")

p3 <- starwars %>%
  ggplot(aes(x = height)) +
  geom_boxplot(show.legend = F,
               alpha = .5) +
  labs(title = "Boxplot",
       x = "Height")

p3a <- starwars %>%
  ggplot(aes(x = height, y = 1)) +
  geom_violin(aes(fill = "blue"),
              show.legend = F,
              alpha = .5)+
  labs(title = "Violin plot",
       x = "Height")

