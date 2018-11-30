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

-- add 1 to every element in a list of ints
-- e.g. (add1ToEveryElement [1,2,3]) == [2,3,4]
-- use a recursive function
add1ToEveryElement :: [Int] -> [Int]
add1ToEveryElement []       = []
add1ToEveryElement (a : as) = (a + 1) : add1ToEveryElement as

-- negate every element in a list of ints
-- e.g. (negateEveryElement [1,-2,3]) == [-1,2,-3]
-- this should be very similar to the previous task
negateEveryElement :: [Int] -> [Int]
negateEveryElement []       = []
negateEveryElement (a : as) = -a : negateEveryElement as

-- double every element in a list of ints
-- e.g. (doubleEveryElement [1,2,3]) == [2,4,6]
doubleEveryElement :: [Int] -> [Int]
doubleEveryElement []       = []
doubleEveryElement (a : as) = (a * 2) : doubleEveryElement as

-- ok, writing a new recursive function every time is annoying
-- let's write a generalized function for applying a transformation
-- to every element of a list
myMap :: (a -> b) -> [a] -> [b]
myMap _ []       = []
myMap f (a : as) = f a : myMap f as
-- this function already exists in haskell, and is named `map`
-- (there is also a more general `fmap` which can be used for
-- more than just lists. For lists it is the same as `map`.)

-- let's use our map function to reimplement the previous three functions
-- how concisely can you write it?
-- hint: for infix functions like + and *, you can wrap the operator and
-- one operand in parantheses to create a partially applied function.
-- e.g.
--   (+ 5) is the same as (\x -> x + 5)
--   (5 +) is the same as (\x -> 5 + x)
add1WithMap :: [Int] -> [Int]
add1WithMap as = map (+ 1) as

negateWithMap :: [Int] -> [Int]
negateWithMap as = map negate as

doubleEveryElementWithMap :: [Int] -> [Int]
doubleEveryElementWithMap as = map (* 2) as

-- double every other element in a list, starting with the first
-- e.g. doubleEveryOtherElement [1,2,3,4,5] == [2,2,6,4,10]
doubleEveryOtherElement :: [Int] -> [Int]
doubleEveryOtherElement []  = []
doubleEveryOtherElement [a] = [a * 2]
doubleEveryOtherElement (a1 : a2 : as) =
  (a1 * 2) : a2 : (doubleEveryOtherElement as)

doubleEveryOtherElementV2 :: [Int] -> [Int]
doubleEveryOtherElementV2 as = zipWith doubleIfEvenIndex as [0..]
  where
    doubleIfEvenIndex a idx = if even idx then a * 2 else a

-- Remove all negative numbers from a list of ints
noNegatives :: [Int] -> [Int]
noNegatives []       = []
noNegatives (a : as) = if a >= 0 then a : noNegatives as else noNegatives as

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ []       = []
myFilter f (a : as) = if f a then a : myFilter f as else myFilter f as

noNegativesUsingFilter :: [Int] -> [Int]
noNegativesUsingFilter = myFilter (>= 0)

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

-- Append one linked list after another
-- this function already exists as ++ in haskell
-- e.g. [1,2,3] ++ [4,5,6] == [1,2,3,4,5,6]
-- hint: recursively prepend
myAppend :: [a] -> [a] -> [a]
myAppend []       bs = bs
myAppend (a : as) bs = a : myAppend as bs

-- Your implementation of append might look familiar
-- Try reimplementing it using a right fold
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
-- notice the similarity to the signature of the `map` function
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
