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
  noNegativesSpec
  myFilterSpec
  noNegativesUsingFilterSpec
  allTrueSpec
  anyTrueSpec
  myFoldrSpec
  allTrueUsingFoldrSpec
  anyTrueUsingFoldrSpec
  mySumSpec
  myLengthSpec
  myFoldlSpec
  sumUsingFoldlSpec
  myAppendSpec
  myAppendUsingRightFoldSpec
  myConcatSpec
  flatMapSpec
  allCombinationsSpec

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
  [ QC.testProperty "helloWorld (property tests)" greetStringProp
  , QC.testProperty "add (property tests)" addProp
  , QC.testProperty "myLength (property tests)" countListProp
  , QC.testProperty "mySum (property tests)" sumListProp
  , QC.testProperty "myMap (property tests)" myMapProp
  , QC.testProperty "noNegativesProp (property tests)" noNegativesProp
  ]

countListProp :: [Int] -> Bool
countListProp xs = myLength xs == (fromIntegral . length $ xs)

addProp :: (Float, Float) -> Bool
addProp (a, b) = add a b == a + b

sumListProp :: [Int] -> Bool
sumListProp xs = mySum xs == foldl (+) 0 xs

greetStringProp :: String -> Bool
greetStringProp s = length (helloWorld s) > length s

myMapProp :: (Int -> Int, [Int]) -> Bool
myMapProp (f, l) = myMap f l == map f l

noNegativesProp :: [Int] -> Bool
noNegativesProp k =
  let l= noNegatives k
  in case l of [] -> True
               (x:xs)  -> x >= 0 && noNegativesProp xs  

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

noNegativesSpec :: Spec
noNegativesSpec = describe "noNegatives" $ do
  it "removes no negative nrs from the empty list []" $ do
    noNegatives [] `shouldBe` []
  it "removes all negative numbers from the list [2,-6,0,-2]" $ do
    noNegatives [2,-6,0,-2] `shouldBe` [2,0]

myFilterSpec :: Spec
myFilterSpec = describe "myFilter" $ do
  it "keeps odd nrs in the empty list []" $ do
    myFilter odd [] `shouldBe` []
  it "keeps even in the list [-3,5,6,7]" $ do
    myFilter even [-3,5,6,7] `shouldBe` [6]

noNegativesUsingFilterSpec :: Spec
noNegativesUsingFilterSpec = describe "noNegativesUsingFilter" $ do
  it "keeps no negative nrs in the empty list []" $ do
    noNegativesUsingFilter [] `shouldBe` []
  it "keeps no negatives in the list [-3,3,4,5,-1]" $ do
    noNegativesUsingFilter [-3,3,4,5,-1] `shouldBe` [3,4,5]

allTrueSpec :: Spec
allTrueSpec = describe "allTrue" $ do
  it "sais all is true in the empty list []" $ do
    allTrue [] `shouldBe` True
  it "sais True given the list [True, True]" $ do
    allTrue [True, True] `shouldBe` True
  it "sais False given the list [True, False] " $ do
    allTrue [True, False] `shouldBe` False

anyTrueSpec :: Spec
anyTrueSpec = describe "anyTrue" $ do
  it "sais False to the empty list []" $ do
    anyTrue [] `shouldBe` False
  it "sais False given the list [False, False]" $ do
    anyTrue [False, False] `shouldBe` False
  it "sais True given the list [True, False]" $ do
    anyTrue [True, False] `shouldBe` True

myFoldrSpec :: Spec
myFoldrSpec = describe "myFoldr" $ do
  it "folds the list [\"apple\", \"banana\"] into the word \"applebanana\" when using string concatenation" $ do
    myFoldr (++) "" ["apple", "banana"]`shouldBe` "applebanana"
  it "folds the list [1,2,3] into the list [1,2,3] using cons" $ do
    myFoldr (\x a -> x : a) [] [1,2,3] `shouldBe` [1,2,3]

allTrueUsingFoldrSpec :: Spec
allTrueUsingFoldrSpec = describe "allTrueUsingFoldr" $ do
  it "sais True for the empty list []" $ do
    allTrueUsingFoldr [] `shouldBe` True
  it "sais False for the list [True, False]" $ do
    allTrueUsingFoldr [True, False] `shouldBe` False
  it "sais True for the list [True, True]" $ do
    allTrueUsingFoldr [True, True] `shouldBe` True

anyTrueUsingFoldrSpec :: Spec
anyTrueUsingFoldrSpec = describe "anyTrueUsingFoldr" $ do
  it "sais False for the empty list []" $ do
    anyTrueUsingFoldr [] `shouldBe` False
  it "sais False for the list [False, False]" $ do
    anyTrueUsingFoldr [] `shouldBe` False
  it "sais True for the list [False, True, False]" $ do
    anyTrueUsingFoldr [False, True, False] `shouldBe` True

mySumSpec :: Spec
mySumSpec = describe "mySum" $ do
  it "sais 0 for the empty list []" $ do
    mySum [] `shouldBe` 0
  it "sais -3 for the list [-2,-1]" $ do
    mySum [-2,-1] `shouldBe` (-3)

myLengthSpec :: Spec
myLengthSpec = describe "myLength" $ do
  it "counts the length of [] to 0" $ do
    myLength [] `shouldBe` 0
  it "counts the length of [2,5,2,3,6,3,4] to 7" $ do
    myLength [2, 5, 2, 3, 6, 3, 4] `shouldBe` 7

myFoldlSpec :: Spec
myFoldlSpec = describe "myFoldl" $ do
  it "folds the empty list over (+) to 0" $ do
    myFoldl (+) 0 [] `shouldBe` 0
  it "folds the list [1,2,3] over Cons (:) to the list [3,2,1]" $ do
    myFoldl (\a c -> c : a) [] [1,2,3] `shouldBe` [3,2,1]

sumUsingFoldlSpec :: Spec
sumUsingFoldlSpec = describe "sumUsingFoldl" $ do
  it "sums the list [1 .. 100] to 5050" $ do
    sumUsingFoldl [1 .. 100] `shouldBe` 5050

lengthUsingFoldlSpec :: Spec
lengthUsingFoldlSpec = describe "lengthUsingFoldl" $ do
  it "finds the length of the empty list []" $ do
    lengthUsingFoldl [] `shouldBe` 0
  it "finds the length of the list [\"hi\", \"hi\", \"hi\"]" $ do
    lengthUsingFoldl ["hi", "hi", "hi"] `shouldBe` 3

myAppendSpec :: Spec
myAppendSpec = describe "myAppend" $ do
  it "appends [1] to the empty list [] forming [1]" $ do
    myAppend [1] [] `shouldBe` [1]
  it "appends [] 1 and [2,3] forming [1,2,3]" $ do
    myAppend [1] [2,3] `shouldBe` [1,2,3]


myAppendUsingRightFoldSpec :: Spec
myAppendUsingRightFoldSpec = describe "myAppendUsingRightFold" $ do
  it "appends [] and [] forming []" $ do
    myAppendUsingRightFold ([] :: [Int]) [] `shouldBe` []
  it "appends [2] and [3,4] forming [2,3,4]" $ do
    myAppendUsingRightFold [2] [3,4] `shouldBe` [2,3,4]

myConcatSpec :: Spec
myConcatSpec = describe "myConcat" $ do
  it "concats [['h','i']] to ['h','i']" $ do
    myConcat [['h','i']] `shouldBe` "hi"

flatMapSpec :: Spec
flatMapSpec = describe "flatMap" $ do
  it "flatMaps the empty list [] with the function \\i -> [] to the empty list []" $ do
    flatMap (const ([] :: [Char])) [] `shouldBe` []
  it "flatMaps a list [1,2,3] with the function \\i -> i : [1] to the list [1,1,2,1,3,1]" $ do
    flatMap (\i -> i : [1]) [1,2,3] `shouldBe` [1,1,2,1,3,1]
    
allCombinationsSpec :: Spec
allCombinationsSpec = describe "allCombinationsSpec" $ do
  it "finds all combinations between the list [1,2,3] and [] to be []" $ do
    allCombinations [1,2,3] ([] :: [Char]) `shouldBe` []
  it "finds all combinations between the lists [1,2] ['a','b'] as [(1,'a'), (1,'b'), (2,'a'), (2,'b')]" $ do
    allCombinations [1,2] ['a','b'] `shouldBe` [(1,'a'), (1,'b'), (2,'a'), (2,'b')]

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