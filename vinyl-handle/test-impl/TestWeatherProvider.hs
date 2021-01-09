module TestWeatherProvider where

import Data.Vinyl
import WeatherProvider

-- | This is a configuration that allows to setup the provider for tests.
data Config = Config
  { initTemperature :: Temperature
  }

new :: Config -> Handle
new config = Field (getTestWeatherData $ initTemperature config)
  :& RNil

-- | This is an implementation `WeatherProvider` interface for tests
getTestWeatherData :: Int -> Location -> Day -> IO WeatherData
getTestWeatherData temp _ _ = return $ WeatherData temp
