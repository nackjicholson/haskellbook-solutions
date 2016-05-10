-- chapter8/exercises.hs
module Exercises where

import Data.List (intercalate)

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

-- Chapter Exercises

-- 2. Write a function that recursively sums all numbers from 1 to n, n being
-- the argument. So that if n was 5 you'd add 1+2+3+4+5 to get 15. The type
-- should be (Eq a, Num a) => a -> a.

sumN :: (Eq a, Num a) => a -> a
sumN 0 = 0
sumN n = n + sumN (n - 1)

-- 3. Write a function that multiplies two integral numbers using recursive
-- summation. The type should be (Integral a) => a -> a -> a

multipliedBy :: Integral a => a -> a -> a
multipliedBy x y = go x 0 0
  where go x' s count
          | count == y = s
          | otherwise = go x' (s + x') (count + 1)

-- Fixing dividedBy

data DividedResult
  = Result (Integer, Integer)
  | DividedByZero
  deriving Show

dividedBy :: Integer -> Integer -> DividedResult
dividedBy 0 _ = Result (0, 0)
dividedBy _ 0 = DividedByZero
dividedBy num denom = go absNum absDenom 0
  where multiplier = signum num * signum denom
        absNum = abs num
        absDenom = abs denom
        go n d count
          | n < d = Result (count * multiplier, n)
          | otherwise = go (n - d) d (count + 1)

-- McCarthy 91

mc91 :: (Integral a) => a -> a
mc91 n
  | n > 100 = n - 10
  | otherwise = mc91 (mc91 (n + 11))

-- Numbers into words

digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord _ = "nine"

-- My first attempt at the digits function.
-- It's fairly gross but does work.
-- It builds a list of digits determined by `divMod` and `mod`
-- methodology from chapter 7. I start with a position of 1,
-- in order to capture the place value in the "ones" position. The position
-- is multiplied by the base of 10 for each successive run in order to get
-- the digit from the next place value. When the position value is
-- greater than the number, the loop terminates and returns the list of digits.
--
digits' :: Int -> [Int]
digits' n = go [] 1
  where go list position
          | position > n = list
          | otherwise = go (x:list) (position * 10)
          where x = (n `div` position) `mod` 10

-- Second attempt. Better? I dunno maybe more list intensive (doesn't matter).
-- Certainly easier to understand.
digits :: Int -> [Int]
digits n
  | n < 10 = [n]
  | otherwise = digits(n `div` 10) ++ [n `mod` 10]

wordNumber :: Int -> String
wordNumber n = intercalate "-" (map digitToWord (digits n))
