-- typeInference2.hs
module TypeInference2 where

f :: Num a => a -> a -> a
f x y = x + y + 3
