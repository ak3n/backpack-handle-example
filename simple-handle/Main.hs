module Main where

import qualified WeatherProvider
import qualified WeatherReporter

main :: IO ()
main = do
  let wph = WeatherProvider.new
  let wrh = WeatherReporter.new wph
  weatherReportInLondon <- WeatherReporter.getCurrentWeatherReportInLondon wrh
  putStrLn weatherReportInLondon
