module TestWeatherProvider where

import WeatherProvider

-- | This is a configuration that allows to setup the provider for tests.
data Config = Config
  { initTemperature :: Temperature
  }

new :: Config -> Handle
new config = Handle
  { getWeatherData = getTestWeatherData $ initTemperature config
  }

-- | This is an implementation `WeatherProvider` interface for tests
getTestWeatherData :: Int -> Location -> Day -> IO WeatherData
getTestWeatherData temp _ _ = return $ WeatherData temp
