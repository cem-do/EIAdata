# Example script to download and plot data from EIA
# Requires an API key from https://www.eia.gov/opendata/

library(EIAdata)

# Replace with your own EIA API key
api_key <- "YOUR_API_KEY"

# Example series: WTI and Brent crude oil spot prices (daily)
series_ids <- c(WTI = "PET.RWTC.D", Brent = "PET.RBRTE.D")

# Download each series as an xts object
prices <- lapply(series_ids, getEIA, key = api_key)

# Merge the series into a single xts object
prices_xts <- do.call(merge, prices)

# Basic plot of both series
plot(prices_xts, major.ticks = 'years', main = "WTI vs Brent Spot Prices")

# Calculate and plot the spread between the two series
spread <- prices_xts[, "WTI"] - prices_xts[, "Brent"]
plot(spread, main = "WTI minus Brent Spread")

# Simple summary statistics of the spread
summary(spread)
