# Find dates which are prime number in Heisei
library("numbers") # to use "isPrime" function
library("tidyverse")

# Make a Date vector of Heisei era
start_date <- "1989-01-08" # the first day of Heisei era
end_date <- "2019-04-30" # the last day of Heisei era
dates <- tibble(Date = seq(
             as.Date(start_date), 
             as.Date(end_date), by = "day")
        )

# Make a data frame which shows whether the date is prime or not
dates %>% mutate(Year = as.integer(format(Date, "%Y"))) %>%
  mutate(AD_int = as.integer(format(Date, "%Y%m%d"))) %>%
  mutate(Heisei_int = as.integer(
    paste0(Year - 1988, (format(Date, "%m%d"))))) %>%
  mutate(Is_prime_AD = isPrime(AD_int)) %>%
  mutate(Is_prime_Heisei = isPrime(Heisei_int)) -> dates

# Output all prime dates of Heisei era
dates %>% filter(Is_prime_Heisei == T) %>% 
  write_csv("prime_dates_heisei.csv")

# How many dates are prime number each year?
dates %>% filter(Is_prime_Heisei == T) %>%
  count(Year) %>% arrange(n)-> result
