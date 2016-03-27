-- chapter9/exercises.hs
module Exercises where

-- 9.5 Intermission
--
-- Not clear at all to me what this book wants me to do with these type specific
-- implementations of enumFromTo. They haven't taught me folds or any way to
-- work with lists, but they want me to write this code without using the one
-- thing they have taught me, range syntax.
--
-- All the methods I know for solving problems like this seem wrong.
--
-- 1. hard coding every single value via argument destructureing
-- 2. Build a list recursively via a "go" function.
-- 3. Recurse and build
--
-- It's also not clear to me why these implementations they've asked me to do
-- are type specific. I feel like that's somehow supposed to make it easier
-- but instead just serves to confuse the hell out of me. I'm just going
-- to do it with one shared function...

eft :: (Enum a, Ord a) => a -> a -> [a]
eft start stop
  | start > stop = []
  | start == stop = [stop]
  | otherwise = start : eft (succ start) stop

-- I'll hard code this one.
eftBool :: Bool -> Bool -> [Bool]
eftBool False True = [False, True]
eftBool _ _ = []

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd = eft

eftInt :: Int -> Int -> [Int]
eftInt = eft

eftChar :: Char -> Char -> String
eftChar = eft

-- 9.6 Intermission

-- 1.
myWords :: String -> [String]
myWords str
  | null str = []
  | otherwise = word : myWords remaining
  where word = takeWhile (/=' ') str
        remaining = drop (length word + 1) str

-- 2. see poemLines.hs

-- 3.
explodeStrOnChar :: Char -> String -> [String]
explodeStrOnChar _ [] = []
explodeStrOnChar char str = subString : explodeStrOnChar char remainingStr
  where subString = takeWhile (/= char) str
        remainingStr = drop (length subString + 1) str
