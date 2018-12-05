module Part4 where

-- return True if there are no false elements in the list
-- e.g.
--   allTrue [] == True
--   allTrue [True, True, True] == True
--   allTrue [True, False, True] == False
allTrue :: [Bool] -> Bool
allTrue []       = True
allTrue (x : xs) = x && allTrue xs

-- return True if there is at least one true element in the list
-- e.g.
--   anyTrue [] == False
--   anyTrue [False, False] == False
--   anyTrue [False, True] == True
anyTrue :: [Bool] -> Bool
anyTrue []       = False
anyTrue (x : xs) = x || anyTrue xs

-- going through a list and reducing it to a single value like this is called "folding" (also known as "reducing" in some languages)
-- create a generalized function for folding in a right associative way.
-- e.g. myFoldr (*) 4 [1,2,3] == 1 * (2 * (3 * 4))
myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr _ b []       = b
myFoldr f b (a : as) = f a (myFoldr f b as)
-- as you may have guessed, this function already exists in haskell
-- and is called `foldr` ("fold right")

allTrueUsingFoldr :: [Bool] -> Bool
allTrueUsingFoldr as = foldr (&&) True as

anyTrueUsingFoldr :: [Bool] -> Bool
anyTrueUsingFoldr as = foldr (||) False as

-- sum Ints in a list
-- e.g. mySum [1,2,3] == 6
-- use a tail recursive helper function (we've named it "loop")
mySum :: [Int] -> Int
mySum as = loop 0 as
 where
  loop acc []       = acc
  loop acc (x : xs) = loop (acc + x) xs

-- count elements in a list
-- e.g. myLength [4,5,6] == 3
myLength :: [a] -> Int
myLength as = loop 0 as
 where
  loop acc []       = acc
  loop acc (x : xs) = loop (acc + 1) xs

-- write a generalized function for folding in a left associative way
-- e.g. myFoldl (*) 1 [2,3,4] == ((1 * 2) * 3) * 4
myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl _ b []       = b
myFoldl f b (a : as) = myFoldl f (f b a) as

sumUsingFoldl :: [Int] -> Int
sumUsingFoldl = foldl (+) 0

lengthUsingFoldl :: [a] -> Int
lengthUsingFoldl as = foldl (\b _ -> b + 1) 0 as
-- bonus questions:
-- * what is the difference between left and right fold?
-- * when should you use one over the other?
