-- chapter5/exercises.hs
module Exercises where

-- Type-Kwon-Do

-- 1.
-- I'm actually going to fill in the f and g functions, but you can
-- leave them undefined.
--
-- Take an Int and get the first digit back as a Char
-- h 48402
-- '4'
f :: Int -> String
f = show

g :: String -> Char
g (x:_) = x
g [] = error "Empty list"

h :: Int -> Char
h = g . f

-- 2.
data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e = w . q

-- 3.
data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform (x, y) = (xz x, yz y)

-- 4.
munge :: (x -> y) -> (y -> (w, z)) -> x -> w
munge xToY yToPair = fst . yToPair . xToY
-- or munge xToY yToPair x = fst $ yToPair $ xToY x
