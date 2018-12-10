module Part4 where

-- return True if there are no false elements in the list
-- e.g.
--   allTrue [] == True
--   allTrue [True, True, True] == True
--   allTrue [True, False, True] == False
allTrue :: [Bool] -> Bool
allTrue = undefined

-- return True if there is at least one true element in the list
-- e.g.
--   anyTrue [] == False
--   anyTrue [False, False] == False
--   anyTrue [False, True] == True
anyTrue :: [Bool] -> Bool
anyTrue = undefined

-- going through a list and reducing it to a single value like this is called "folding" (also known as "reducing" in some languages)
-- create a generalized function for folding in a right associative way.
-- e.g. myFoldr (*) 4 [1,2,3] == 1 * (2 * (3 * 4))
myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr = undefined
-- as you may have guessed, this function already exists in haskell
-- and is called `foldr` ("fold right")

allTrueUsingFoldr :: [Bool] -> Bool
allTrueUsingFoldr = undefined

anyTrueUsingFoldr :: [Bool] -> Bool
anyTrueUsingFoldr = undefined

-- sum Ints in a list
-- e.g.
--   mySum [] == 0
--   mySum [1,2,3] == 6
-- use a tail recursive helper function (we've named it "loop")
mySum :: [Int] -> Int
mySum = undefined

-- count elements in a list
-- e.g. myLength [4,5,6] == 3
myLength :: [a] -> Int
myLength = undefined

-- write a generalized function for folding in a left associative way
-- e.g. myFoldl (*) 1 [2,3,4] == ((1 * 2) * 3) * 4
myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl = undefined

sumUsingFoldl :: [Int] -> Int
sumUsingFoldl = undefined

lengthUsingFoldl :: [a] -> Int
lengthUsingFoldl = undefined
-- bonus questions:
-- * what is the difference between left and right fold?
-- * when should you use one over the other?
