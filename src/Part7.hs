module Part7 where

-- implement myTakeWhile, see Examples/Examples.hs on how to do recursion on a list
-- Example : myTakeWhile (/= 2) [1,2,3]  -> [1]
myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile = undefined
-- This function is known as "takeWhile" in Haskell 

-- implement myDropWhile
-- Example :  myDropWhile (/= 2) [1,2,3]  -> [2,3]
myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile = undefined
-- This function is known as "dropWhile" in Haskell

-- look in Examples/Examples.hs to see how we can do recursion on a String ([char])
-- Your job is to compress a String by representing recurring letters with a number
-- Example : "xyyyyzz" -> "x4y2z"
-- Example : "abc" -> "abc"
-- Example : "" -> ""
-- Use takeWhile and dropWhile, and length that you learned in part 1
-- Using let/in or helper-functions is a good idea
compressString :: String -> String
compressString = undefined
