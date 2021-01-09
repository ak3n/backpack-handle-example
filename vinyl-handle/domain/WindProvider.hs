{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}

module WindProvider where

import HandleRec
import QueryTypes

type WindSpeed = Int

type Methods = '[ '("getWindData", (Location -> Day -> IO WindSpeed)) ]

type Handle = HandleRec Methods

