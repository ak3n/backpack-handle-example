{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}

module WindProvider where

import HandleRec
import QueryTypes

type WindSpeed = Int

type Methods = '[ '("getWindData", (Location -> Day -> IO WindSpeed)) ]

type Handle = HandleRec Methods

getWindData :: Handle -> Location -> Day -> IO WindSpeed
getWindData = getMethod @"getWindData"
