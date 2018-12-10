module Part5 where

import Part2

-- Append one linked list after another
-- this function already exists as ++ in haskell
-- e.g. [1,2,3] ++ [4,5,6] == [1,2,3,4,5,6]
-- hint: recursively prepend
myAppend :: [a] -> [a] -> [a]
myAppend = undefined

-- Your implementation of append might look familiar
-- Try reimplementing it using a right fold
myAppendUsingRightFold :: [a] -> [a] -> [a]
myAppendUsingRightFold = undefined

-- concatenate a list of lists into a single list
-- e.g. (concat [[1,2],[3,4],[5,6]]) == [1,2,3,4,5,6]
-- tip: use the append function (`myAppend` or `(++)`) introduced earlier
myConcat :: [[a]] -> [a]
myConcat = undefined
-- this operation is also known as `join` in haskell
-- also known as "flatten" in some languages

-- implement flatMap
-- map and then flatten
-- e.g. (flatMap (\x -> [x,x]) [1,2,3]) == [1,1,2,2,3,3]
-- notice the similarity to the signature of the `map` function
flatMap :: (a -> [b]) -> [a] -> [b]
flatMap = undefined
-- this function is known as "bind" in haskell and is written >>=, which is an infix function
-- however, the order of the first two arguments are reversed
-- so the example above becomes: ([1,2,3] >>= (\x -> [x,x])) == [1,1,2,2,3,3]
-- bonus question: why are the arguments reversed?

-- create all possible pairs where the first element is from the first list
-- and the second element is from the second list
-- e.g. (allCombinations [1,2] ['a', 'b']) == [(1,'a'), (1,'b'), (2,'a'), (2,'b')]
-- hint: use >>=
allCombinations :: [a] -> [b] -> [(a, b)]
allCombinations = undefined
