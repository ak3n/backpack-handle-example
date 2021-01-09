module Main where

import qualified SuperWeatherProvider
import qualified SuperWindProvider
import qualified SuperTemperatureProvider
import qualified WeatherProvider
import qualified WeatherReporter

-- | This is an actual application where we use
-- our concrete implementation of `WeatherProvider`.
main :: IO ()
main = do
  let
    wp = SuperWindProvider.new
    tp = SuperTemperatureProvider.new
    wph = SuperWeatherProvider.new wp tp
    wrh = WeatherReporter.new wph
  weatherReportInLondon <- WeatherReporter.getCurrentWeatherReportInLondon wrh
  putStrLn weatherReportInLondon
