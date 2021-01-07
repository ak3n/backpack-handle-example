module Main where

import qualified SuperWeatherProvider
import qualified SuperWeatherReporter

-- | This is an actual application where we use
-- our concrete implementation of `WeatherProvider`.
main :: IO ()
main = do
  let wph = SuperWeatherProvider.new
  let wpr = SuperWeatherReporter.Handle wph
  weatherReportInLondon <- SuperWeatherReporter.getCurrentWeatherReportInLondon wpr
  putStrLn weatherReportInLondon
