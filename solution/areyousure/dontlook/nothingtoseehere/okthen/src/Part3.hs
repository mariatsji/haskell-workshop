module Part3 where

noNegatives :: [Int] -> [Int]
noNegatives []       = []
noNegatives (a : as) = if a >= 0 then a : noNegatives as else noNegatives as

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ []       = []
myFilter f (a : as) = if f a then a : myFilter f as else myFilter f as

noNegativesUsingFilter :: [Int] -> [Int]
noNegativesUsingFilter = filter (>= 0)
