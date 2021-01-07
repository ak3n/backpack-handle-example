module Main where

import qualified WeatherReporter

main :: IO ()
main = do
  weatherReportInLondon <- WeatherReporter.getCurrentWeatherReportInLondon
  putStrLn weatherReportInLondon
