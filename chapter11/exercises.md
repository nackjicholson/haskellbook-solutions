# Chapter 11 Exercises

### 11.4 Intermission

```haskell
data PugType = PugData
data HuskyType a = HuskyData
data DogueDeBordeaux doge = DogueDeBordeaux doge

data Doggies a
  = Husky a
  | Mastiff a
  deriving (Eq, Show)
```

1. Is Doggies a type constructor or a data constructor?
  - Type constructor
2. What is the kind of Doggies?
  - `Doggies :: * -> *`
3. What is the kind of Doggies String?
  - `Doggies String :: *`
4. What is the type of Husky 10?
  - `Husky 10 :: Num a => Doggies a`
5. What is the type of Husky (10 :: Integer)?
  - `Husky (10 :: Integer) :: Doggies Integer`
6. What is the type of Mastiff "Scooby Doo"?
  - `Mastiff "Scooby Doo" :: Doggies [Char]`
7. Is DogueDeBordeaux a type constructor or a data constructor?
  - Both
8. What is the type of DogueDeBordeaux?
  - `DogueDeBordeaux :: doge -> DogueDeBordeaux doge`
9. What is the type of DogueDeBordeaux "doggie!"
  - `DogueDeBordeaux "doggie!" :: DogueDeBordeaux [Char]`

### 11.5 Intermission

see [exercises.hs]('./exercises.hs')

### 11.6 Intermission

What is cardinality?

1. `data PugType = PugData`
  - 1
2.
  ```haskell
  data Airline
    = PapuAir
    | CatapultsR'Us
    | TakeYourChancesUnited
  ```
  - 3
3. Cardinality of Int16?
  - `65536`
4. Use the REPL and maxBound and minBound to examine Int and Integer.
What can you say about the cardinality of those types?
  - Int has a lot of values, and Integer isn't Bounded at all
5. Extra credit (impress your friends!): What’s the connection between
the 8 in Int8 and that type’s cardinality of 256?
  - `2 ^ 8 == 256`
6. What is the type of data constructor MakeExample? What happens
when you request the type of Example?
  - Type of MakeExample `MakeExample :: Example`
  - Can't query the type of Example, because it is a type constructor
7. Do that.
8. Try making a new datatype like Example but with a single type
argument added to MakeExample, such as Int. What has changed
when you query MakeExample with :type in GHCi?
  - `MakeExample :: Int -> Example` It's a function now.

### 11.7 and 11.8 Intermission

see [examples.hs]('./examples.hs')

### 11.9 Intermission

see [jammin.hs]('./jammin.hs')
