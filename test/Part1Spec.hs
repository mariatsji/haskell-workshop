import           Test.Tasty.QuickCheck as QC
import           Test.Tasty.Hspec      as H
import           Test.Hspec
import           Test.Tasty

import           Part1
import           Numeric.Natural
import           Prelude hiding (sum)


countList :: [Int] -> Bool
countList xs = count xs == (fromIntegral . length $ xs)

sumList :: [Int] -> Bool
sumList xs = sum xs == foldl (+) 0 xs

main = do
  unitTree <- unit
  defaultMain $ tests unitTree

tests :: TestTree -> TestTree
tests tree = testGroup "Part1" $ tree : properties

properties :: [TestTree]
properties =
  [ QC.testProperty "count (property tests)" countList
  , QC.testProperty "sum (property tests)" sumList
  ]

unit :: IO TestTree
unit = H.testSpec "count (unit tests)" $ do
    countSpec
    sumSpec

countSpec :: Spec
countSpec = describe "count" $ do
  it "counts the length of [] to 0" $ do
    count [] `shouldBe` 0
  it "counts the length of [2,5,2,3,6,3,4] to 7" $ do
    count [2,5,2,3,6,3,4] `shouldBe` 7

sumSpec :: Spec
sumSpec = describe "sum" $ do
  it "sums [] to 0" $ do
    sum [] `shouldBe` 0
  it "sums [-5,2,13] to 10" $ do
    sum [-5,2,13] `shouldBe` 10