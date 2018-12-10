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
-- e.g. myFoldr f 4 [1,2,3] == f 1 (f 2 (f 3 4))
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
-- let's do this one a little differently.
-- use a tail recursive helper function (we've named it "loop")
mySum :: [Int] -> Int
mySum =
  let loop :: Int -> [Int] -> Int
      loop = undefined
  in  loop undefined

-- count elements in a list
-- e.g. myLength [4,5,6] == 3
-- use the same technique as `mySum`.
myLength :: [a] -> Int
myLength = undefined

-- write a generalized function for folding in a left associative way
-- e.g. myFoldl f 1 [2,3,4] == f (f (f 1 2) 3) 4
myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl = undefined

-- ok, now let's rewrite sum and length using a left fold.
sumUsingFoldl :: [Int] -> Int
sumUsingFoldl = undefined

lengthUsingFoldl :: [a] -> Int
lengthUsingFoldl = undefined

-- bonus questions:
-- * what is the difference between left and right fold?
-- * when should you use one over the other?
