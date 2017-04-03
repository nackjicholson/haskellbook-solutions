# Exercises 6 - Typeclasses

## Exercises: Eq Instances

Write the `Eq` instance for the datatype provided.

1.  

    ```haskell
    data TisAnInteger = TisAn Integer

    instance Eq TisAnInteger where
      (==) (TisAn x) (TisAn x') = x == x'
    ```

2.  

    ```haskell
    data TwoIntegers =
      Two Integer Integer

    instance Eq TwoIntegers where
      (==) (Two x y) (Two x' y') = x == x' && y == y'
    ```

3.  

    ```haskell
    data StringOrInt =
        TisAnInt Int
      | TisAString String

    instance Eq StringOrInt where
      (==) (TisAnInt x) (TisAnInt x') = x == x'
      (==) (TisAString x) (TisAString x') = x == x'
      (==) _ _ = False
    ```

4.  

    ```haskell
    data Pair a =
      Pair a a

    instance Eq a => Eq (Pair a) where
      (==) (Pair x y) (Pair x' y') = x == x' && y == y'
    ```

5.  

    ```haskell
    data Tuple a b =
      Tuple a b

    instance (Eq a, Eq b) => Eq (Tuple a b) where
      (==) (Tuple x y) (Tuple x' y') = x == x' && y == y'
    ```

6.  

    ```haskell
    data Which a =
        ThisOne a
      | ThatOne a

    instance Eq a => Eq (Which a) where
      (==) (ThisOne x) (ThisOne x') = x == x'
      (==) (ThatOne x) (ThatOne x') = x == x'
      (==) _ _ = False
    ```

7.  

    ```haskell
    data EitherOr a b =
        Hello a
      | Goodbye b

    instance (Eq a, Eq b) => Eq (EitherOr a b) where
      (==) (Hello x) (Hello x') = x == x'
      (==) (Goodbye x) (Goodbye x') = x == x'
      (==) _ _ = False
    ```

## Exercises: Will They Work?

1. `max (length [1, 2, 3]) (length [8, 9, 10, 11, 12])`

  > It will work, returns `5 :: Int`. `length` returns `Int` values, and `Int` has an
  instance of `Ord`, so it satisfies the type constraints of the `max` function.

2. `compare (3 * 4) (3 * 5)`

  > Will work, returns `LT :: Ordering`. `compare` is receiving arguments of
  type `Num`. All subclasses of `Num` have instances of `Ord` and `compare` is
  able to work with those to produce an `Ordering` type. In this case `12` is less
  than `15` and compare returns `LT`.

3. `compare "Julie" True`

  > Will not work because "Julie" and True are not of the same type.
  `compare "Julie" :: [Char] -> Ordering` -- After being applied to "Julie",
  the compiler is expecting to be applied to another string, but it receives
  `True`

4. `(5 + 3) > (3 + 6)`

  > Yes, it works. Wouldn't be much of a programming language if that was broken.
  I am seriously annoyed by the exercises in this chapter. This is absolutely pointless.

## Chapter Exercises

### Multiple Choice

1. The Eq class

  a) includes all types in Haskell  
  b) is the same as the Ord class  
  c) makes equality tests possible  
  d) only includes numeric types  

  > c

2. The typeclass Ord

  a) allows any two values to be compared  
  b) is a subclass of Eq  
  c) is a superclass of Eq  
  d) has no instance for Bool  

  > b

3. Suppose the typeclass Ord has an operator >. What is the
type of >?

  a) Ord a => a -> a -> Bool  
  b) Ord a => Int -> Bool  
  c) Ord a => a -> Char  
  d) Ord a => Char -> [Char]

  > a

4. In x = divMod 16 12

  a) the type of 𝑥 is Integer  
  b) the value of 𝑥 is undecidable  
  c) the type of 𝑥 is a tuple  
  d) 𝑥 is equal to 12 / 16

  > c

5. The typeclass Integral includes

  a) Int and Integer numbers  
  b) integral, real, and fractional numbers  
  c) Schrodinger’s cat  
  d) only positive numbers

  > a

### Does it typecheck?

**Note** I  quit updating these exercises when I went back through 0.12 haskellbook.
This chapter is too infuriating. It's pedantic, uninformative, uninteresting,
and presented poorly. You can really tell when a chapter was produced
mainly by Chris Allen.

I may or may not come back and update this section. Sorry anyone stumbling across this, looking
for clear guidance. I finished it for 0.11, taking a look at the .hs files may still
give you some insight if you are interested.

see exercises.hs


**Given a datatype declaration, what can we do?**

see exercises.hs

**Match the types**

2.
```
f :: Float
f = 1.0
```

alt: `f :: Num a => a`

You can't interchange these type signatures because Num doesn't have an instance
of Fractional, but float does.

3.
```
f :: Float
f = 1.0
```

alt: `f :: Fractional a => a`

Yes.

4.
```
f :: Float
f = 1.0
```

alt: `f :: RealFrac a => a`

I think so, don't know what RealFrac is, but I imagine it's a real Fractional
number that implements Fractional as a subclass.

Yes it does work.

5.
```
freud :: a -> a
freud x = x
```

alt: `freud :: Ord a => a -> a`

Yes, it's just a version of the identity function constrained to Ord

6.
```
freud :: a -> a
freud x = x
```

`freud :: Int -> Int`

Yes, I think same thing, identity constrained to concrete type Int

7.
```
myX = 1 :: Int

sigmund :: Int -> Int
sigmund x = myX
```

alt: `sigmund :: a -> a`

No, because `myX` is always `Int` and that means if you pass in a non int,
this would not typecheck.

8.
```
myX = 1 :: Int

sigmund :: Int -> Int
sigmund x = myX
```

alt: `sigmund :: Num a => a -> a`

I still think this is a no, for the same reason. You could pass any type of
Num and then it would be expecting that type back, but it would always return
an Int.

9.
```
jung :: Ord a => [a] -> a
jung xs = head (sort xs)
```

alt: `jung :: [Int] -> Int`

Yes. Int has Ord

10.
```
young :: [Char] -> Char
young xs = head (sort xs)
```

alt: `young :: Ord a => [a] -> a`

Yes.

11.
```
mySort :: [Char] -> [Char]
mySort = sort
signifier :: [Char] -> Char
signifier xs = head (mySort xs)
```

alt: `signifier :: Ord a => [a] -> a`

No because using `mySort` is constrained to `[Char]`

**Type-Kwon-do**

see exercises.hs
