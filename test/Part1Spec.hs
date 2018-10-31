import           Test.Tasty.QuickCheck as QC
import           Test.Tasty.Hspec      as H
import           Test.Hspec
import           Test.Tasty

import           Part1
import           Numeric.Natural


countList :: [Int] -> Bool
countList xs = count xs == (fromIntegral . length $ xs)

main = do
  unit <- units
  defaultMain $ tests unit

tests :: TestTree -> TestTree
tests tree = testGroup "Part1" $ tree : properties

properties :: [TestTree]
properties = [QC.testProperty "count == length (property test)" countList]

units :: IO TestTree
units = H.testSpec "count == length (unit test)" spec

spec :: Spec
spec = it "counts the length of a list of Int" $ do
    let res = count [2,5,2,3,6,3,4]
    res `shouldBe` 7
    