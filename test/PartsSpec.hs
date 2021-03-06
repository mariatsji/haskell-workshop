import           Test.Hspec
import           Test.Tasty
import           Test.Tasty.Hspec              as H
import           Test.Tasty.QuickCheck         as QC

import           Part1
import           Part2
import           Part3
import           Part4
import           Part5
import           Part6
import           Part7

main = do
  t1 <- part1Tests
  t2 <- part2Tests
  t3 <- part3Tests
  t4 <- part4Tests
  t5 <- part5Tests
  t6 <- part6Tests
  t7 <- part7Tests
  defaultMain $ testGroup "Haskell Workshop Unit Tests" [t1, t2, t3, t4, t5, t6, t7]

part1Tests :: IO TestTree
part1Tests = do
  units <- part1Units
  let tg1 = testGroup "Part1 (unit tests)" units
      tg2 = testGroup "Part1 (property tests" part1Properties
  return (testGroup "Part1" [tg1, tg2])

part2Tests :: IO TestTree
part2Tests = do
  units <- part2Units
  let tg1 = testGroup "Part2 (unit tests)" units
      tg2 = testGroup "Part2 (property tests" part2Properties
  return (testGroup "Part2" [tg1, tg2])

part3Tests :: IO TestTree
part3Tests = do
  units <- part3Units
  let tg1 = testGroup "Part3 (unit tests)" units
      tg2 = testGroup "Part3 (property tests" part3Properties
  return (testGroup "Part3" [tg1, tg2])
  
part4Tests :: IO TestTree
part4Tests = do
  units <- part4Units
  let tg1 = testGroup "Part4 (unit tests)" units
      tg2 = testGroup "Part4 (property tests" part4Properties
  return (testGroup "Part4" [tg1, tg2])
  

-- Unit Tests
part1Units :: IO [TestTree]
part1Units = H.testSpecs $ do
  myMaxSpec
  helloWorldSpec
  addNrSpec
  isSevenSpec
  isEmptySpec
  capitalizeSpec

part2Units :: IO [TestTree]
part2Units = H.testSpecs $ do
  add1Spec
  negateSpec
  doubleSpec
  myMapSpec
  add1WithMapSpec
  negateWithMapSpec
  doubleEveryElementWithMapSpec
  doubleEveryOtherElementSpec

part3Units :: IO [TestTree]
part3Units = H.testSpecs $ do
  noNegativesSpec
  myFilterSpec
  noNegativesUsingFilterSpec

part4Units :: IO [TestTree]
part4Units = H.testSpecs $ do
  allTrueSpec
  anyTrueSpec
  myFoldrSpec
  allTrueUsingFoldrSpec
  anyTrueUsingFoldrSpec
  myFoldlSpec
  sumUsingFoldlSpec
  lengthUsingFoldlSpec

part5Tests :: IO TestTree
part5Tests = H.testSpec "Part5 (unit tests)" $ do
  myAppendSpec
  myAppendUsingRightFoldSpec
  myConcatSpec
  flatMapSpec
  allCombinationsSpec

part6Tests :: IO TestTree
part6Tests = H.testSpec "Part6 (unit tests)" $ do
  bitSpec
  refactorSpec

part7Tests :: IO TestTree
part7Tests = H.testSpec "Part7 (unit tests)" $ do
  takeSpec
  dropSpec
  compressorSpec

-- Property tests
part1Properties :: [TestTree]
part1Properties =
  [ QC.testProperty "helloWorld (property tests)" greetStringProp
  , QC.testProperty "add (property tests)" addProp
  ]

part2Properties :: [TestTree]
part2Properties =
  [ QC.testProperty "myMap (property tests)" myMapProp ]

part3Properties :: [TestTree]
part3Properties = 
  [ QC.testProperty "noNegativesProp (property tests)" noNegativesProp ]

part4Properties :: [TestTree]
part4Properties = [ ]

addProp :: (Float, Float) -> Bool
addProp (a, b) = add a b == a + b

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

isEmptySpec :: Spec
isEmptySpec = describe "isEmpty" $ do
  it "checks that an empty list is empty" $ do
    isEmpty [] `shouldBe` True
  it "checks that a non-empty list is not empty" $ do
    isEmpty [1,2,3] `shouldBe` False

capitalizeSpec :: Spec
capitalizeSpec = describe "capitalize" $ do
  it "capitalizes the empty list to the empty list" $ do
    capitalize "" `shouldBe` ""
  it "capitalizes the string \"hello\" to \"Hello\"" $ do
    capitalize "hello" `shouldBe` "Hello"
  it "capitalizes the string \"TECH\" to \"TECH\"" $ do
    capitalize "TECH" `shouldBe` "TECH"


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
  it "says all is true in the empty list []" $ do
    allTrue [] `shouldBe` True
  it "says True given the list [True, True]" $ do
    allTrue [True, True] `shouldBe` True
  it "says False given the list [True, False] " $ do
    allTrue [True, False] `shouldBe` False

anyTrueSpec :: Spec
anyTrueSpec = describe "anyTrue" $ do
  it "says False to the empty list []" $ do
    anyTrue [] `shouldBe` False
  it "says False given the list [False, False]" $ do
    anyTrue [False, False] `shouldBe` False
  it "says True given the list [True, False]" $ do
    anyTrue [True, False] `shouldBe` True

myFoldrSpec :: Spec
myFoldrSpec = describe "myFoldr" $ do
  it "folds the list [\"apple\", \"banana\"] into the word \"applebanana\" when using string concatenation" $ do
    myFoldr (++) "" ["apple", "banana"]`shouldBe` "applebanana"
  it "folds the list [1,2,3] into the list [1,2,3] using cons" $ do
    myFoldr (\x a -> x : a) [] [1,2,3] `shouldBe` [1,2,3]

allTrueUsingFoldrSpec :: Spec
allTrueUsingFoldrSpec = describe "allTrueUsingFoldr" $ do
  it "says True for the empty list []" $ do
    allTrueUsingFoldr [] `shouldBe` True
  it "says False for the list [True, False]" $ do
    allTrueUsingFoldr [True, False] `shouldBe` False
  it "says True for the list [True, True]" $ do
    allTrueUsingFoldr [True, True] `shouldBe` True

anyTrueUsingFoldrSpec :: Spec
anyTrueUsingFoldrSpec = describe "anyTrueUsingFoldr" $ do
  it "says False for the empty list []" $ do
    anyTrueUsingFoldr [] `shouldBe` False
  it "says False for the list [False, False]" $ do
    anyTrueUsingFoldr [] `shouldBe` False
  it "says True for the list [False, True, False]" $ do
    anyTrueUsingFoldr [False, True, False] `shouldBe` True

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

myMaxSpec :: Spec
myMaxSpec = describe "myMax of two integer numbers" $ do
  it "says 4 is myMax than 3" $ do
    myMax 4 3 `shouldBe` 4
    myMax 3 4 `shouldBe` 4

refactorSpec :: Spec
refactorSpec = describe "Part6 - refactor" $ do
  it "refactors credit card lib bump invalid card" $ do
    let (ResponseData _ price) = checkoutItems [Atari2600] 4012888888881882
    price `shouldBe` Nothing
  it "refactors credit card lib bump valid card" $ do
    let (ResponseData _ price) =
          checkoutItems [Sega8Bit, Comodore64] 4012888888881881
    price `shouldBe` (Just 1100)

takeSpec :: Spec
takeSpec = describe "myTakeWhile" $ do
  it "takes While a predicate becomes false for (<3) [1,2,3,4,5] " $ do
    myTakeWhile (<3) [1 .. 5] `shouldBe` [1,2]
  it "takes nothing if the predicate is allready false for (>3) [1,2,3,4,5]" $ do
    myTakeWhile (>3) [1 .. 5] `shouldBe` []

dropSpec :: Spec
dropSpec = describe "myDropWhile" $ do
  it "drops While a predicate becomes false for (<3) [1,2,3,4,5]" $ do
    myDropWhile (<3) [1 .. 5] `shouldBe` [3,4,5]
  it "drops nothing if the predicate is allready false for (>3) [1,2,3,4,5]" $ do
    myDropWhile (>3) [1 .. 5] `shouldBe` [1 .. 5]

compressorSpec :: Spec
compressorSpec = describe "compress String" $ do
  it "compresses an empty string to the same empty string" $ do
    compressString "" `shouldBe` ""
  it "compresses a string untouched when no streaks \"abc\" -> \"abc\"" $ do
    compressString "abc" `shouldBe` "abc"
  it "compresses a string when there is a streak \"xyyyyzz\" -> \"x4y2z\"" $ do
    compressString "xyyyyzz" `shouldBe` "x4y2z"