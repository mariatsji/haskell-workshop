module Part1 where

import           Data.Char                      ( toUpper )

myMax :: Int -> Int -> Int
myMax x y = if x > y then x else y

add :: Float -> Float -> Float
add a b = a + b

isSeven :: Integer -> Bool
isSeven i = i == 7

helloWorld :: String -> String
helloWorld name = "Hello, " ++ name ++ "!"

isEmpty :: [Int] -> Bool
isEmpty [] = True
isEmpty _ = False

capitalize :: String -> String
capitalize []       = []
capitalize (a : as) = toUpper a : as
