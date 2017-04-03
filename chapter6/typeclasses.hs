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

data Identity a =
  Identity a

instance Eq a => Eq (Identity a) where
  (==) (Identity v) (Identity v') = v == v'

-- Exercises: Eq Instances

-- 1.
data TisAnInteger =
  TisAn Integer

instance Eq TisAnInteger where
  (==) (TisAn x) (TisAn x') = x == x'

-- 2.
data TwoIntegers =
  Two Integer Integer

instance Eq TwoIntegers where
  (==) (Two x y) (Two x' y') = x == x' && y == y'

-- 3.
data StringOrInt =
    TisAnInt Int
  | TisAString String

instance Eq StringOrInt where
  (==) (TisAnInt x) (TisAnInt x') = x == x'
  (==) (TisAString x) (TisAString x') = x == x'
  (==) _ _ = False

-- 4.
data Pair a =
  Pair a a

instance Eq a => Eq (Pair a) where
  (==) (Pair x y) (Pair x' y') = x == x' && y == y'

-- 5.
data Tuple a b =
  Tuple a b

instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple x y) (Tuple x' y') = x == x' && y == y'

-- 6.
data Which a =
    ThisOne a
  | ThatOne a

instance Eq a => Eq (Which a) where
  (==) (ThisOne x) (ThisOne x') = x == x'
  (==) (ThatOne x) (ThatOne x') = x == x'
  (==) _ _ = False

-- 7.
data EitherOr a b =
    Hello a
  | Goodbye b

instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (==) (Hello x) (Hello x') = x == x'
  (==) (Goodbye x) (Goodbye x') = x == x'
  (==) _ _ = False
