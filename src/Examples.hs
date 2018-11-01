module Examples where

import           Numeric.Natural

-- This function takes a list of Char as argument, and give a Natural number back (the length)
myFunction :: [Char] -> Natural -- this is the type signature of the function
myFunction [] = 0 -- this is a pattern matching on the empty list
myFunction (x:xs) -- this is a pattern matching on a non empty list consisting of a head `x` and some more list `xs`
 = 1 + myFunction xs -- this is a recursive call

data Developer -- this is how we define a type called `Developer`
  = ChaoticNeutral
  | LawfulEvil -- this is the two Data Constructors inhabiting our type

goodIdeaToHire :: Developer -> Bool -- this is a function using our type `Developer`
goodIdeaToHire ChaoticNeutral = True -- this is pattern matching on the data constructors
goodIdeaToHire LawfulEvil     = False -- the implementation of this function is debatable..

contract :: Developer -> String
contract d =
  if goodIdeaToHire d -- we have if else in Haskell too!
    then "<contract>Sign here ........</contract>" -- remember the `then`
    else "<ManagerContract>Sign here .........</ManagerContract>" -- and you must always have an `else`
