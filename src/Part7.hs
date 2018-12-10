module Part7 where

-- implement myTakeUntil, see Examples/Examples.hs on how to do recursion on a list
-- Example : myTakeUntil (/= 2) [1,2,3]  -> [1]
myTakeUntil :: (a -> Bool) -> [a] -> [a]
myTakeUntil = undefined
-- This function is known as "takeUntil" in Haskell 

-- implement myDropUntil
-- Example :  myDropUntil (/= 2) [1,2,3]  -> [2,3]
myDropUntil :: (a -> Bool) -> [a] -> [a]
myDropUntil = undefined
-- This function is known as "dropUntil" in Haskell

-- look in Examples/Examples.hs to see how we can do recursion on a String ([char])
-- Your job is to compress a String by representing recurring letters with a number
-- Example : "xyyyyzz" -> "x4y2z"
-- Example : "abc" -> "abc"
-- Example : "" -> ""
-- Use takeUntil and dropUntil, and length that you learned in part 1
-- Using let/in or helper-functions is a good idea
compressString :: String -> String
compressString = undefined
