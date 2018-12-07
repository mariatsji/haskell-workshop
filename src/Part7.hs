module Part7
    ( takeUntil
    , dropUntil
    , compressString
    )
where

-- implement takeUntil, see Examples/Examples.hs on how to do recursion on a list
-- Example : takeUntil (/= 2) [1,2,3]  -> [1]
takeUntil :: (a -> Bool) -> [a] -> [a]
takeUntil _ [] = []
takeUntil predicate (x : xs) =
    if predicate x then x : takeUntil predicate xs else []

-- implement dropUntilq
-- Example :  dropUntil (/= 2) [1,2,3]  -> [2,3]
dropUntil :: (a -> Bool) -> [a] -> [a]
dropUntil _ [] = []
dropUntil predicate (x : xs) =
    if predicate x then dropUntil predicate xs else (x:xs)

-- look in Examples/Examples.hs to see how we can do recursion on a String ([char])
-- Your job is to compress a String by representing recurring letters with a number
-- Example : "xyyyyzz" -> "x4y2z"
-- Example : "abc" -> "abc"
-- Example : "" -> ""
-- Use takeUntil and dropUntil, and length that you learned in part 1
-- Using let/in or helper-functions is a good idea
compressString :: String -> String
compressString [] = []
compressString (x : xs) =
    let streak = x : takeUntil (== x) xs
        streakTail = dropUntil (== x) xs
        len    = length streak
        lenS   = if len > 1 then show len ++ [x] else streak
    in  lenS ++ compressString streakTail
