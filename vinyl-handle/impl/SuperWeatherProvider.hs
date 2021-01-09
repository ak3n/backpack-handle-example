module SuperWeatherProvider where

import Data.Vinyl
import WeatherProvider
import qualified TemperatureProvider
import qualified WindProvider
import QueryTypes

new :: WindProvider.Handle -> TemperatureProvider.Handle -> Handle
new wp tp = Field getSuperWeatherData
  :& RNil <+> wp <+> tp

-- | This is some concrete implementation `WeatherProvider` interface
getSuperWeatherData :: Location -> Day -> IO WeatherData
getSuperWeatherData _ _ = return $ WeatherData 30 10
