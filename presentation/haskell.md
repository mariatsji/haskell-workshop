---
title: Haskell Workshop
author: FINN.no
...


![](./images/haskell-workshop.png)



### Haskell

- Purely functional
- Statically Typed
- Lazy
- GHC: Glasgow Haskell Compiler


### REPL

    $ stack repl ./src/Part1.hs
    (...)
    *Part1>


### Unloading and Loading

    *Loaded Modules> :l
    Ok, no modules loaded.
    Prelude>

    Prelude> :l Part1
    Ok, one module loaded.
    *Part1>


### Evaluating values and types

    >1 + 1
    2

    >:t 1
    1 :: Num a => a

### create a function

```haskell
isPrime :: Int -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime 2 = True
isPrime 3 = True
isPrime 4 = False
isPrime 5 = True
isPrime 6 = False
isPrime 7 = True
```


### Curried signatures

```haskell
myFunction :: Int -> Int -> Int
              ^arg0  ^arg1  ^res
```
```haskell
myFunction :: Int -> (Int -> Int)
              ^arg0  ^res
```

    >:t myFunction 1
    myFunction 1 :: Int -> Int



### create a function 2

```haskell
myFunction :: Int -> Int -> Int
myFunction    a      b   =  (a + 1) * b ^ 2
```

Applying the function

    > myFunction 1 2
    8

### Everything is an expression

```haskell
isNine :: Int -> Bool
isNine i = if i == 9
  then True
  else False
```

You must have an else


### lists

```haskell
listOfInts :: [Int]
listOfInts  = [1,2,3]

concat :: [a] -> [a] -> [a]
concat as bs = as ++ bs
```


### Tips

- Indentation matters
- Slack : #finn-haskell-workshop
- Examples-folder
- README.md
- presentation/CheatSheet.pdf
- presentation/index.html


### Exercise time :

    ./runtests 1


### Higher order functions

Functions are values and can be passed as arguments to, and be returned from, other functions.

```haskell
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)
```

### Recursion on lists

There are no for/while loops in haskell.

```haskell
loopThrough :: [a] -> [a]
loopThrough []       = []
loopThrough (a : as) = a : loopThrough as
```

Recursively looping through a list and changing nothing.

### Infix functions 1
You can turn an infix function into a prefix function by wrapping it in parantheses.

This is required to pass it as an argument.

```haskell
(+) 1 2 == 1 + 2
```


### Infix functions 2
You can include one operand inside the parantheses to create a partially applied function.
```haskell
(/ 2) 1 == 1 / 2

(2 /) 1 == 2 / 1
```

### let .. in expressions

```haskell
cylinderVolume :: Float -> Float -> Float
cylinderVolume diameter height =
  let radius = diameter / 2
      area = pi * radius ^ 2
  in area * height
```

Variables can not be reassigned.


### Exercise time :

    ./runtests 2


### Exercise time :

    ./runtests 3


### Anonymous functions (lambda)

```haskell
\a b c -> 2 * a + c
```

```haskell
filter (\x -> x ^ 2 > 5) [1,2,3,4]
```

Sometimes more convenient than creating a named function, or partially applying an existing function.


### Unused variables

Use an underscore to tell the compiler (and yourself) that an argument is intentionally not used.

```haskell
\a _ c -> 2 * a + c
```


### Exercise time :

    ./runtests 4


### Exercise time :

    ./runtests 5


### Creating a type

```haskell
data TrafficLight = Red | Yellow | Green

safe :: TrafficLight -> Bool
safe Red    = False
safe Yellow = False
safe Green  = True
```


### Part 6

- Tests are green
- Keep them green after bumping to Lib.CCLib2
- Expand the datatype Bit as instructed