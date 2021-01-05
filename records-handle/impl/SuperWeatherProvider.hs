module SuperWeatherProvider where

import WeatherProvider

new :: Handle
new = Handle
  { getWeatherData = getSuperWeatherData
  }

-- | This is some concrete implementation `WeatherProvider` interface
getSuperWeatherData :: Location -> Day -> IO WeatherData
getSuperWeatherData _ _ = return $ WeatherData 30