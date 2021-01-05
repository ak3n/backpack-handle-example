import Test.Hspec

import qualified TestWeatherProvider
import qualified WeatherProvider
import qualified WeatherReporter

main :: IO ()
main = hspec spec

weatherWithTemp :: WeatherProvider.Temperature -> WeatherProvider.Handle
weatherWithTemp = TestWeatherProvider.new . TestWeatherProvider.Config 

spec :: Spec
spec = describe "WeatherReporter" $ do
  it "weather in London is 0" $ do
    weatherReportInLondon <- WeatherReporter.getCurrentWeatherReportInLondon $
      weatherWithTemp 0
    weatherReportInLondon `shouldBe` "Current temperature in London is 0"
  it "weather in London is -5" $ do
    weatherReportInLondon <- WeatherReporter.getCurrentWeatherReportInLondon $
      weatherWithTemp (-5)
    weatherReportInLondon `shouldBe` "Current temperature in London is -5"
