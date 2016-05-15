-- chapter10/exercises.hs
module Exercises where

import Data.List

stops :: String
stops = "pbtdkg"

vowels :: String
vowels = "aeiou"

-- 1(a) Write a function that takes inputs from stops and vowels and
-- makes 3-tuples of all possible stop-vowel-stop combinations.
-- These will not all correspond to real words in English, although
-- the stop-vowel-stop pattern is common enough that
-- many of them will.

stopVowelStopCombos ::[(Char, Char, Char)]
stopVowelStopCombos = [(s1, v, s2) | s1 <- stops, v <- vowels, s2 <- stops]

-- 1(b) Modify that function so that it only returns the combinations
-- that begin with a p.

pCombos :: [(Char, Char, Char)]
pCombos = [(s1, v, s2) | s1 <- stops, v <- vowels, s2 <- stops, s1 == 'p']

-- 1(c) Now set up lists of nouns and verbs (instead of stops and
-- vowels) and modify the function to make tuples representing
-- possible noun-verb-noun sentences.

nouns, verbs :: [String]
nouns = ["larry", "curly", "moe"]
verbs = ["hits", "slaps", "kicks"]

stoogeCombos :: [(String, String, String)]
stoogeCombos = [(n1, v, n2) | n1 <- nouns, v <- verbs, n2 <- nouns]

-- 3.
avgWordLength :: (Fractional a) => String -> a
avgWordLength text = numberOfLetters / numberOfWords
  where numberOfWords = (fromIntegral . length . words) text
        numberOfLetters = sum (map (fromIntegral . length) (words text))

-- Functions using Folds

-- 1. myOr returns True if any Bool in the list is True.
myOr :: [Bool] -> Bool
myOr = foldr (||) False


-- 2. myAny returns True if a -> Bool applied to any of the values in the
-- list returns True.
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (\a b -> f a || b) False

-- 3. In addition to the recursive and fold based myElem, write a version
-- that uses any.
myElem :: Eq a => a -> [a] -> Bool
myElem x = any (==x)

-- 4. Implement myReverse, don’t worry about trying to make it lazy.
myReverse :: [a] -> [a]
myReverse = foldl (flip (:)) []

-- 5. Write myMap in terms of foldr. It should have the same behavior
-- as the built-in map.
myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

-- 6. Write myFilter in terms of foldr. It should have the same behavior
-- as the built-in filter.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\x xs -> if f x then x:xs else xs) []
