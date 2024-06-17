library(tidyverse)
library(here)
library(readxl)

# source: https://www.cbsl.gov.lk/en/statistics/statistical-tables/external-sector


data <- read_excel(here("data-raw", "table2.14.1_20240408.xlsx"), sheet=2)
View(data)
colnames(data)
earnings <- pivot_longer(data, 
                   cols = 2:16,
                   names_to = 'Year',
                   values_to = 'Earnings')
View(earnings)
earnings$Earnings <- round(df$Earnings, 1)
View(earnings)
summary(earnings$Earnings)
save(earnings, file = here("data", "earnings.rda"))
