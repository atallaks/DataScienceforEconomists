
#########################################################################################
#
# Grant McDermott
# Data Science for Economists
# 01: Intro
#
#########################################################################################

library(tidyverse)
library(gapminder)
library(hrbrthemes)
library(gganimate)


# regression
fit <- lm(mpg ~ wt, data = mtcars)
summary(fit)

# plot regression in base R
par(mar = c(4, 4, 1, .1))
plot(mtcars$wt, mtcars$mpg)
abline(fit, col = "red")

# Same as above, but in ggplot
library(ggplot2)
ggplot(data = mtcars, aes(x = wt, y = mpg)) + 
  geom_smooth(method = "lm", col = "red") + 
  geom_point()

# the gapminder dataset contains panel data on life expectancy, population size, and GDP per capita for 142 countries since the 1950s
summary(gapminder)

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, size = pop, col = continent)) + 
  geom_point(alpha = 0.3)


p = ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp))
p


p + 
  geom_point(alpha = 0.3)  +
  geom_smooth(method = "loess")


p + 
  geom_point(aes(size = pop, col = continent), alpha = 0.3)  +
  geom_smooth(method = "loess")


ggplot(data = gapminder) +
  geom_density(aes(x = gdpPercap, fill = continent), alpha=0.3)


p2 =
  p +
  geom_point(aes(size = pop, col = continent), alpha = 0.3) +
  scale_color_brewer(name = "Continent", palette = "Set1") + ## Different colour scale
  scale_size(name = "Population", labels = scales::comma) + ## Different point (i.e. legend) scale
  scale_x_log10(labels = scales::dollar) + ## Switch to logarithmic scale on x-axis. Use dollar units.
  labs(x = "Log (GDP per capita)", y = "Life Expectancy") + ## Better axis titles
  theme_minimal() ## Try a minimal (b&w) plot theme

p2 + theme_modern_rc() + geom_point(aes(size = pop, col = continent), alpha = 0.2)


ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')


