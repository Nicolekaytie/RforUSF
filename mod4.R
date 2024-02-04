install.packages("tidyverse")
library(tidyverse)
frequency<- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
bloodp <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
first <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)
second <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)
final_decision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)
df <- data.frame(frequency, bloodp, first, second, final_decision)
df
ggplot(data = df, 
       mapping = aes(x = as.factor(final_decision),  # Convert to factor if it's categorical
                     y = frequency)) +
  geom_boxplot()
ggplot(data = df, 
       mapping = aes(x = as.factor(final_decision),  # Convert to factor if it's categorical
                     y = bloodp)) +
  geom_boxplot()
#how to make a histogram
df %>%
  gather(variable, value, -final_decision) %>%
  ggplot(aes(x = value, fill = as.factor(final_decision))) +
  geom_bar(position = "dodge", stat = "count", binwidth = 0.1) +
  facet_grid(.~variable, scales = "free_x") +
  theme_minimal()
