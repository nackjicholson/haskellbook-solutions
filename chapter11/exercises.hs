-- chapter11/exercises.hs
module Exercises where

data Price = Price Integer deriving (Eq, Show)

data Manufacturer
  = Mini
  | Mazda
  | Tata
  deriving (Eq, Show)

data Airline
  = PapuAir
  | CatapultsR'Us
  | TakeYourChancesUnited
  deriving (Eq, Show)

data Size
  = Small
  | Medium
  | Large
  deriving (Eq, Show)

data Vehicle
  = Car Manufacturer Price
  | Plane Airline Size
  deriving (Eq, Show)

myCar, urCar, clownCar, doge :: Vehicle
myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir Small

-- 1. What is the type of myCar?
  -- myCar :: Vehicle

-- 2. Given the following, define the functions:
isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

-- 3. Now we’re going to write a function to tell us the manufacturer
-- of a piece of data:

-- To make this safer I'm going to use Maybe
getManu :: Vehicle -> Maybe Manufacturer
getManu (Car m _) = Just m
getManu _ = Nothing
