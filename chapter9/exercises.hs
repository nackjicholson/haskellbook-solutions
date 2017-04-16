-- chapter9/exercises.hs
module Exercises9 where

import Data.Char

-- Exercises: EnumFromTo
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
  | otherwise = start : eft (succ start) stop

-- I'll hard code this one.
eftBool :: Bool -> Bool -> [Bool]
eftBool False False = [False]
eftBool True True = [True]
eftBool False True = [False, True]
eftBool True False = []

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

-- The books answers
myWords' :: String -> [String]
myWords' [] = []
myWords' (' ':xs) = myWords xs
myWords' xs = takeWhile (/= ' ') xs : myWords (dropWhile (/= ' ') xs)

-- 2. see poemLines.hs

-- 3.
explodeStrOnChar :: Char -> String -> [String]
explodeStrOnChar _ [] = []
explodeStrOnChar char str = subString : explodeStrOnChar char remainingStr
  where subString = takeWhile (/= char) str
        remainingStr = drop (length subString + 1) str

-- 9.10 Intermission

-- 3.
-- myFilter "the brown dog was a goof"
-- ["brown","dog","was","goof"]
myFilter :: String -> [String]
myFilter str = filter isNotArticle (myWords str)
  where isNotArticle x = x `notElem` ["a", "an", "the"]

-- 9.11 Intermission

-- 1. Remimplement zip
myZip' :: [a] -> [b] -> [(a, b)]
myZip' [] _ = []
myZip' _ [] = []
myZip' (x:xs) (y:ys) = (x, y) : myZip' xs ys

-- 2. Remimplement zipWith
myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ [] _ = []
myZipWith _ _ [] = []
myZipWith f (x:xs) (y:ys) = f x y : myZipWith f xs ys
-- Actually behaves slightly different if you do list comprehension
-- it won't stop as soon a list is empty.
-- myZipWith f xs ys = [f x y | x <- xs, y <- ys]

-- 3. Rewrite myZip in terms of myZipWith
myZip :: [a] -> [b] -> [(a, b)]
myZip = myZipWith (\x y -> (x, y))

-- Chapter Exersises

-- Data.Char Review

filterByUpper :: String -> String
filterByUpper = filter isUpper

capitalizeFirstChar :: String -> String
capitalizeFirstChar "" = ""
capitalizeFirstChar (x:xs) = toUpper x : xs

shout :: String -> String
shout "" = ""
shout (x:xs) = toUpper x : shout xs

-- Alternative using map
shout' :: String -> String
shout' = map toUpper

capitalizeHead :: String -> Char
capitalizeHead = toUpper . head

-- Write your own standard functions

myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && myAnd xs

myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = f x || myAny f xs

myElem :: Eq a => a -> [a] -> Bool
myElem x = myAny (x==)

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

squish :: [[a]] -> [a]
squish [] = []
squish [x] = x
squish (x:xs) = x ++ squish xs

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = f x ++ squishMap f xs

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f (x:xs) = go f xs x
  where go _ [] acc = acc
        go g [y] acc = case g y acc of
                            GT -> y
                            _ -> acc
        go g (y:ys) acc = case g y acc of
                               GT -> go g ys y
                               _ -> go g ys acc

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy f (x:xs) = go f xs x
  where go _ [] acc = acc
        go g [y] acc = case g y acc of
                            LT -> y
                            _ -> acc
        go g (y:ys) acc = case g y acc of
                               LT -> go g ys y
                               _ -> go g ys acc

myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
