module SuperWeatherProvider where

import Data.Vinyl
import WeatherProvider
import TemperatureProvider (Temperature)
import WindProvider (WindSpeed)
import QueryTypes

new :: Handle
new = Field getSuperWeatherData
  :& Field getWindData
  :& Field getTemperatureData
  :& RNil

-- | This is some concrete implementation `WeatherProvider` interface
getSuperWeatherData :: Location -> Day -> IO WeatherData
getSuperWeatherData _ _ = return $ WeatherData 30 10

getTemperatureData :: Location -> Day -> IO Temperature
getTemperatureData _ _ = return 30

getWindData :: Location -> Day -> IO WindSpeed
getWindData _ _ = return 5
