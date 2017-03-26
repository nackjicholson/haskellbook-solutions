-- FunctionWithWhere.hs
module FunctionWithWhere where

printInc :: (Num a, Show a) => a -> IO ()
printInc n = print plusTwo
  where plusTwo = n + 2
