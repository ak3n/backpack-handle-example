module WeatherProvider where

type Temperature = Int
data WeatherData = WeatherData { temperature :: Temperature }

type Location = String
type Day = String

-- | This is some concrete implementation.
-- In this example we return a constant value.
getWeatherData :: Location -> Day -> IO WeatherData
getWeatherData _ _ = return $ WeatherData 30
