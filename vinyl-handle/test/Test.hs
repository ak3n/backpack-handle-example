import Test.Hspec

import qualified TestWeatherProvider
import qualified WeatherProvider
import qualified TemperatureProvider
import qualified WindProvider
import qualified WeatherReporter

main :: IO ()
main = hspec spec

weatherWithTempAndWind
  :: TemperatureProvider.Temperature
  -> WindProvider.WindSpeed
  -> WeatherReporter.Handle
weatherWithTempAndWind t w = WeatherReporter.new
  $ TestWeatherProvider.new
  $ TestWeatherProvider.Config t w

spec :: Spec
spec = describe "WeatherReporter" $ do
  it "weather in London is 0 and wind is 5" $ do
    weatherReportInLondon <- WeatherReporter.getCurrentWeatherReportInLondon $
      weatherWithTempAndWind 0 5
    weatherReportInLondon `shouldBe` "The current temperature in London is 0 and wind speed is 5"
  it "weather in London is -5 and wind is 10" $ do
    weatherReportInLondon <- WeatherReporter.getCurrentWeatherReportInLondon $
      weatherWithTempAndWind (-5) 10
    weatherReportInLondon `shouldBe` "The current temperature in London is -5 and wind speed is 10"
