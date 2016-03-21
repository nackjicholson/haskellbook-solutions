-- chapter7/exercises
module Exercises where

-- 7.5 Intermisssion

-- Rewrite if-then-else

-- 1.
-- functionC x y = if (x > y) then x else y
functionC :: Eq a => a -> a -> a
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
oneIsTwo = (flip dodgy) 2

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
