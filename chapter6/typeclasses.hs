-- TypeClasses.hs
module TypeClasses where

data Trivial = Trivial

instance Eq Trivial where
  (==) Trivial Trivial = True

data DayOfWeek =
  Mon | Tue | Wed | Thu | Fri | Sat | Sun
  deriving (Eq, Show)

-- Making Friday better than all other days
instance Ord DayOfWeek where
  compare Fri Fri = EQ
  compare Fri _ = GT
  compare _ Fri = LT
  compare _ _ = EQ

-- day of week and numerical day of month
data Date =
  Date DayOfWeek Int

instance Eq Date where
  (==) (Date weekday monthNum)
       (Date weekday' monthNum') =
    weekday == weekday' && monthNum == monthNum'
