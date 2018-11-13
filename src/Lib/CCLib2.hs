module Lib.CCLib2(validate, Validation(..)) where

import qualified Lib.CreditCard as CC

data Validation = Good | Bad

validate :: Integer -> Validation
validate i = case CC.validate i of
    False -> Bad
    True -> Good