-- chapter8/exercises.hs
module Exercises where

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
