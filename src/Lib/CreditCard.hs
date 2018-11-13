-- Code is heavily inspired from the famous CIS 194 course
-- http://www.cis.upenn.edu/~cis194/spring13/lectures.html (Week 1)

module Lib.CreditCard (validate) where

import Data.Char

-- e.g : 4012888888881881 -> True
--       4012888888881882 -> False
validate :: Integer -> Bool
validate = isZeroRem10 . sumDigits . doubleEveryOther . toDigits

-- internal implementation below - don't touch =)
toDigits    :: Integer -> [Integer]
toDigits i
  | i <= 0 = []
  | otherwise = fmap (fromIntegral . digitToInt) . show $ i

toDigitsRev :: Integer -> [Integer]
toDigitsRev = reverse . toDigits 

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther ints = reverse $ doubleify False $ reverse ints

-- double every other digit from right
doubleify :: Bool -> [Integer] -> [Integer]
doubleify _ [] = []
doubleify False (x:xs) =  x : doubleify True xs
doubleify True (x:xs)  = x * 2 : doubleify False xs

sumDigits :: [Integer] -> Integer
sumDigits i = sum $ fmap (sum . toDigits) i

isZeroRem10 :: Integer -> Bool
isZeroRem10 i = i `mod` 10 == 0
