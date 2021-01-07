module SuperWeatherProvider where

type Temperature = Int
data WeatherData = WeatherData { temperature :: Temperature }

type Location = String
type Day = String

data Handle = Handle

new :: Handle
new = Handle

-- | This is some concrete implementation `WeatherProvider` interface
getWeatherData :: Handle -> Location -> Day -> IO WeatherData
getWeatherData _ _ _ = return $ WeatherData 30
