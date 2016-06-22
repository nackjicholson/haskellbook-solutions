{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances #-}

-- chapter11/exercises.hs
module Exercises where

import Data.Int

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
  = Sm
  | Med
  | Lg
  deriving (Eq, Show)

data Vehicle
  = Car Manufacturer Price
  | Plane Airline Size
  deriving (Eq, Show)

myCar, urCar, clownCar, doge :: Vehicle
myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir Sm

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

data Example = MakeExample Int deriving Show

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

instance TooMany String where
  tooMany s = length s > 42

instance TooMany (Int, String) where
  tooMany (a, a') = tooMany (a + length a')

instance (Num a, TooMany a) => TooMany (a, a) where
  tooMany (a, a') = tooMany (a + a')

newtype Goats = Goats Int deriving (Eq, Show, TooMany)

-- 11.8 Intermission

-- 1. Given a datatype
data BigSmall
  = Big Bool
  | Small Bool
  deriving (Eq, Show)
-- What is the cardinality of this datatype?
-- Big Bool | Small Bool = ??
-- 2 + 2 = 4
-- 4

data NumberOrBool
  = Numba Int8
  | BoolyBool Bool
  deriving (Eq, Show)
-- 2. What is the cardinality?
-- 256 + 2 is 258

-- 11.11

data GuessWhat = Chickenbutt deriving (Eq, Show)

data Id a = MkId a deriving (Eq, Show)

data Product a b = Product a b deriving (Eq, Show)

data Sum a b
  = First a
  | Second b
  deriving (Eq, Show)

data RecordProduct a b = RecordProduct
  { pfirst :: a
  , psecond :: b }
  deriving (Eq, Show)

data OperatingSystem
  = GnuPlusLinux
  | OpenBSDPlusNevermindJustBSDStill
  | Mac
  | Windows
  deriving (Eq, Show)

data ProgrammingLanguage
  = Haskell
  | Agda
  | Idris
  | PureScript
  deriving (Eq, Show)

data Programmer = Programmer
  { os :: OperatingSystem
  , lang :: ProgrammingLanguage }
  deriving (Eq, Show)

allOperatingSystems :: [OperatingSystem]
allOperatingSystems =
  [ GnuPlusLinux
  , OpenBSDPlusNevermindJustBSDStill
  , Mac
  , Windows
  ]

allLanguages :: [ProgrammingLanguage]
allLanguages = [Haskell, Agda, Idris, PureScript]

-- Write a function that generates all possible values of Programmer. Use the
-- provided lists of inhabitants of OperatingSystem and ProgrammingLanguage.
allProgrammers :: [Programmer]
allProgrammers = [Programmer x y | x <- allOperatingSystems, y <- allLanguages]
