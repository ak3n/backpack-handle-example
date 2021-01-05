module WeatherReporter where

import WeatherProvider

type WeatherReport = String

-- | This is domain logic. It uses `WeatherProvider` to get the actual data.
getCurrentWeatherReportInLondon :: WeatherProvider.Handle -> IO WeatherReport
getCurrentWeatherReportInLondon wph = do
  weatherData <- WeatherProvider.getWeatherData wph "London" "now"
  return $ "Current temperature in London is " ++ (show $ temperature weatherData)