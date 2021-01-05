module Main where

import qualified WeatherProvider
import qualified WeatherReporter

main :: IO ()
main = do
  let wph = WeatherProvider.new
  weatherReportInLondon <- WeatherReporter.getCurrentWeatherReportInLondon wph
  putStrLn weatherReportInLondon
