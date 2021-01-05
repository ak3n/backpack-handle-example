module WeatherReporter where

import WeatherProvider

type WeatherReport = String

-- | Domain logic. Usually some pure code that might use mtl, free monads, etc.
createWeatherReport :: WeatherData -> WeatherReport
createWeatherReport (WeatherData temp) =
  "The current temperature in London is " ++ (show temp)

-- | Domain logic that uses external dependency to get data and process it.
getCurrentWeatherReportInLondon :: WeatherProvider.Handle -> IO WeatherReport
getCurrentWeatherReportInLondon wph = do
  weatherData <- WeatherProvider.getWeatherData wph "London" "now"
  return $ createWeatherReport weatherData
