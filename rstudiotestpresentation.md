Bitcoin Infoportal
========================================================
author: 
date: 2015-19-09

Bitcoin Infoportal
========================================================

- Bitcoin Infoportal provides information about bitcoin exchange rates
- Features charting of historical data, prediction about future development
as well as a calculator
- Grabs its data from the data marketplace Quandl (quandl.com) using R library,
e.g.:


```r
library(Quandl)
BTCtoUSD <- Quandl("BAVERAGE/USD", start_date="2015-08-01", 
                   end_date="2015-08-31")
```

- *BTCtoUSD* now holds a dataframe with the BTC/USD exchange rate information for
August 2015.

Charting Panel
========================================================

- Plots the exchange rate history for selected currency
- User can select currency to compare with from predefined list
- Data range can be selected by the user
- Both logarithmic and linear scale possible


Prediction & Calculator Panel
========================================================
- The prediction panel converts the historical data into a timeseries to
perform a prediction for future rates
- It uses the *forecast* package
- Notably, this is simply for demonstrational purposes as a placeholder for
more sophisticated prediction approaches

<hr />

- Finally, the portal also features an exchange calculator
- Conversion from Bitcoin to the supported currency is supported
and vice versa

Summary
========================================================
- Bitcoin Infoportal provides important information about Bitcoin exchange rates
- Data is always up-to-date because it is fetched on page load from Quandl

- Possible improvements include caching of data to reduce interactions with
data provider, support of additional currencies and a realtime of exchange
rate changes

shinyapps: https://mgoettsche.shinyapps.io/BitcoinInfoportal

GitHub: https://github.com/michael415/BitcoinInfoportal
