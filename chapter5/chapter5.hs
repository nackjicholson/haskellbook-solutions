-- chapter5.hs
module Chapter5 where

addStuff :: Integer -> Integer -> Integer
addStuff a b = a + b + 5

funcIgnoresArgs :: a -> a -> a -> String
funcIgnoresArgs x y z = "Blah"

nonsense :: Bool -> Integer
nonsense True = 805
nonsense False = 31337

typicalCurriedFunction :: Integer -> Bool -> Integer
typicalCurriedFunction i b = i + (nonsense b)

anonymous :: Integer -> Bool -> Integer
anonymous = \i b -> i + (nonsense b)

anonymousAndManuallyNested :: Integer -> Bool -> Integer
anonymousAndManuallyNested = \i -> \b -> i + (nonsense b)
