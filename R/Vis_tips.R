library(gapminder)
library(tidyverse)

data <- gapminder

gapminder %>% filter(country == 'Mexico') %>% # filter by country
      arrange(desc(year)) # arrange in descending order

gapminder %>% ggplot(aes(x = lifeExp, y = gdpPercap)) +
    geom_histogram()

gf_point(births ~ day_of_year | year ~ wday, data = Births, size = 0.5) # facet by year as rows
                                                                        # and days of the week as columns
data %>% ggplot(x = education, y = income) %>%
    geom_boxplot() +
    scale_x_discrete(labels = 'Female', 'Male') # grid by gender

# TWO CATEGORICAL VALUES #
# Stacked plot
starwars %>%
  drop_na(eye_color, gender) %>%
  filter(eye_color %in% c("black", "brown", "blue", "yellow")) %>%
    ggplot(aes(eye_color, fill = gender)) + # to group by gender
      geom_bar(stat = "count", alpha = .5, show.legend = F) +
      labs(title = "Stacked barplot",
           x = "Eye colour",
           y = "Count")

starwars %>%
  drop_na(eye_color, gender) %>%
  filter(eye_color %in% c("black", "brown", "blue", "yellow")) %>%
  ggplot(aes(eye_color, fill = gender)) +
  geom_bar(stat = "count", alpha = .5,
           position="dodge", #to separate bar plots
           show.legend = F) +
  labs(title = "Grouped barplot",
       x = "Eye colour",
       y = "Count")

# Percentage barplot
starwars %>%
  drop_na(eye_color, gender) %>%
  filter(eye_color %in% c("black", "brown", "blue", "yellow")) %>%
  ggplot(aes(eye_color, fill = gender)) +
  geom_bar(stat = "count", alpha = .5,
           position="fill",
           show.legend = T) +
  labs(title = "Percentage barplot",
       x = "Eye colour",
       y = "Percentage") +
  theme(legend.position = "bottom")

# ONE OR MORE CATEGORICAL

# boxplot numeric
starwars %>%
  drop_na(gender) %>%
    ggplot(aes(height, fill = gender)) +
    geom_boxplot(alpha = 0.3) +
    labs(title = "Boxplot of a numeric variable",
         subtitle = "disagregated by one categorical variable",
         x = "Height", position)

# density numeric
starwars %>%
  drop_na(gender) %>%
  ggplot(aes(height, fill = gender)) +
  geom_density(alpha = 0.3) +
  labs(title = "Density plot of a numeric variable",
       subtitle = "disagregated by one categorical variable",
       x = "Height",
       y = "Probability")

# density numerical faceted
starwars %>%
  drop_na(hair_color, gender) %>%
  filter(hair_color %in% c("black", "brown")) %>%
  ggplot(aes(height, fill = gender)) +
  geom_density(alpha = 0.3) +
  facet_wrap(~hair_color) + # to show facets by hair color
  labs(title = "Density plot of a numeric variable",
       subtitle = "disagregated by two categorical variables",
       x = "Height",
       y = "Probability")

# boxplot numerical faceted
starwars %>%
  filter(height > 140 & height < 200) %>%
  drop_na(hair_color, gender) %>%
  filter(hair_color %in% c("black", "brown")) %>%
  ggplot(aes(height, fill = gender)) +
  geom_boxplot(alpha = 0.3) +
  facet_wrap(~hair_color) +
  labs(title = "Boxplot of a numeric variable",
       subtitle = "disagregated by two categorical variable",
       x = "Height")+
  theme(legend.position = "bottom")
