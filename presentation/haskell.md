---
title: Haskell Workshop
author: FINN.no
...


![](/Users/sjumilli//haskell/haskell-workshop/presentation/images/haskell-workshop.png)


### Haskell

- Haskell / GHC
- Purely functional
- Statically Typed
- Lazy


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


### create a function 2

```haskell
myFunction :: String -> Int
myFunction stringArg = length stringArg
```


### Applying a function

```haskell
nextInt :: Integer -> Integer
nextInt x = succ x
```

No paranthesis!


### Curried signatures

```haskell
addTwoNumbers :: Integer -> Integer -> Integer
addTwoNumbers a b = a + b
```


### if .. then .. else

```haskell
isNine :: Integer -> Bool
isNine i = if i == 9
  then True
  else False
```

Remember then


### let .. in expressions

```haskell
cylVolume :: Float -> Float -> Float
cylVolume diam h =
  let rad = diam / 2
      area = pi * rad^2
  in area * h
```


## lists

```haskell
listOfInts :: [Integer]
listOfInts  = [1,2,3]

concat :: [a] -> [a] -> [a]
concat as bs = as ++ bs
```


## recursion on lists

```haskell
uppercase :: [Char] -> [Char]
uppercase [] = []
uppercase (x:xs) = toUpper x :: uppercase xs
```

`x` is a `Char` but `xs` is a `[Char]`


## Functions over lists

```haskell
inc :: [Integer] -> [Integer]
inc numbers = map (+1) numbers

inc2 :: [Integer] -> [Integer]
inc2 numbers = map (\x -> x + 1) numbes
```


## Functions over lists 2

```haskell
firstFive :: [a] -> [a]
firstFive as = take 5 as

onlyEven :: [Integer] -> [Integer]
onlyEven xs = filter even xs
```


### Creating a type

```haskell
data TrafficLight = Red | Yellow | Green

safe :: TrafficLight -> Bool
safe Red    = False
safe Yellow = False
safe Green  = True
```


## What to do

- open README.md
