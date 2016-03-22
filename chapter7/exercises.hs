-- chapter7/exercises
module Exercises where

-- 7.5 Intermisssion

-- Rewrite if-then-else

-- 1.
-- functionC x y = if (x > y) then x else y
functionC :: Ord a => a -> a -> a
functionC x y =
  case (x > y) of
    True -> x
    False -> y

-- 2.
-- ifEvenAdd2 n = if even n then (n + 2) else n
ifEvenAdd2 :: Integral a => a -> a
ifEvenAdd2 n =
  case isEven of
    True -> n + 2
    False -> n
  where isEven = even n

-- Fix it

nums :: (Num a, Ord a) => a -> Int
nums x =
  case compare x 0 of
    EQ -> 0
    LT -> -1
    GT -> 1

-- 7.6 Intermission

dodgy :: Num a => a -> a -> a
dodgy x y = x + y * 10

oneIsOne :: Num a => a -> a
oneIsOne = dodgy 1

oneIsTwo :: Num a => a -> a
oneIsTwo = flip dodgy 2

-- 1. dodgy 1 0 -> 1
-- 2. dodgy 1 1 -> 11
-- 3. dodgy 2 2 -> 22
-- 4. dodgy 1 2 -> 21
-- 5. dodgy 2 1 -> 12
-- 6. oneIsOne 1 -> 11
-- 7. oneIsOne 2 -> 21
-- 8. oneIsTwo 1 -> 21
-- 9. oneIsTwo 2 -> 22
-- 10. oneIsOne 3 -> 31
-- 11. oneIsTwo 3 -> 23

-- Chapter Exercises

-- Let's write code

-- 1.

tensDigit :: Integral a => a -> a
tensDigit x = d
  where xLast = x `div` 10
        d = xLast `mod` 10

-- Rewrite using divMod
tensDigit' :: Integral a => a -> a
tensDigit' x = d
  where (xLast, _) = x `divMod` 10
        d = xLast `mod` 10

-- Implement hunsD
hunsD :: Integral a => a -> a
hunsD x = d2
  where d = x `div` 100
        d2 = d `mod` 10

-- 2.

-- Implement using case and guard
foldBool :: a -> a -> Bool -> a
foldBool = error "Error: Need to implement foldBool!"

-- case
foldBool1 :: a -> a -> Bool -> a
foldBool1 x y b =
  case b of
    True -> x
    False -> y

-- where
foldBool2 :: a -> a -> Bool -> a
foldBool2 x y b
  | b == True = x
  | otherwise = y

-- pattern matching
foldBool3 :: a -> a -> Bool -> a
foldBool3 x y True = x
foldBool3 x y False = y

-- 3.

-- Implement function of type
g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (b, c)
  where b = f a

-- 4.
-- see arith4.hs
-- We convert 4 to a string with "show" and then
-- back to a number again with "read", so the value 4 :: Integer
-- ends up getting sent to print

-- 5.
-- see arith4.hs I converted it in there.

-- 6.
-- see arith4.hs

-- Awesome exercises, I had a lot of fun and learned a lot. :sarcasm:
