module TestWeatherProvider where

import Data.Vinyl
import WeatherProvider
import qualified TemperatureProvider as T
import qualified WindProvider as W
import QueryTypes

-- | This is a configuration that allows to setup the provider for tests.
data Config = Config
  { initTemperature :: T.Temperature
  , initWindSpeed :: W.WindSpeed
  }

new :: Config -> Handle
new config = Field (getTestWeatherData (initTemperature config) (initWindSpeed config))
  :& Field (getTestWindData (initWindSpeed config))
  :& Field (getTestTemperatureData (initTemperature config))
  :& RNil

-- | This is an implementation `WeatherProvider` interface for tests
-- We can configure it independently from other providers or reuse them.
getTestWeatherData :: T.Temperature -> W.WindSpeed -> Location -> Day -> IO WeatherData
getTestWeatherData temp wind _ _ = return $ WeatherData temp wind

getTestTemperatureData :: T.Temperature -> Location -> Day -> IO T.Temperature
getTestTemperatureData t _ _ = return t

getTestWindData :: W.WindSpeed -> Location -> Day -> IO W.WindSpeed
getTestWindData w _ _ = return w
