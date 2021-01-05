module Main where

import qualified SuperWeatherProvider
import qualified WeatherProvider
import qualified WeatherReporter

-- | This is an actual application where we use
-- our concrete implementation of `WeatherProvider`.
main :: IO ()
main = do
  let wph = SuperWeatherProvider.new
  weatherReportInLondon <- WeatherReporter.getCurrentWeatherReportInLondon wph
  putStrLn weatherReportInLondon
