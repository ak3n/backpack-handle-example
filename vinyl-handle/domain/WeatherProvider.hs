{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}

module WeatherProvider where

import HandleRec

type Temperature = Int
data WeatherData = WeatherData { temperature :: Temperature }

type Location = String
type Day = String

type Handle = HandleRec
  '[ '("getWeatherData", (Location -> Day -> IO WeatherData))
  ]
