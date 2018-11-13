---
title: Haskell Workshop
author: FINN.no
patat:
    wrap: true
    margins:
        left: 10
        right: 10
    incrementalLists: true
    images:
        backend: auto
...

# 

![](haskell-workshop.png)

# Haskell

* Haskell / GHC
* Purely functional
* No side-effects
* Lazy
* Mystic \*

\* has monads


#

![](FP-IMP.png)


# Wat?

```haskell
validate :: Integer -> Bool
validate = isZeroRem10 . sumDigits . doubleEveryOther . toDigits
```

