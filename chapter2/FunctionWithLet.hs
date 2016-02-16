-- FunctionWithLet.hs
module FunctionWithLet where

printInc n = let plusTwo = n + 2
             in print plusTwo