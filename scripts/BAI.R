library(tidyverse)

bai <- read_csv("data/qualtrics.csv") %>%
  select(contains("BDI"), contains("BAI")) %>%
  mutate(total = BDI + BAI)


ggplot(bai, aes(x = total)) +
  geom_histogram(bins = 30)
