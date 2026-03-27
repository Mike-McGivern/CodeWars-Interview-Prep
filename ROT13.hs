module ROT13 (rot13) where

import Data.Char (chr, ord, isAlpha, isUpper)

rot13 :: String -> String
rot13 = map rot13char

rot13char :: Char -> Char
rot13char c
    | isAlpha c =
        let base = if isUpper c then ord 'A' else ord 'a'
            offset = ord c - base
            shifted = (offset + 13) `mod` 26
        in chr (base + shifted)
    | otherwise = c


--test cases
--module ROT13Spec (spec) where

--import ROT13 (rot13)
--import Test.Hspec
--import Test.HUnit (assertEqual)

--spec :: Spec
--spec = do
 -- it "example tests" $ do
--    test "EBG13 rknzcyr." "ROT13 example."
--    test "This is my first ROT13 excercise!" "Guvf vf zl svefg EBG13 rkprepvfr!"

--test :: String -> String -> Expectation
--test x expected = assertEqual ("rot13 " ++ show x) expected $ rot13 x
