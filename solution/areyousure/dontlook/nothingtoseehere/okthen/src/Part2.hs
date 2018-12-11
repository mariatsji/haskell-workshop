module Part2 where

-- add 1 to every element in a list of ints
-- e.g. (add1ToEveryElement [1,2,3]) == [2,3,4]
-- use a recursive function
add1ToEveryElement :: [Int] -> [Int]
add1ToEveryElement []       = []
add1ToEveryElement (a : as) = (a + 1) : add1ToEveryElement as

-- negate every element in a list of ints
-- e.g. (negateEveryElement [1,-2,3]) == [-1,2,-3]
-- this should be very similar to the previous task
negateEveryElement :: [Int] -> [Int]
negateEveryElement []       = []
negateEveryElement (a : as) = -a : negateEveryElement as

-- double every element in a list of ints
-- e.g. (doubleEveryElement [1,2,3]) == [2,4,6]
doubleEveryElement :: [Int] -> [Int]
doubleEveryElement []       = []
doubleEveryElement (a : as) = (a * 2) : doubleEveryElement as

-- ok, writing a new recursive function every time is annoying
-- let's write a generalized function for applying a transformation
-- to every element of a list
myMap :: (a -> b) -> [a] -> [b]
myMap _ []       = []
myMap f (a : as) = f a : myMap f as
-- this function already exists in haskell, and is named `map`
-- (there is also a more general `fmap` which can be used for
-- more than just lists. For lists it is the same as `map`.)

-- let's use our map function to reimplement the previous three functions
-- how concise can you write them?
-- hint: for infix functions like + and *, you can wrap the operator and
-- one operand in parantheses to create a partially applied function.
-- e.g.
--   (+ 5) is the same as (\x -> x + 5)
--   (5 +) is the same as (\x -> 5 + x)
add1WithMap :: [Int] -> [Int]
add1WithMap as = map (+ 1) as

-- use myMap above (or just map if you couldn't figure myMap out..)
negateWithMap :: [Int] -> [Int]
negateWithMap as = map negate as

-- use myMap above (or just map if you couldn't figure myMap out..)
doubleEveryElementWithMap :: [Int] -> [Int]
doubleEveryElementWithMap as = map (* 2) as

-- double every other element in a list, starting with the first
-- e.g. doubleEveryOtherElement [1,2,3,4,5] == [2,2,6,4,10]
-- hint: map won't cut it
doubleEveryOtherElement :: [Int] -> [Int]
doubleEveryOtherElement []  = []
doubleEveryOtherElement [a] = [a * 2]
doubleEveryOtherElement (a1 : a2 : as) =
  (a1 * 2) : a2 : (doubleEveryOtherElement as)

doubleEveryOtherElementV2 :: [Int] -> [Int]
doubleEveryOtherElementV2 =
  let f i a = if even i then a * 2 else a
  in  zipWith f [0 ..]
