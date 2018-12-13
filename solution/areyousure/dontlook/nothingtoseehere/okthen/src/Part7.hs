module Part7 where

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile _ [] = []
myTakeWhile predicate (x : xs) =
    if predicate x then x : myTakeWhile predicate xs else []

myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile _ [] = []
myDropWhile predicate (x : xs) =
    if predicate x then myDropWhile predicate xs else (x:xs)

compressString :: String -> String
compressString [] = []
compressString (x : xs) =
    let streak = x : myTakeWhile (== x) xs
        streakTail = myDropWhile (== x) xs
        len    = length streak
        lenS   = if len > 1 then show len ++ [x] else streak
    in  lenS ++ compressString streakTail
