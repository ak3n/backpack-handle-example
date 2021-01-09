{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}

module TemperatureProvider where

import HandleRec
import QueryTypes

type Temperature = Int

type Methods = '[ '("getTemperatureData", (Location -> Day -> IO Temperature)) ]

type Handle = HandleRec Methods
