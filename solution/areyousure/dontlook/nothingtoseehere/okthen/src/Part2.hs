module Part2 where

add1ToEveryElement :: [Int] -> [Int]
add1ToEveryElement []       = []
add1ToEveryElement (a : as) = (a + 1) : add1ToEveryElement as

negateEveryElement :: [Int] -> [Int]
negateEveryElement []       = []
negateEveryElement (a : as) = -a : negateEveryElement as

doubleEveryElement :: [Int] -> [Int]
doubleEveryElement []       = []
doubleEveryElement (a : as) = (a * 2) : doubleEveryElement as

myMap :: (a -> b) -> [a] -> [b]
myMap _ []       = []
myMap f (a : as) = f a : myMap f as

add1WithMap :: [Int] -> [Int]
add1WithMap as = map (+ 1) as

negateWithMap :: [Int] -> [Int]
negateWithMap as = map negate as

doubleEveryElementWithMap :: [Int] -> [Int]
doubleEveryElementWithMap as = map (* 2) as

doubleEveryOtherElement :: [Int] -> [Int]
doubleEveryOtherElement []  = []
doubleEveryOtherElement [a] = [a * 2]
doubleEveryOtherElement (a1 : a2 : as) =
  (a1 * 2) : a2 : (doubleEveryOtherElement as)

doubleEveryOtherElementV2 :: [Int] -> [Int]
doubleEveryOtherElementV2 =
  let f i a = if even i then a * 2 else a
  in  zipWith f [0 ..]
