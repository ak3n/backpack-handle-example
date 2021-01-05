module WeatherProvider where

type Temperature = Int
data WeatherData = WeatherData { temperature :: Temperature }

type Location = String
type Day = String

-- | Our Handle is empty, but usually other dependencies are stored here
data Handle = Handle

-- | Constructor for Handle
new :: Handle
new = Handle

-- | This is some concrete implementation.
-- In this example we return a constant value.
getWeatherData :: Handle -> Location -> Day -> IO WeatherData
getWeatherData _ _ _ = return $ WeatherData 30
