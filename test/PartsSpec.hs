import           Test.Hspec
import           Test.Tasty
import           Test.Tasty.Hspec              as H
import           Test.Tasty.QuickCheck         as QC

import           Numeric.Natural
import           Part1
import           Part2
import           Part3

main = do
  t1 <- part1Tests
  t2 <- part2Tests
  t3 <- part3Tests
  defaultMain $ testGroup "Haskell Workshop Unit Tests" [t1, t2, t3]

part1Tests :: IO TestTree
part1Tests = do
  units <- part1Units
  let tg1 = testGroup "Part1 (unit tests)" units
      tg2 = testGroup "Part1 (property tests" part1Properties
  return (testGroup "Part1" [tg1, tg2])

-- Unit Tests
part1Units :: IO [TestTree]
part1Units = H.testSpecs $ do
  greaterSpec
  helloWorldSpec
  addNrSpec
  isSevenSpec
  add1Spec
  negateSpec
  doubleSpec
  myMapSpec
  add1WithMapSpec
  negateWithMapSpec
  doubleEveryElementWithMapSpec
  doubleEveryOtherElementSpec
  countSpec
  sumSpec

part2Tests :: IO TestTree
part2Tests = H.testSpec "Part2 (unit tests)" $ do
  bitSpec
  refactorSpec

part3Tests :: IO TestTree
part3Tests = H.testSpec "Part3 (unit tests)" $ do
  takeSpec
  dropSpec
  compressorSpec

-- Property tests
part1Properties :: [TestTree]
part1Properties =
  [ QC.testProperty "helloWorld (property tests)" greetString
  , QC.testProperty "add (property tests)" addProp
  , QC.testProperty "myLength (property tests)" countList
  , QC.testProperty "mySum (property tests)" sumList
  , QC.testProperty "myMap (property tests)" myMapProperty
  ]

countList :: [Int] -> Bool
countList xs = myLength xs == (fromIntegral . length $ xs)

addProp :: (Float, Float) -> Bool
addProp (a, b) = add a b == a + b

sumList :: [Int] -> Bool
sumList xs = mySum xs == foldl (+) 0 xs

greetString :: String -> Bool
greetString s = length (helloWorld s) > length s

myMapProperty :: (Int -> Int, [Int]) -> Bool
myMapProperty (f, l) = myMap f l == map f l

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

add1Spec :: Spec
add1Spec = describe "add1ToEveryElement" $ do
  it "adds 1 to every element of an empty list []" $ do
    add1ToEveryElement [] `shouldBe` []
  it "adds 1 to every element of the list [2,6,-1]" $ do
    add1ToEveryElement [2, 6, -1] `shouldBe` [3, 7, 0] 

negateSpec :: Spec
negateSpec = describe "negateEveryElement" $ do
  it "negates every element of an empty list []" $ do
    negateEveryElement [] `shouldBe` []
  it "neages every element of the list [-1,2,0]" $ do
    negateEveryElement [-1, 2, 0] `shouldBe` [1, -2, 0]

doubleSpec :: Spec
doubleSpec = describe "doubleEveryElement" $ do
  it "doubles every element of an empty list []" $ do
    doubleEveryElement [] `shouldBe` []
  it "doubles every element of the list [-2, 2, 5]" $ do
    doubleEveryElement [-2, 2, 5] `shouldBe` [-4, 4, 10]

add1WithMapSpec :: Spec
add1WithMapSpec = describe "add1WithMap" $ do
  it "adds 1 to every element using myMap to the empty list []" $ do
    add1WithMap [] `shouldBe` []
  it "adds 1 to every element using myMap of the list [2,2,-1]" $ do
    add1WithMap [2,2,-1] `shouldBe` [3,3,0]

negateWithMapSpec :: Spec
negateWithMapSpec = describe "negateWithMap" $ do
  it "negates every element using myMap of the empty list []" $ do
    negateWithMap [] `shouldBe` []
  it "negates every element using myMap of the list [50, -50]" $ do
    negateWithMap [50, -50] `shouldBe` [-50, 50]

doubleEveryElementWithMapSpec :: Spec
doubleEveryElementWithMapSpec = describe "doubleEveryElementWithMap" $ do
  it "doubles every element using myMap of the empty list []" $ do
    doubleEveryElementWithMap [] `shouldBe` []
  it "doubles every element using myMap on the list [6, -1, 0]" $ do
    doubleEveryElementWithMap [6, -1, 0] `shouldBe` [12, -2, 0]

doubleEveryOtherElementSpec :: Spec
doubleEveryOtherElementSpec = describe "doubleEveryOtherElement" $ do
  it "doubles every element starting with the first in the empty list []" $ do
    doubleEveryOtherElement [] `shouldBe` []
  it "doubles every element starting with the first in the list [2, 1, 3, 1]" $ do
    doubleEveryOtherElement [2, 1, 3, 1] `shouldBe` [4, 1, 6, 1] 

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
takeSpec = describe "takeUntil" $ do
  it "takes until a predicate becomes false for (<3) [1,2,3,4,5] " $ do
    takeUntil (<3) [1 .. 5] `shouldBe` [1,2]
  it "takes nothing if the predicate is allready false for (>3) [1,2,3,4,5]" $ do
    takeUntil (>3) [1 .. 5] `shouldBe` []

dropSpec :: Spec
dropSpec = describe "dropUntil" $ do
  it "drops until a predicate becomes false for (<3) [1,2,3,4,5]" $ do
    dropUntil (<3) [1 .. 5] `shouldBe` [3,4,5]
  it "drops nothing if the predicate is allready false for (>3) [1,2,3,4,5]" $ do
    dropUntil (>3) [1 .. 5] `shouldBe` [1 .. 5]

compressorSpec :: Spec
compressorSpec = describe "compress String" $ do
  it "compresses an empty string to the same empty string" $ do
    compressString "" `shouldBe` ""
  it "compresses a string untouched when no streaks \"abc\" -> \"abc\"" $ do
    compressString "abc" `shouldBe` "abc"
  it "compresses a string when there is a streak \"xyyyyzz\" -> \"x4y2z\"" $ do
    compressString "xyyyyzz" `shouldBe` "x4y2z"