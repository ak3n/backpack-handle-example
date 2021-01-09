{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}

module WeatherProvider where

import Data.Vinyl.TypeLevel
import HandleRec
import qualified WindProvider as W
import qualified TemperatureProvider as T
import QueryTypes

data WeatherData = WeatherData { temperature :: T.Temperature, wind :: W.WindSpeed }

-- We union the methods of providers and extend it with a common method.
type Methods = '[ '("getWeatherData", (Location -> Day -> IO WeatherData))
  ] ++ W.Methods ++ T.Methods

type Handle = HandleRec Methods

