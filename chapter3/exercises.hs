-- chapter3/exercises.hs
module Chapter3Exercises where

exclaim :: String -> String
exclaim str = str ++ "!"

fourthCharStr :: String -> String
fourthCharStr str = [fourthChar]
  where fourthChar = str !! 4

drop9 :: String -> String
drop9 = drop 9

thirdLetter :: String -> Char
thirdLetter x = x !! 2

letterIndex :: Int -> Char
letterIndex i = "Curry is awesome!" !! i

rvrs :: String -> String
rvrs str = drop 9 str ++ " " ++ take 2 (drop 6 str) ++ " " ++ take 5 str
