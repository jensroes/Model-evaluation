library(tidyverse)
library(readxl)

data <- read_xlsx("data/samlet.xlsx") %>%
  select(ID, Age, "RTH-D") %>% # RT hand / feet / selected dominant hand
  rename(id = ID, age = Age, rt = `RTH-D`) %>%
  mutate(age_2 = cut(age, breaks = 2, labels = c("young-ish", "old-ish")),
         age_3 = cut(age, breaks = 3, labels = c("young-ish", "middle", "old-ish"))) %>%
  drop_na() %>%
  select(id, age, age_2, age_3, rt)

write_csv(data, "data/blomkvist.csv")
