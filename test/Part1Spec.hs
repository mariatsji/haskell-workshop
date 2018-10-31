import           Test.Tasty.QuickCheck as QC
import           Test.Tasty.Hspec      as H
import           Test.Hspec
import           Test.Tasty

import           Part1
import           Numeric.Natural
import           Prelude hiding (sum)


main = do
    unitTree <- unit
    defaultMain $ tests unitTree

-- Property tests

tests :: TestTree -> TestTree
tests tree = testGroup "Part1" $ tree : properties

properties :: [TestTree]
properties =
  [ QC.testProperty "helloWorld (property tests)" greetString
  , QC.testProperty "add (property tests)" addProp
  , QC.testProperty "count (property tests)" countList
  , QC.testProperty "sum (property tests)" sumList
  ]

countList :: [Int] -> Bool
countList xs = count xs == (fromIntegral . length $ xs)

addProp :: (Float, Float) -> Bool
addProp (a,b) = add a b == a + b

sumList :: [Int] -> Bool
sumList xs = sum xs == foldl (+) 0 xs

greetString :: String -> Bool
greetString s = length (helloWorld s) > length s

-- Unit Tests

unit :: IO TestTree
unit = H.testSpec "count (unit tests)" $ do
    helloWorldSpec
    addNrSpec
    countSpec
    sumSpec

helloWorldSpec :: Spec
helloWorldSpec = describe "helloWorld" $ do
  it "greets Anders" $ do
    helloWorld "Anders" `shouldBe` "Hello, Anders!"

addNrSpec :: Spec
addNrSpec = describe "add" $ do
  it "adds 3 and -3 to 0" $ do
    add 3 (-3) `shouldBe` 0
  it "adds 17 and 13 to 30" $ do
    add 17 13 `shouldBe` 30

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