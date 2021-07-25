library("sessioninfo")
library("here")
library("ggplot2")

# hello world
print("I'm Daniel")

# create a directory for the figures
dir.create(here::here("figures"), showWarnings = FALSE)

# example image
pdf(here::here("figures", "mtcars_gear_vs_mpg.pdf"),
    useDingbats = FALSE
)

ggplot(mtcars, aes(group = gear, y = mpg)) +
  geom_boxplot()

dev.off()

# to reproduce my code
options(width = 120)
sessioninfo::session_info()
