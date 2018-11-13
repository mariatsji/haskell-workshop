module Part1
  ( helloWorld
  , add
  , isSeven
  , count
  , sum
  , apply
  , applys
  , Bit(..)
  , prettyPrint
  )
where

import           Numeric.Natural
import           Prelude                           hiding ( sum )

-- given a name (String) as input should create a personalized greeting
-- e.g. `helloworld "Jens"` -> "Hello, Jens!"
helloWorld :: String -> String
helloWorld name = "Hello, " ++ name ++ "!"

-- given two Floats, adds these together, resulting in another Float
add :: Float -> Float -> Float
add a b = a + b

-- check if a number is `7`
isSeven :: Integer -> Bool
isSeven i = if (i == 7) then True else False

-- count things in a list
count :: [a] -> Natural
count []       = 0
count (x : xs) = succ . count $ xs

-- sum Ints in a list
sum :: [Int] -> Int
sum []       = 0
sum (x : xs) = x + sum xs

-- apply a function given as an argument
apply :: (a -> b) -> a -> b
apply f a = f a

-- apply a function to a list of arguments
applys :: (a -> b) -> [a] -> [b]
applys f []       = []
applys f (x : xs) = f x : applys f xs

-- below is the existing definition of a Bit
-- .. but you have just discovered quantum computing!
-- So you should therefore expand the type with a new data constructor : SuperPosition
-- Make this change in the data definition below : 
data Bit = Zero | One | SuperPosition

-- what should the new SuperPosition case look like? You decide!
prettyPrint :: Bit -> Char
prettyPrint Zero          = '0'
prettyPrint One           = '1'
prettyPrint SuperPosition = '*'
