# Chapter 7 Exercises

### 7.3 intermission

1. Which are equivalent
```
mTh x y z = x * y * z
mTh x y = \z -> x * y * z
mTh x = \y -> \z -> x * y * z
mTh = \x -> \y -> \z -> x * y * z
```

All of them.

2.The type of mTh (above) is Num a => a -> a -> a -> a.
Which is the type of mTh 3?
  - (d) `Num a => a -> a -> a`

3. Anonymous functions
a) Rewrite the f function in the where clause.

```haskell
addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where f n = n + 1
```

```haskell
addOneIfOdd n = case odd n of
  True -> (\x -> x + 1) n
  False -> n
```

b) Rewrite the following to use anonymous lambda syntax:

```haskell
addFive x y = (if x > y then y else x) + 5
```

```haskell
addFive = \x -> \y -> (if x > y then y else x) + 5
```

c) Rewrite the following so that it doesn’t use anonymous lambda syntax:
```haskell
mflip f = \x -> \y -> f y x
```

```haskell
mflip f x y = f y x
```
