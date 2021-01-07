module Main where

import qualified SuperWeatherProvider
import qualified WeatherProvider
import qualified WeatherReporter

-- | This is an actual application where we use
-- our concrete implementation of `WeatherProvider`.
main :: IO ()
main = do
  let wph = SuperWeatherProvider.new
  let wrh = WeatherReporter.new wph
  weatherReportInLondon <- WeatherReporter.getCurrentWeatherReportInLondon wrh
  putStrLn weatherReportInLondon
