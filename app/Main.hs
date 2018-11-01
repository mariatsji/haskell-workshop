module Main where

import           Control.Concurrent       (threadDelay)
import           Control.Concurrent.Async (concurrently)
import           Data.Time.Clock

data SlowService
  = AdLookup
  | OrgLookup
  deriving (Eq, Show)

data ServiceData
  = AdData Int
           String
  | OrgData Int
            String
  deriving (Eq, Show)

main :: IO ()
main = do
  putStrLn "Performing two important service calls now"
  (ad, org) <- doQueryFast
  print ad
  print org

doQuery :: IO (ServiceData, ServiceData)
doQuery = do
  ad <- querySlowService AdLookup
  org <- querySlowService OrgLookup
  return (ad, org)

doQueryFast :: IO (ServiceData, ServiceData)
doQueryFast =
  concurrently (querySlowService AdLookup) (querySlowService OrgLookup)

-- External service calls are very slow, unfortunately. Between 3 - 5 seconds.
querySlowService :: SlowService -> IO ServiceData
querySlowService AdLookup = do
  threadDelay 3000000
  return (AdData 1 "{\"picture\": \"house.PNG\"}")
querySlowService OrgLookup = do
  threadDelay 2000000
  return (OrgData 1 "\"logo\": undefined}")
