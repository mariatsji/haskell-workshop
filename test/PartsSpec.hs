import           Test.Hspec
import           Test.Tasty
import           Test.Tasty.Hspec              as H
import           Test.Tasty.QuickCheck         as QC

import           Numeric.Natural
import           Part1
import           Part2
import           Part3

main = do
  unitTree <- unit
  unitTree2 <- unit2
  unitTree3 <- unit3
  defaultMain $ tests $ testGroup "Haskell Workshop Unit Tests" [unitTree, unitTree2, unitTree3]

-- Property tests
tests :: TestTree -> TestTree
tests tree = testGroup "Part1" $ tree : properties

properties :: [TestTree]
properties =
  [ QC.testProperty "helloWorld (property tests)" greetString
  , QC.testProperty "add (property tests)" addProp
  , QC.testProperty "myLength (property tests)" countList
  , QC.testProperty "mySum (property tests)" sumList
  ]

countList :: [Int] -> Bool
countList xs = myLength xs == (fromIntegral . length $ xs)

addProp :: (Float, Float) -> Bool
addProp (a, b) = add a b == a + b

sumList :: [Int] -> Bool
sumList xs = mySum xs == foldl (+) 0 xs

greetString :: String -> Bool
greetString s = length (helloWorld s) > length s

-- Unit Tests
unit :: IO TestTree
unit = H.testSpec "Part1 (unit tests)" $ do
  greaterSpec
  helloWorldSpec
  addNrSpec
  countSpec
  sumSpec
  myMapSpec

unit2 :: IO TestTree
unit2 = H.testSpec "Part2 (unit tests)" $ do
  bitSpec
  refactorSpec

unit3 :: IO TestTree
unit3 = H.testSpec "Part3 (unit tests)" $ do
  takeSpec
  dropSpec
  compressorSpec

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

isSevenSpec :: Spec
isSevenSpec = describe "isSeven" $ do
  it "checks that a number is 7 using 0" $ do
    isSeven 0 `shouldBe` False
  it "checks that a number is 7 using 7" $ do
    isSeven 7 `shouldBe` True

countSpec :: Spec
countSpec = describe "count" $ do
  it "counts the length of [] to 0" $ do
    myLength [] `shouldBe` 0
  it "counts the length of [2,5,2,3,6,3,4] to 7" $ do
    myLength [2, 5, 2, 3, 6, 3, 4] `shouldBe` 7

sumSpec :: Spec
sumSpec = describe "mySum" $ do
  it "sums [] to 0" $ do
    sum [] `shouldBe` 0
  it "sums [-5,2,13] to 10" $ do
    sum [-5, 2, 13] `shouldBe` 10

myMapSpec :: Spec
myMapSpec = describe "myMap" $ do
  it "applies some function to the empty list returning the empty list" $ do
    myMap length ([] :: [String]) `shouldBe` []
  it
      "applies the identity function with no apprent result to the numbers [5,1,-2]"
    $ do
        myMap id [5, 1, -2] `shouldBe` [5, 1, -2]
  it "applies the length function on [\"catnip\", \"catfood\"] to find [6,7]"
    $ do
        myMap length ["catnip", "catfood"] `shouldBe` ([6, 7] :: [Int])

bitSpec :: Spec
bitSpec = describe "bit datatype" $ do
  it "represents the zero bit" $ do
    prettyPrint Zero `shouldBe` '0'
  it "represents the one bit" $ do
    prettyPrint One `shouldBe` '1'

greaterSpec :: Spec
greaterSpec = describe "greater of two natural numbers" $ do
  it "sais 4 is greater than 3" $ do
    greater 4 3 `shouldBe` 4
    greater 3 4 `shouldBe` 4

refactorSpec :: Spec
refactorSpec = describe "Part2 - refactor" $ do
  it "refactors credit card lib bump invalid card" $ do
    let (ResponseData _ price) = checkoutItems [Atari2600] 4012888888881882
    price `shouldBe` Nothing
  it "refactors credit card lib bump valid card" $ do
    let (ResponseData _ price) =
          checkoutItems [Sega8Bit, Comodore64] 4012888888881881
    price `shouldBe` (Just 1100)

takeSpec :: Spec
takeSpec = describe "Part3 - takeUntil" $ do
  it "takes until a predicate becomes false for (<3) [1,2,3,4,5] " $ do
    takeUntil (<3) [1 .. 5] `shouldBe` [1,2]
  it "takes nothing if the predicate is allready false for (>3) [1,2,3,4,5]" $ do
    takeUntil (>3) [1 .. 5] `shouldBe` []

dropSpec :: Spec
dropSpec = describe "Part3 - dropUntil" $ do
  it "drops until a predicate becomes false for (<3) [1,2,3,4,5]" $ do
    dropUntil (<3) [1 .. 5] `shouldBe` [3,4,5]
  it "drops nothing if the predicate is allready false for (>3) [1,2,3,4,5]" $ do
    dropUntil (>3) [1 .. 5] `shouldBe` [1 .. 5]

compressorSpec :: Spec
compressorSpec = describe "Part3 - compress String" $ do
  it "compresses an empty string to the same empty string" $ do
    compressString "" `shouldBe` ""
  it "compresses a string untouched when no streaks \"abc\" -> \"abc\"" $ do
    compressString "abc" `shouldBe` "abc"
  it "compresses a string when there is a streak \"xyyyyzz\" -> \"x4y2z\"" $ do
    compressString "xyyyyzz" `shouldBe` "x4y2z"