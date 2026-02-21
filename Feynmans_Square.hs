module Feynman where

countSquares :: Integer -> Integer
countSquares n = n * (n + 1) * (2 * n + 1) `div` 6
