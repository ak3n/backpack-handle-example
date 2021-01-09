module SuperWeatherProvider where

import Data.Vinyl
import WeatherProvider

new :: Handle
new = Field getSuperWeatherData
  :& RNil

-- | This is some concrete implementation `WeatherProvider` interface
getSuperWeatherData :: Location -> Day -> IO WeatherData
getSuperWeatherData _ _ = return $ WeatherData 30
