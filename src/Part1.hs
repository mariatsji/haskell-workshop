module Part1 (helloWorld, add, count, sum) where

import          Prelude hiding (count, sum)
import          Numeric.Natural

-- given a name (String) as input should create a personalized greeting
-- e.g. `helloworld "Jens"` -> "Hello, Jens!"
helloWorld :: String -> String
helloWorld name = "Hello, " ++ name ++ "!"

-- given two Floats, adds these together, resulting in another Float
add :: Float -> Float -> Float
add a b = a + b

-- count things in a list
count :: [a] -> Natural
count [] = 0
count (x:xs) = succ . count $ xs

-- sum Ints in a list
sum :: [Int] -> Int
sum [] = 0
sum (x:xs) = x + sum xs