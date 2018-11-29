library(datasets)

airmiles

## Daily air quality measurements in New York, May to September 1973
airquality


austres
beaver1
cars


euro.cross
freeny


mdeaths
mtcars


nottem
Nile

df.Seatbelts <- as.data.frame(Seatbelts)
ts(Seatbelts)
plot.ts(Seatbelts)
data(Seatbelts)
data.class(Seatbelts)


tmp <- time(Seatbelts)
tmp


Seatbelts[,1]
names(Seatbelts)


date(Seatbelts)
library(xts)
index(Seatbelts)
as.POSIXct(as.Date(index(Seatbelts), "%Y %j"))

library(zoo)

as.yearmon(time(Seatbelts))
time(Seatbelts)
