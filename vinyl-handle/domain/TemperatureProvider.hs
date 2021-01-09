{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}

module TemperatureProvider where

import HandleRec
import QueryTypes

type Temperature = Int

type Methods = '[ '("getTemperatureData", (Location -> Day -> IO Temperature)) ]

type Handle = HandleRec Methods

getTemperatureData :: Handle -> Location -> Day -> IO Temperature
getTemperatureData = getMethod @"getTemperatureData"
