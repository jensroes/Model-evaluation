library(tidyverse)
library(countrycode)

data <- BaM::iq %>%
  pivot_longer(everything(), names_to = "country", values_to = "iq") %>%
  mutate(country = gsub("[.]", " ", country)) 

write_csv(data, "data/country.csv")

