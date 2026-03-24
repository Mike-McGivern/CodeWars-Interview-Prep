module Codewars.G964.Revrot where

revRot :: [Char] -> Int -> [Char]
revRot strng sz
    | sz <= 0 || null strng || sz > length strng = ""
    | otherwise = concatMap transform (chunksOf sz strng)
    where
      transform chunk
        | even (sumDigits chunk) = reverse chunk
        | otherwise = rotateLeft chunk
      
      sumDigits = sum . map (read . (:[]))
      
      rotateLeft [] = []
      rotateLeft (x:xs) = xs ++ [x]
      
      --split into chunks of size n, ignoring last incomplete chunk
      chunksOf :: Int -> [a] -> [[a]]
      chunksOf n xs
        | length xs < n = []
        | otherwise = take n xs : chunksOf n (drop n xs)


{-
module Codewars.G964.RevrotSpec where
import Codewars.G964.Revrot (revRot)

import Test.Hspec
import Test.QuickCheck
import Text.Printf (printf)

testRevRot :: [Char] -> Int -> [Char] -> Spec
testRevRot strng sz s = 
    it (printf "should return revRot for s: %s n %d " strng sz) $
        revRot strng sz `shouldBe` s


spec :: Spec
spec = do
    describe "revRot" $ do
        testRevRot "1234" 0 ""
        testRevRot "" 5 ""
        testRevRot "1234" 5 ""
        testRevRot "733049910872815764" 5 "330479108928157"
