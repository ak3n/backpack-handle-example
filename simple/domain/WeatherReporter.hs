module WeatherReporter where

import qualified WeatherProvider

type WeatherReport = String

-- | Domain logic. Usually some pure code that might use mtl, free monads, etc.
createWeatherReport :: WeatherProvider.WeatherData -> WeatherReport
createWeatherReport (WeatherProvider.WeatherData temp) =
  "The current temperature in London is " ++ (show temp)

-- | Domain logic that uses external dependency to get data and process it.
getCurrentWeatherReportInLondon :: IO WeatherReport
getCurrentWeatherReportInLondon = do
  weatherData <- WeatherProvider.getWeatherData "London" "now"
  return $ createWeatherReport weatherData
