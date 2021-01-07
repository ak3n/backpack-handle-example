module SuperWeatherReporter where

import qualified SuperWeatherProvider

type WeatherReport = String

type WeatherProviderHandle = SuperWeatherProvider.Handle

-- | We hide dependencies in the handle
data Handle = Handle { weatherProvider :: SuperWeatherProvider.Handle }

-- | Constructor for Handle
new :: SuperWeatherProvider.Handle -> Handle
new = Handle

-- | Domain logic. Usually some pure code that might use mtl, free monads, etc.
createWeatherReport :: SuperWeatherProvider.WeatherData -> WeatherReport
createWeatherReport (SuperWeatherProvider.WeatherData temp) =
  "The current temperature in London is " ++ (show temp)

-- | Domain logic that uses external dependency to get data and process it.
getCurrentWeatherReportInLondon :: Handle -> IO WeatherReport
getCurrentWeatherReportInLondon (Handle wph) = do
  weatherData <- SuperWeatherProvider.getWeatherData wph "London" "now"
  return $ createWeatherReport weatherData
