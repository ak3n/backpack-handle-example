{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}

module WeatherReporter where

import HandleRec
import Data.Vinyl as V

import qualified WeatherProvider

type WeatherReport = String

-- | We hide dependencies in the handle
data Handle = Handle { weatherProvider :: WeatherProvider.Handle }

-- | Constructor for Handle
new :: WeatherProvider.Handle -> Handle
new = Handle

-- | Domain logic. Usually some pure code that might use mtl, free monads, etc.
createWeatherReport :: WeatherProvider.WeatherData -> WeatherReport
createWeatherReport (WeatherProvider.WeatherData temp) =
  "The current temperature in London is " ++ (show temp)

-- | Domain logic that uses external dependency to get data and process it.
getCurrentWeatherReportInLondon :: Handle -> IO WeatherReport
getCurrentWeatherReportInLondon (Handle wph) = do
  weatherData <- (getMethod @"getWeatherData" wph) "London" "now"
  return $ createWeatherReport weatherData
