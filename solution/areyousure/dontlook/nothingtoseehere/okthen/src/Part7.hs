module Part7 where

myTakeUntil :: (a -> Bool) -> [a] -> [a]
myTakeUntil _ [] = []
myTakeUntil predicate (x : xs) =
    if predicate x then x : myTakeUntil predicate xs else []

myDropUntil :: (a -> Bool) -> [a] -> [a]
myDropUntil _ [] = []
myDropUntil predicate (x : xs) =
    if predicate x then myDropUntil predicate xs else (x:xs)

compressString :: String -> String
compressString [] = []
compressString (x : xs) =
    let streak = x : myTakeUntil (== x) xs
        streakTail = myDropUntil (== x) xs
        len    = length streak
        lenS   = if len > 1 then show len ++ [x] else streak
    in  lenS ++ compressString streakTail
