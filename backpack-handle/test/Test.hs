import Test.Hspec

import qualified WeatherProvider
import qualified WeatherReporter

main :: IO ()
main = hspec spec

weatherWithTemp :: WeatherProvider.Temperature -> WeatherReporter.Handle
weatherWithTemp = WeatherReporter.new
  . WeatherProvider.new
  . WeatherProvider.Config

spec :: Spec
spec = describe "WeatherReporter" $ do
  it "weather in London is 0" $ do
    weatherReportInLondon <- WeatherReporter.getCurrentWeatherReportInLondon $
      weatherWithTemp 0
    weatherReportInLondon `shouldBe` "The current temperature in London is 0"
  it "weather in London is -5" $ do
    weatherReportInLondon <- WeatherReporter.getCurrentWeatherReportInLondon $
      weatherWithTemp (-5)
    weatherReportInLondon `shouldBe` "The current temperature in London is -5"
