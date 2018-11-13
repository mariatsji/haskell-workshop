module Part2
    ( checkoutItems
    , ResponseData(..)
    , Item(..)
    )
where

import           Lib.CCLib


-- This part is about refactoring
-- We are going to emulate a change in a library
-- Instead of Lib.CCLib, import Lib.CCLib2
-- use `stack build`, and see if you can make your code
-- compile after this lib bump
-- You should only change code in this file
checkoutItems :: [Item] -> Integer -> ResponseData
checkoutItems items creditCard =
    let
        creditCardValid = validate creditCard
        totPrice        = totalPrice items
        amountString    = show totPrice
        userResponse    = case creditCardValid of
            False -> ResponseData
                "Even though we value your creativity, we need an actual credit card"
                Nothing
            True -> ResponseData
                (  "Thanks, this credit card will be drained of "
                ++ amountString
                ++ ",-"
                )
                (Just totPrice)
    in
        userResponse

data ResponseData = ResponseData String (Maybe Integer)

-- The 3 items in our web store
data Item = Sega8Bit | Comodore64 | Atari2600


totalPrice :: [Item] -> Integer
totalPrice = sum . map price

price :: Item -> Integer
price Sega8Bit   = 650
price Comodore64 = 450
price Atari2600  = 350
