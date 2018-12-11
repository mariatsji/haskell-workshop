module Part5 where

import Part2

myAppend :: [a] -> [a] -> [a]
myAppend []       bs = bs
myAppend (a : as) bs = a : myAppend as bs

myAppendUsingRightFold :: [a] -> [a] -> [a]
myAppendUsingRightFold as bs = foldr (:) bs as

myConcat :: [[a]] -> [a]
myConcat l = foldr (++) [] l

flatMap :: (a -> [b]) -> [a] -> [b]
flatMap f as = myConcat (myMap f as)

allCombinations :: [a] -> [b] -> [(a, b)]
allCombinations as bs = as >>= \a -> bs >>= \b -> [(a, b)]
