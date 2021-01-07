module TestWeatherProvider where

type Temperature = Int
data WeatherData = WeatherData { temperature :: Temperature }

type Location = String
type Day = String

-- | This is a configuration that allows to setup the provider for tests.
data Config = Config
  { initTemperature :: Temperature
  }

data Handle = Handle
  { config :: Config
  }

new :: Config -> Handle
new = Handle

-- | This is an implementation `WeatherProvider` interface for tests
getWeatherData :: Handle -> Location -> Day -> IO WeatherData
getWeatherData (Handle conf) _ _ = return $ WeatherData $ initTemperature conf
