module Examples.Examples where

import           Numeric.Natural -- natural numbers (0,1,2 .. )

-- This function takes a list of Char as argument, and give a Natural number back (the length)
myFunction :: [Char] -> Natural -- this is the type signature of the function
myFunction []       = 0 -- this is a pattern matching on the empty list
myFunction (x : xs) = 1 + myFunction xs -- this is a pattern matching on a non empty list consisting of a head `x` and some more list `xs` -- this is a recursive call

data Developer -- this is how we define a type called `Developer`
  = ChaoticNeutral
  | LawfulEvil -- this is the two Data Constructors inhabiting our type

goodIdeaToHire :: Developer -> Bool -- this is a function using our type `Developer`
goodIdeaToHire ChaoticNeutral = True -- this is pattern matching on the data constructors
goodIdeaToHire LawfulEvil     = False -- the implementation of this function is debatable..

contract :: Developer -> String
contract d = if goodIdeaToHire d -- we have if else in Haskell too!
  then "<contract>Sign here ........</contract>" -- remember the `then`
  else "<ManagerContract>Sign here .........</ManagerContract>" -- and you must always have an `else`

-- curried syntax looks a little strange
sumTriangleSides :: Integer -> Integer -> Integer -> Integer -- <- many arguments are given like this (last one is _return value_)
sumTriangleSides a b c = a + b + c

-- but it allows us to call a function just like normal
myTriangle :: Integer
myTriangle = sumTriangleSides 5 2 7

-- if you are doing a lot in your function, let / in syntax helps readability
fahrToCelcius :: Float -> Float
fahrToCelcius f =
  let fOrigin        = f - 32 -- what you list here becomes available from this point on inside the function
      originFactored = fOrigin * 5 / 9
  in  originFactored -- what you type here gets returned

-- recursion on list example
makeXbig :: String -> String -- String is the same as [Char] in haskell
makeXbig []       = [] -- we reflect the empty list
makeXbig (x : xs) = -- here, x is a char (the head) and xs is a list (the tail)
                    if x == 'x'
  then 'X' : makeXbig xs -- : means append a list to a single value
  else x : makeXbig xs
