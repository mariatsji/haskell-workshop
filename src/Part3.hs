module Part3 where

-- Remove all negative numbers from a list of ints
-- e.g. (noNegatives [-2,-1,0,1,2]) == [0,1,2]
noNegatives :: [Int] -> [Int]
noNegatives = undefined

-- create a generalized function to remove elements based on a
-- predicate function. Elements that return False when applied to
-- the predicate are removed.
-- e.g. (myFilter (==1) [1,2,3,2,1]) == [1,1]
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter = undefined
-- this function already exists as `filter`

-- let's use filter to more concisely implement noNegatives
noNegativesUsingFilter :: [Int] -> [Int]
noNegativesUsingFilter = undefined
