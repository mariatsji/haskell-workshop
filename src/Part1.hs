module Part1 where

import           Data.Char                      ( toUpper )

-- return the greater of two natural numbers
myMax :: Int -> Int -> Int
myMax x y = if x > y then x else y
-- this function already exists as `max` in haskell.

-- given two Floats, adds these together, resulting in another Float
add :: Float -> Float -> Float
add a b = a + b

-- check if a number is `7`
-- e.g.
--   isSeven 7 == True
--   isSeven 6 == False
isSeven :: Integer -> Bool
isSeven i = i == 7

-- given a name (String) as input should create a personalized greeting
-- e.g. helloWorld "Jens" == "Hello, Jens!"
helloWorld :: String -> String
helloWorld name = "Hello, " ++ name ++ "!"
-- String is just an alias for a list of Char

-- the standard list in haskell is a singly linked list.
-- a single colon (:) connects a head element to the remaining list.
-- The following expressions are equivalent:
-- [1,2,3,4,5]
-- 1 : (2 : (3 : (4 : (5 : []))))
-- 1 : 2 : 3 : 4 : 5 : [] (because : is right associative)
-- This syntax be used both to construct new lists, and to pattern
-- match on existing lists.

-- Return true if list is empty
-- e.g.
--   isEmpty [] == True
--   isEmpty [1] == False
isEmpty :: [a] -> Bool
isEmpty [] = True
isEmpty _ = False
-- this function already exists, and is called `null`.

-- Transform the first letter of a word to upper case
-- use the function `toUpper`. Do not modify remaining letters.
-- e.g.
--   capitalize "sjur" == "Sjur"
--   capitalize "FREDRIK" == "FREDRIK"
capitalize :: String -> String
capitalize []       = []
capitalize (a : as) = toUpper a : as
