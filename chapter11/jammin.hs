module Jammin where

import Data.List

data Fruit
  = Peach
  | Plum
  | Apple
  | Blackberry
  deriving (Eq, Ord, Show)

-- Cardinality 65536 + 4
data JamJars = Jam
  { fruit :: Fruit
  , quantity :: Int
  } deriving (Eq, Ord, Show)

row1, row2, row3, row4, row5, row6 :: [JamJars]
row1 = [Jam Blackberry 7, Jam Apple 3]
row2 = [Jam Apple 4, Jam Blackberry 4, Jam Plum 1, Jam Peach 3]
row3 = [Jam Peach 4, Jam Plum 6]
row4 = [Jam Apple 10]
row5 = [Jam Peach 8, Jam Blackberry 1, Jam Plum 1]
row6 = [Jam Plum 3]

allJam :: [[JamJars]]
allJam = [row1, row2, row3, row4, row5, row6]

compareFruit :: JamJars -> JamJars -> Ordering
compareFruit (Jam f _) (Jam f' _) = compare f f'

sortRowByFruit :: [JamJars] -> [JamJars]
sortRowByFruit = sortBy compareFruit

groupJam :: [[JamJars]] -> [[JamJars]]
groupJam rows = groupBy sameFruit sortedFruit
  where
    sameFruit (Jam f _) (Jam f' _) = f == f'
    sortedFruit = (sortRowByFruit . concat) rows

countJam :: JamJars -> Int -> Int
countJam jars total = total + quantity jars

jamInRow :: [JamJars] -> Int
jamInRow = foldr countJam 0

howMuchJam :: [[JamJars]] -> Int
howMuchJam rows = sum (map jamInRow rows)

findRowWithMostJam :: [[JamJars]] -> [JamJars]
findRowWithMostJam [] = undefined
findRowWithMostJam (row:rows) = foldr maxJam row rows
  where
    maxJam [] _ = []
    maxJam r [] = r
    maxJam r mostRow = if jamInRow r > jamInRow mostRow then r else mostRow
