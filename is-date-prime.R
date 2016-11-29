# Find dates which are prime number in AD, Heisei, Kouki
library("numbers") # to use "isPrime" function

# Prepare dates
start_date <- "2017-01-01"
num_of_dates <- 365 # There are 365 days in common year
dates <- as.Date(0:(num_of_dates-1), origin = start_date)


disp_prime_date <- function(x, cal="AD"){
  y <- as.integer(format(x, "%Y")) # Year in AD
  if(cal == "Heisei"){
    y <- y - 1988
  } else if(cal == "Kouki"){
    y <- y + 660
  } else if(cal != "AD"){
    stop("Invalid cal")
  }
  int <- as.integer(paste0(y, (format(x, "%m%d"))))
  int[isPrime(int)]
}

# AD
disp_prime_date(dates)

# Heisei
disp_prime_date(dates, cal="Heisei")

# Kouki
disp_prime_date(dates, cal="Kouki")
