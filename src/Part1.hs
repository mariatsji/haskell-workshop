module Part1 (count, sum) where

import          Prelude hiding (count, sum)
import          Numeric.Natural

-- count things in a list
count :: [a] -> Natural
count [] = 0
count (x:xs) = succ . count $ xs

-- sum Ints in a list
sum :: [Int] -> Int
sum [] = 0
sum (x:xs) = x + sum xs