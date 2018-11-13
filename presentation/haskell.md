---
title: Haskell Workshop
author: FINN.no
patat:
    wrap: false
    margins:
        left: 5
        right: 10
    incrementalLists: true
    images:
        backend: auto
...

# 

![](/Users/sjumilli//haskell/haskell-workshop/presentation/images/haskell-workshop.png)

# Haskell

* Haskell / GHC
* Purely functional
* No side-effects
* Lazy
* Mystic \*

\* has monads


# 


![](/Users/sjumilli//haskell/haskell-workshop/presentation/images/functions.png)


# 


![](/Users/sjumilli//haskell/haskell-workshop/presentation/images/functions2.png)


# In haskell

```haskell
f :: a -> b

g :: c -> d

g . f
```


# Wire input to output

```haskell
isPrime :: Natural -> Bool
isPrime 0 = False
isPrime 1 = False
isPrime 2 = True
isPrime 3 = True
isPrime 4 = False
isPrime 5 = True
isPrime 6 = False
isPrime 7 = True
```


#

![](/Users/sjumilli//haskell/haskell-workshop/presentation/images/fp-oo.png)


# Wat?

```haskell
validate :: Integer -> Bool
validate = isZeroMod10 . sum . doubleEveryOther . toDigits
```

#

![](/Users/sjumilli//haskell/haskell-workshop/presentation/images/robot.png)


# A little bit of syntax

```haskell
data TrafficLight = Red | Yellow | Green

safe :: TrafficLight -> Bool
safe Red    = False
safe Yellow = False
safe Green  = True
```

# Applying a function

```haskell
nextInt :: Integer -> Integer
nextInt x = succ x
```

No paranthesis!

# Curried signatures

```haskell
addTwoNumbers :: Integer -> Integer -> Integer
addTwoNumbers a b = a + b
```

# If-then-else

```haskell
isNine :: Integer -> Bool
isNine i = if i == 9
  then True
  else False
```

# let/in-expressions

```haskell
cylVolume :: Float -> Float -> Float
cylVolume diam h =
  let rad = diam / 2
      area = pi * rad^2
  in area * h
```

# lists

```haskell
listOfInts :: [Integer]
listOfInts = [1,2,3]
```

## higher order functions on list

```haskell
inc :: [Integer] -> [Integer]
inc numbers = map (+1) numbers

inc2 :: [Integer] -> [Integer]
inc2 numbers = map (\x -> x + 1) numbes

inc3 [Integer] -> [Integer]
inc3 = inc
```

# What to do

- README.md