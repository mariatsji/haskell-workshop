module Lib.CCLib2(validate) where

import qualified Lib.CreditCard as CC

validate :: Integer -> Maybe Integer
validate i = case CC.validate i of
    False -> Nothing
    True -> Just i