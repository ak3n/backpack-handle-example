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
  :& Field (getWindData (initWindSpeed config))
  :& Field (getTemperatureData (initTemperature config))
  :& RNil

-- | This is an implementation `WeatherProvider` interface for tests
-- We can configure it independently from other providers or reuse them.
getTestWeatherData :: T.Temperature -> W.WindSpeed -> Location -> Day -> IO WeatherData
getTestWeatherData temp wind _ _ = return $ WeatherData temp wind

getTemperatureData :: T.Temperature -> Location -> Day -> IO T.Temperature
getTemperatureData t _ _ = return t

getWindData :: W.WindSpeed -> Location -> Day -> IO W.WindSpeed
getWindData w _ _ = return w
