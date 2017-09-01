# Find dates which are successive prime numbers in AD
library("tidyverse")
library("numbers") # to use "isPrime" function

# Prepare dates
md <- c("0101", "0201", "0301", "0401", "0601", "0801", "0901", "1101")
year <- 1800:2200
dates2 <- outer(year, md, paste0) %>% 
          t() %>% as.vector() %>% 
          as.Date(format="%Y%m%d")
dates1 <- dates2 - 1

# Convert Date class to integer
dates1 <- dates1 %>% format("%Y%m%d") %>%
          as.integer()
dates2 <- dates2 %>% format("%Y%m%d") %>%
          as.integer()

# Output
is_suc_prime_pair <- isPrime(dates1) & isPrime(dates2)
out <- data.frame(d1 = dates1[is_suc_prime_pair],
                  d2 = dates2[is_suc_prime_pair])
# Calculate time diff between two pairs of successive prime numbers
out <- out %>% mutate_all(as.character) %>% 
               mutate_all(as.Date, format="%Y%m%d") %>%
               mutate(diff = d1 - lag(d1))

print(out)
