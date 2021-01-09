module SuperWeatherProvider where

import Data.Vinyl
import WeatherProvider
import TemperatureProvider (Temperature)
import WindProvider (WindSpeed)
import QueryTypes

new :: Handle
new = Field getSuperWeatherData
  :& Field getSuperWindData
  :& Field getSuperTemperatureData
  :& RNil

-- | This is some concrete implementation `WeatherProvider` interface
getSuperWeatherData :: Location -> Day -> IO WeatherData
getSuperWeatherData _ _ = return $ WeatherData 30 10

getSuperTemperatureData :: Location -> Day -> IO Temperature
getSuperTemperatureData _ _ = return 30

getSuperWindData :: Location -> Day -> IO WindSpeed
getSuperWindData _ _ = return 5
