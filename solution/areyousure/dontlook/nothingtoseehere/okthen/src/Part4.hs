module Part4 where

allTrue :: [Bool] -> Bool
allTrue []       = True
allTrue (x : xs) = x && allTrue xs

anyTrue :: [Bool] -> Bool
anyTrue []       = False
anyTrue (x : xs) = x || anyTrue xs

myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr _ b []       = b
myFoldr f b (a : as) = f a (myFoldr f b as)

allTrueUsingFoldr :: [Bool] -> Bool
allTrueUsingFoldr as = foldr (&&) True as

anyTrueUsingFoldr :: [Bool] -> Bool
anyTrueUsingFoldr as = foldr (||) False as

mySum :: [Int] -> Int
mySum as =
  let loop :: Int -> [Int] -> Int
      loop acc []       = acc
      loop acc (x : xs) = loop (acc + x) xs
  in  loop 0 as

myLength :: [a] -> Int
myLength as = loop 0 as
 where
  loop acc []       = acc
  loop acc (x : xs) = loop (acc + 1) xs

myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl _ b []       = b
myFoldl f b (a : as) = myFoldl f (f b a) as

sumUsingFoldl :: [Int] -> Int
sumUsingFoldl = foldl (+) 0

lengthUsingFoldl :: [a] -> Int
lengthUsingFoldl as = foldl (\b _ -> b + 1) 0 as
