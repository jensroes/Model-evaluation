#https://vincentarelbundock.github.io/Rdatasets/doc/carData/Wong.html
#200 patients who sustained traumatic brain injuries resulting in comas of varying duration. 
# After awakening from their comas, patients were periodically administered a standard IQ test,
carData::Wong %>% ggplot(aes(x = piq)) + geom_histogram()

data <- carData::Wong %>% as_tibble() %>%
  mutate(iq = floor((piq + viq)/2)) %>%
  group_by(id) %>%
  mutate(n = length(id)) %>%
  filter(n == 2) %>%
  arrange(id, days) %>%
  mutate(test = rep(c("first","second"),n()/2))


m <- lm(iq ~ scale(duration)[,1], data = data, subset = test == "first")
summary(m)
plot(m)

ggplot(data, aes(x = duration, y = iq)) +
  geom_point() +
  geom_smooth(method = "lm") 
  scale_x_log10()
# What percent of people has an IQ lower than 122
# shade left side of distirbution
observed_mean = 100
observed_sd = 10
pnorm(122, mean = observed_mean, sd = observed_sd)
#pnorm(122, mean = observed_mean, sd = observed_sd, lower.tail = FALSE)
#1-pnorm(122, mean = observed_mean, sd = observed_sd)
# Difference
