module SuperTemperatureProvider where

import Data.Vinyl
import TemperatureProvider
import QueryTypes

new :: Handle
new = Field getSuperTemperatureData
  :& RNil

getSuperTemperatureData :: Location -> Day -> IO Temperature
getSuperTemperatureData _ _ = return 30
