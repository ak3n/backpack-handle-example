module SuperWindProvider where

import Data.Vinyl
import WindProvider
import QueryTypes

new :: Handle
new = Field getSuperWindData
  :& RNil

getSuperWindData :: Location -> Day -> IO WindSpeed
getSuperWindData _ _ = return 5
