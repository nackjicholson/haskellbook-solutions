-- FunctionWithLet.hs
module FunctionWithLet where

printInc :: (Num a, Show a) => a -> IO ()
printInc n = let plusTwo = n + 2
             in print plusTwo
