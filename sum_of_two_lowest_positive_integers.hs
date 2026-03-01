module Sums (sumTwoSmallestNumbers) where

import Data.List (sort)

sumTwoSmallestNumbers :: [Int] -> Int
sumTwoSmallestNumbers xs = 
  let sorted = sort xs
  in head sorted + sorted !! 1
