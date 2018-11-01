module Part1
  ( helloWorld
  , add
  , isSeven
  , count
  , sum
  , apply
  , applys
  ) where

import           Numeric.Natural
import           Prelude         hiding (count, sum)

-- given a name (String) as input should create a personalized greeting
-- e.g. `helloworld "Jens"` -> "Hello, Jens!"
helloWorld :: String -> String
helloWorld name = "Hello, " ++ name ++ "!"

-- given two Floats, adds these together, resulting in another Float
add :: Float -> Float -> Float
add a b = a + b

-- check if a number is `7`
isSeven :: Integer -> Bool
isSeven i =
  if (i == 7)
    then True
    else False

-- count things in a list
count :: [a] -> Natural
count []     = 0
count (x:xs) = succ . count $ xs

-- sum Ints in a list
sum :: [Int] -> Int
sum []     = 0
sum (x:xs) = x + sum xs

-- apply a function given as an argument
apply :: (a -> b) -> a -> b
apply f a = f a

-- apply a function to a list of arguments
applys :: (a -> b) -> [a] -> [b]
applys f []     = []
applys f (x:xs) = f x : applys f xs
