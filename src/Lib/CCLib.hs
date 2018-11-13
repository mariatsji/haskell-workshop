module Lib.CCLib (validate) where

import qualified Lib.CreditCard as CC

validate :: Integer -> Bool
validate = CC.validate