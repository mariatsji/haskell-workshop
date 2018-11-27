module Part1 where

import           Numeric.Natural

-- return the greater of two natural numbers
greater :: Natural -> Natural -> Natural
greater x y = if x > y then x else y

-- given a name (String) as input should create a personalized greeting
-- e.g. `helloworld "Jens"` -> "Hello, Jens!"
helloWorld :: String -> String
helloWorld name = "Hello, " ++ name ++ "!"

-- given two Floats, adds these together, resulting in another Float
add :: Float -> Float -> Float
add a b = a + b

-- check if a number is `7`
isSeven :: Integer -> Bool
isSeven i = i == 7

add1ToEveryElement :: [Int] -> [Int]
add1ToEveryElement [] = []
add1ToEveryElement (a:as) = (a + 1) : add1ToEveryElement as

negateEveryElement :: [Int] -> [Int]
negateEveryElement [] = []
negateEveryElement (a:as) = (-a) : negateEveryElement as

doubleEveryElement :: [Int] -> [Int]
doubleEveryElement [] = []
doubleEveryElement (a:as) = (a*2) : doubleEveryElement as

myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (a:as) =  f a : myMap f as

add1WithMap :: [Int] -> [Int]
add1WithMap = myMap (+1)

negateWithMap :: [Int] -> [Int]
negateWithMap = myMap negate

doubleEveryElementWithMap :: [Int] -> [Int]
doubleEveryElementWithMap = myMap (*2)

doubleEveryOtherElement :: [Int] -> [Int]
doubleEveryOtherElement [] = []
doubleEveryOtherElement [a] = [a*2]
doubleEveryOtherElement (a1:a2:as) = (a1 * 2) : a2 : (doubleEveryOtherElement as)

-- count things in a list
myLength :: [a] -> Int
myLength []       = 0
myLength (x : xs) = 1 + myLength xs

-- sum Ints in a list
mySum :: [Int] -> Int
mySum []       = 0
mySum (x : xs) = x + mySum xs

allTrue :: [Bool] -> Bool
allTrue [] = True
allTrue (x : xs) = x && allTrue xs

anyTrue :: [Bool] -> Bool
anyTrue [] = False
anyTrue (x : xs) = x || anyTrue xs

-- foldl (fold left) is also known as "reduce" in other languages
myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl _ b [] = b
myFoldl f b (a:as) = myFoldl f (f b a) as

lengthUsingFoldl :: [a] -> Int
lengthUsingFoldl as = foldl undefined 0 as

-- fold right. bonus question: what is the difference from foldl?
myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr _ b [] = b
myFoldr f b (a:as) = f a (myFoldr f b as)

allTrueUsingFoldr :: [Bool] -> Bool
allTrueUsingFoldr as = myFoldr (&&) True as
