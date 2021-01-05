module WeatherProvider where

type Temperature = Int
data WeatherData = WeatherData { temperature :: Temperature }

type Location = String
type Day = String

-- | The interface of `WeatherProvider` with available methods.
data Handle = Handle
  { getWeatherData :: Location -> Day -> IO WeatherData
  }
