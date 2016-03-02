# Chapter 5 Exercises

### 5.4 Intermission

not :: Bool -> Bool
length :: [a] -> Int
concat :: [[a]] -> [a]
head :: [a] -> a
(<) :: Ord a => a -> a -> Bool

### 5.5 Intermission

1. If the type of `f` is `a -> a -> a -> a` and the type of `x` is `Char`, then
the type of `f x` is:

a) `Char -> Char -> Char`

2. If the type of `g` is `a -> b -> c -> b` then the type of `g 0 'c' "woot"` is:

d) `Char`

3. If the type of `h` is `(Num a, Num b) => a -> b -> b` then the type of
`h 1.0 2` is:

d) `Num b => b` -- I had to write code to get this, I kind of thought it would be `Integer`

4. If the type of `h` is `(Num a, Num b) => a -> b -> b` then the type of
`h 1 (5.5 :: Double)` is:

c) `Double`

5. If the type of `jackal` is `(Ord a, Eq b) => a -> b -> a` then the type of
`jackal "keyboard" "has the word jackal in it"`

a) `[Char]`

6. If the type of `jackal` is `(Ord a, Eq b) => a -> b -> a` then the type of
`jackal "keyboard"`

e) `Eq b => b -> [Char]`

7. If the type of `kessel` is `(Ord a, Num b) => a -> b -> a`, then the type of
`kessel 1 2` is:

e) `(Num a, Ord a) => a`

8. If the type of `kessel` is `(Ord a, Num b) => a -> b -> a`, then the type of
`kessel 1 (2 :: Integer)` is:

e) `(Num a, Ord a) => a`

9. If the type of `kessel` is `(Ord a, Num b) => a -> b -> a`, then the type of
`kessel (1 :: Integer) 2` is:

c) `Integer`

# 5.6 Intermission

2.

```haskell
foo :: a -> a -> a
foo a b = a
foo a b = b
```

3.

```haskell
foo :: a -> b -> b
foo a b = b
foo _ b = b
