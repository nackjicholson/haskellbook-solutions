module Cipher where

import Data.Char

alphaRange :: Int
alphaRange = 58

lowerBound :: Int
lowerBound = ord 'A'

upperBound :: Int
upperBound = ord 'z'

encodeChar :: Int -> Char -> Char
encodeChar shift char
  | shiftedCharCode > upperBound = chr (shiftedCharCode - alphaRange)
  | shiftedCharCode < lowerBound = chr (shiftedCharCode + alphaRange)
  | otherwise = chr shiftedCharCode
  where shiftMod = mod shift alphaRange
        charCode = ord char
        shiftedCharCode = charCode + shiftMod

decodeChar :: Int -> Char -> Char
decodeChar = encodeChar . negate

caesar :: Int -> String -> String
caesar shift = map (encodeChar shift)

unCaesar :: Int -> String -> String
unCaesar shift = map (decodeChar shift)
