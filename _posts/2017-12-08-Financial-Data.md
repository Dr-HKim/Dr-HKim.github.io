---
layout: post  
title: 금융 데이터 불러오기 (Using Fiancial Data)  
date: 2017-12-08  
category: [Data Analysis]  
tag: [R]  
author: hkim  
hidden: false # don't count this post in blog pagination  
image: /assets/images/icon/iconmonstr-monitoring-6-240.png
headerImage: true

---

***preface*** 이번 포스트에서는 R 에서 직접 경제 및 금융 데이터를 불러오는 방법을 알아보겠습니다.


다음 자료를 참고하였습니다:  
- [https://statkclee.github.io/statistics/stat-fe-import.html](https://statkclee.github.io/statistics/stat-fe-import.html)
- [http://rstudio-pubs-static.s3.amazonaws.com/24858_1f006c3965614b0099c963913100e9f0.html](http://rstudio-pubs-static.s3.amazonaws.com/24858_1f006c3965614b0099c963913100e9f0.html)
- [https://chrisconlan.com/download-historical-stock-data-google-r-python/](https://chrisconlan.com/download-historical-stock-data-google-r-python/)

R 에서 quantmod 패키지와 Quandl 패키지를 이용하여 금융 데이터를 불러올 수 있습니다.

## quantmod 패키지

```r
library(quantmod)

# 지수
DJIA  <- getSymbols(Symbols = "%5EDJI", src = "yahoo", from = "2017-01-01", to = Sys.Date(), auto.assign = FALSE)
KOSPI <- getSymbols(Symbols = "KRX:KOSPI", src = "google", from = "2017-01-01", to = Sys.Date(), auto.assign = FALSE)

# 환율 (oanda 는 과거 180일간의 자료만 제공하므로 주의)
USDKRW <- getSymbols(Symbols = "USD/KRW", src = "oanda", from = Sys.Date() - 180, to = Sys.Date(), auto.assign = FALSE)

# 개별 종목
SSE <- getSymbols(Symbols = "005930.KS", src = "yahoo", from = "2017-01-01", to = Sys.Date(), auto.assign = FALSE)

# 경제: T-Note 10 년
TNOTE <- getSymbols(Symbols = "%5ETNX", src = "yahoo", from = "2017-01-01", to = Sys.Date(), auto.assign = FALSE) # DAILY
TNOTE <- getSymbols(Symbols = "WGS10YR", src = "FRED", from = "1990-01-01", to = Sys.Date(), auto.assign = FALSE) # WEEKLY

# 경제: 실업률
UNEMP <- getSymbols(Symbols = "LRHUTTTTKRA156N", src = "FRED", from = "1990-01-01", to = Sys.Date(), auto.assign = FALSE)
```

다음은 quantmod 의 함수를 reverse engineering 하여 만들어낸 함수입니다.

```r
# Function to fetch google stock data
google_stocks <- function(sym, current = TRUE, sy = 2005, sm = 1, sd = 1, ey, em, ed)
{
  # sy, sm, sd, ey, em, ed correspond to
  # start year, start month, start day, end year, end month, and end day

  # If TRUE, use the date as the enddate
  if(current){
    system_time <- as.character(Sys.time())
    ey <- as.numeric(substr(system_time, start = 1, stop = 4))
    em <- as.numeric(substr(system_time, start = 6, stop = 7))
    ed <- as.numeric(substr(system_time, start = 9, stop = 10))
  }

  require(data.table)

  # Fetch data from google
  google_out = tryCatch(
    suppressWarnings(
      fread(paste0("http://finance.google.com/finance/historical",
                   "?q=", sym,
                   "&startdate=", paste(sm, sd, sy, sep = "+"),
                   "&enddate=", paste(em, ed, ey, sep = "+"),
                   "&output=csv"), sep = ",")),
    error = function(e) NULL
  )

  # If successful, rename first column
  if(!is.null(google_out)){
    names(google_out)[1] = "Date"
  }

  return(google_out)
}

# Test it out
KOSPI = google_stocks('KOSPI')
AAPL = google_stocks('AAPL')


```


## Quandl 패키지

Quandl 패키지는 [Quandl.com](https://www.quandl.com)에 회원가입을 한 후 인증키를 받아서 사용합니다.

원래 구글 파이낸스 데이터를 그대로 불러올 수 있어서 강력했던 것 같지만 지금은 구글이 provider 에서 빠지면서 유용성이 좀 떨어졌습니다.

```r
# Quandl 패키지 설치
# install.packages("Quandl")

# Quandl 패키지 불러오기
library(Quandl)

# API KEY 인증
Quandl.api_key("YOURAPIKEY")

# US Federal Reserve / GDP
data <- Quandl("FRED/GDP", start_date="2001-12-31", end_date="2005-12-31")

# US Federal Reserve / KOREA -- SPOT EXCHANGE RATE, WON/US$, Business day
krwusd <- Quandl("FED/RXI_N_B_KO", start_date="2001-12-31", end_date="2017-12-09")

# US Federal Reserve / KOREA -- SPOT EXCHANGE RATE, WON/US$, Monthly
krwusd <- Quandl("FED/RXI_N_M_KO", start_date="2001-12-31", end_date="2017-12-09")
```

## 그 외

그 외 다른 유용한 데이터 소스가 있으면 공유 바랍니다.
