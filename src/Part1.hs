module Part1 where

import           Numeric.Natural

-- return the greater of two natural numbers
greater :: Natural -> Natural -> Natural
greater x y = if x > y then x else y

-- given a name (String) as input should create a personalized greeting
-- e.g. helloWorld "Jens" == "Hello, Jens!"
helloWorld :: String -> String
helloWorld name = "Hello, " ++ name ++ "!"

-- given two Floats, adds these together, resulting in another Float
add :: Float -> Float -> Float
add a b = a + b

-- check if a number is `7`
-- e.g.
--   isSeven 7 == True
--   isSeven 6 == False
isSeven :: Integer -> Bool
isSeven i = i == 7

add1ToEveryElement :: [Int] -> [Int]
add1ToEveryElement []       = []
add1ToEveryElement (a : as) = (a + 1) : add1ToEveryElement as

negateEveryElement :: [Int] -> [Int]
negateEveryElement []       = []
negateEveryElement (a : as) = (-a) : negateEveryElement as

doubleEveryElement :: [Int] -> [Int]
doubleEveryElement []       = []
doubleEveryElement (a : as) = (a * 2) : doubleEveryElement as

myMap :: (a -> b) -> [a] -> [b]
myMap _ []       = []
myMap f (a : as) = f a : myMap f as

add1WithMap :: [Int] -> [Int]
add1WithMap = myMap (+ 1)

negateWithMap :: [Int] -> [Int]
negateWithMap = myMap negate

doubleEveryElementWithMap :: [Int] -> [Int]
doubleEveryElementWithMap = myMap (* 2)

-- double every other element in a list, starting with the first
-- e.g. doubleEveryOtherElement [1,2,3,4,5] == [2,2,6,4,10]
doubleEveryOtherElement :: [Int] -> [Int]
doubleEveryOtherElement []  = []
doubleEveryOtherElement [a] = [a * 2]
doubleEveryOtherElement (a1 : a2 : as) =
  (a1 * 2) : a2 : (doubleEveryOtherElement as)

-- return True if there are no false elements in the list
-- e.g.
--   allTrue [] == True
--   allTrue [True, True, True] == True
--   allTrue [True, False, True] == False
allTrue :: [Bool] -> Bool
allTrue []       = True
allTrue (x : xs) = x && allTrue xs

-- return True if there is at least one true element in the list
-- e.g.
--   anyTrue [] == False
--   anyTrue [False, False] == False
--   anyTrue [False, True] == True
anyTrue :: [Bool] -> Bool
anyTrue []       = False
anyTrue (x : xs) = x || anyTrue xs

-- going through a list and reducing it to a single value like this is called "folding" (also known as "reducing" in some languages)
-- create a generalized function for folding in a right associative way.
-- e.g. myFoldr (*) 4 [1,2,3] == 1 * (2 * (3 * 4))
myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr _ b []       = b
myFoldr f b (a : as) = f a (myFoldr f b as)
-- as you may have guessed, this function already exists in haskell
-- and is called `foldr` ("fold right")

allTrueUsingFoldr :: [Bool] -> Bool
allTrueUsingFoldr as = foldr (&&) True as

anyTrueUsingFoldr :: [Bool] -> Bool
anyTrueUsingFoldr as = foldr (||) False as

-- sum Ints in a list
-- e.g. mySum [1,2,3] == 6
-- use a tail recursive helper function (we've named it "loop")
mySum :: [Int] -> Int
mySum as = loop 0 as
 where
  loop acc []       = acc
  loop acc (x : xs) = loop (acc + x) xs

-- count elements in a list
-- e.g. myLength [4,5,6] == 3
myLength :: [a] -> Int
myLength as = loop 0 as
 where
  loop acc []       = acc
  loop acc (x : xs) = loop (acc + 1) xs

-- write a generalized function for folding in a left associative way
-- e.g. myFoldl (*) 1 [2,3,4] == ((1 * 2) * 3) * 4
myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl _ b []       = b
myFoldl f b (a : as) = myFoldl f (f b a) as

sumUsingFoldl :: [Int] -> Int
sumUsingFoldl = foldl (+) 0

lengthUsingFoldl :: [a] -> Int
lengthUsingFoldl as = foldl (\b _ -> b + 1) 0 as
-- bonus questions:
-- * what is the difference between left and right fold?
-- * when should you use one over the other?


-- Removing certain elements from a list
-- aka Filtering
noNegatives :: [Int] -> [Int]
noNegatives []       = []
noNegatives (a : as) = if a >= 0 then a : noNegatives as else noNegatives as

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ []       = []
myFilter f (a : as) = if f a then a : myFilter f as else myFilter f as

noNegativesUsingFilter :: [Int] -> [Int]
noNegativesUsingFilter = myFilter (>= 0)

-- Append one linked list after another
-- e.g. (myAppend [1,2,3] [4,5,6]) == [1,2,3,4,5,6]
myAppend :: [a] -> [a] -> [a]
myAppend []       bs = bs
myAppend (a : as) bs = a : myAppend as bs

myAppendUsingRightFold :: [a] -> [a] -> [a]
myAppendUsingRightFold as bs = foldr (:) bs as

-- concatenate a list of lists into a single list
-- e.g. (concat [[1,2],[3,4],[5,6]]) == [1,2,3,4,5,6]
-- tip: use the append function (`myAppend` or `(++)`) introduced earlier
myConcat :: [[a]] -> [a]
myConcat = foldr (++) []
-- this operation is also known as `join` in haskell
-- also known as "flatten" in some languages

-- implement flatMap
-- map and then flatten
-- e.g. (flatMap (\x -> [x,x]) [1,2,3]) == [1,1,2,2,3,3]
-- notice the similarity to the "map" function
flatMap :: (a -> [b]) -> [a] -> [b]
flatMap f as = myConcat (myMap f as)
-- this function is known as "bind" in haskell and is written >>=, which is an infix function
-- however, the order of the first two arguments are reversed
-- so the example above becomes: ([1,2,3] >>= (\x -> [x,x])) == [1,1,2,2,3,3]
-- bonus question: why are the arguments reversed?

-- create all possible pairs where the first element is from the first list
-- and the second element is from the second list
-- e.g. (allCombinations [1,2] ['a', 'b']) == [(1,'a'), (1,'b'), (2,'a'), (2,'b')]
-- use nested >>= calls
allCombinations :: [a] -> [b] -> [(a, b)]
allCombinations as bs = as >>= \a -> bs >>= \b -> [(a, b)]
