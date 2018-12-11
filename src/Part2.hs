module Part2 where

-- add 1 to every element in a list of ints
-- e.g. (add1ToEveryElement [1,2,3]) == [2,3,4]
-- use a recursive function
add1ToEveryElement :: [Int] -> [Int]
add1ToEveryElement = undefined

-- negate every element in a list of ints
-- e.g. (negateEveryElement [1,-2,3]) == [-1,2,-3]
-- this should be very similar to the previous task
negateEveryElement :: [Int] -> [Int]
negateEveryElement = undefined

-- double every element in a list of ints
-- e.g. (doubleEveryElement [1,2,3]) == [2,4,6]
doubleEveryElement :: [Int] -> [Int]
doubleEveryElement = undefined

-- ok, writing a new recursive function every time is annoying
-- let's write a generalized function for applying a transformation
-- to every element of a list
-- Hint : The slide on Higher Order Functions
myMap :: (a -> b) -> [a] -> [b]
myMap = undefined
-- this function already exists in haskell, and is named `map`
-- (there is also a more general `fmap` which can be used for
-- more than just lists. For lists it is the same as `map`.)

-- let's use our map function to reimplement the previous three functions
-- how concise can you write them?
-- Hint : The slide on Infix function
add1WithMap :: [Int] -> [Int]
add1WithMap = undefined

-- use myMap above (or just map if you couldn't figure myMap out..)
negateWithMap :: [Int] -> [Int]
negateWithMap = undefined

-- use myMap above (or just map if you couldn't figure myMap out..)
doubleEveryElementWithMap :: [Int] -> [Int]
doubleEveryElementWithMap = undefined

-- double every other element in a list, starting with the first
-- e.g. doubleEveryOtherElement [1,2,3,4,5] == [2,2,6,4,10]
-- hint: map won't cut it
doubleEveryOtherElement :: [Int] -> [Int]
doubleEveryOtherElement = undefined

