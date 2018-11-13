import           Test.Hspec
import           Test.Tasty
import           Test.Tasty.Hspec      as H
import           Test.Tasty.QuickCheck as QC

import           Numeric.Natural
import           Part1
import           Part2
import           Prelude               hiding (sum)

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
addProp (a, b) = add a b == a + b

sumList :: [Int] -> Bool
sumList xs = sum xs == foldl (+) 0 xs

greetString :: String -> Bool
greetString s = length (helloWorld s) > length s

-- Unit Tests
unit :: IO TestTree
unit =
  H.testSpec "count (unit tests)" $ do
    helloWorldSpec
    addNrSpec
    countSpec
    sumSpec
    applySpec
    applysSpec
    bitSpec
    refactorSpec

helloWorldSpec :: Spec
helloWorldSpec =
  describe "helloWorld" $ do
    it "greets Anders" $ do helloWorld "Anders" `shouldBe` "Hello, Anders!"

addNrSpec :: Spec
addNrSpec =
  describe "add" $ do
    it "adds 3 and -3 to 0" $ do add 3 (-3) `shouldBe` 0
    it "adds 17 and 13 to 30" $ do add 17 13 `shouldBe` 30

isSevenSpec :: Spec
isSevenSpec =
  describe "isSeven" $ do
    it "checks that a number is 7 using 0" $ do isSeven 0 `shouldBe` False
    it "checks that a number is 7 using 7" $ do isSeven 7 `shouldBe` True

countSpec :: Spec
countSpec =
  describe "count" $ do
    it "counts the length of [] to 0" $ do count [] `shouldBe` 0
    it "counts the length of [2,5,2,3,6,3,4] to 7" $ do
      count [2, 5, 2, 3, 6, 3, 4] `shouldBe` 7

sumSpec :: Spec
sumSpec =
  describe "sum" $ do
    it "sums [] to 0" $ do sum [] `shouldBe` 0
    it "sums [-5,2,13] to 10" $ do sum [-5, 2, 13] `shouldBe` 10

applySpec :: Spec
applySpec =
  describe "apply" $ do
    it "applies the identity function with no apparent result to the number 15" $ do
      apply id 15 `shouldBe` 15
    it "applies the succ function to 17 to find 18" $ do
      apply succ 17 `shouldBe` 18
    it "applies the length function to the String \"catnip\" to find 6" $ do
      apply length "catnip" `shouldBe` 6

applysSpec :: Spec
applysSpec =
  describe "applys" $ do
    it "applies some function to the empty list returning the empty list" $ do
      applys length ([] :: [String]) `shouldBe` []
    it
      "applies the identity function with no apprent result to the numbers [5,1,-2]" $ do
      applys id [5, 1, -2] `shouldBe` [5, 1, -2]
    it "spplies the length function on [\"catnip\", \"catfood\"] to find [6,7]" $ do
      applys length ["catnip", "catfood"] `shouldBe` ([6, 7] :: [Int])

bitSpec :: Spec
bitSpec =
  describe "bit datatype" $ do
    it "represents the zero bit" $ do
      prettyPrint Zero `shouldBe` '0'
    it "represents the one bit" $ do
      prettyPrint One `shouldBe` '1'
        
refactorSpec :: Spec
refactorSpec =
  describe "Part2" $ do
    it "refactors credit card lib bump invalid card" $ do
      let (ResponseData _ price) = checkoutItems [Atari2600] 4012888888881882
      price `shouldBe` Nothing
    it "refactors credit card lib bump valid card" $ do
      let (ResponseData _ price) = checkoutItems [Sega8Bit, Comodore64] 4012888888881881
      price `shouldBe` (Just 1100)