module Part7 where

-- implement myTakeUntil, see Examples/Examples.hs on how to do recursion on a list
-- Example : myTakeUntil (/= 2) [1,2,3]  -> [1]
myTakeUntil :: (a -> Bool) -> [a] -> [a]
myTakeUntil _ [] = []
myTakeUntil predicate (x : xs) =
    if predicate x then x : myTakeUntil predicate xs else []

-- implement myDropUntil
-- Example :  myDropUntil (/= 2) [1,2,3]  -> [2,3]
myDropUntil :: (a -> Bool) -> [a] -> [a]
myDropUntil _ [] = []
myDropUntil predicate (x : xs) =
    if predicate x then myDropUntil predicate xs else (x:xs)

-- look in Examples/Examples.hs to see how we can do recursion on a String ([char])
-- Your job is to compress a String by representing recurring letters with a number
-- Example : "xyyyyzz" -> "x4y2z"
-- Example : "abc" -> "abc"
-- Example : "" -> ""
-- Use myTakeUntil and myDropUntil, and length that you learned in part 1
-- Using let/in or helper-functions is a good idea
compressString :: String -> String
compressString [] = []
compressString (x : xs) =
    let streak = x : myTakeUntil (== x) xs
        streakTail = myDropUntil (== x) xs
        len    = length streak
        lenS   = if len > 1 then show len ++ [x] else streak
    in  lenS ++ compressString streakTail
