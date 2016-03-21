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

### 7.4 intermission

1. Given the following declarations

```haskell
k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2))
k3 = k (3, True)
```

(a) What is the type of `k`?
`k :: (x, y) -> x`

(b) What is the type of `k2`? Is it the same type as `k1` or `k3`?
`k2 :: [Char]`. No it isn't the same type as the others. Although, k1 and k3 do have the same type. `k1 :: Num a => a`

(c) Of `k1`, `k2`, `k3` which will return the number 3 as the result?
`k1` and `k3`

2. Fill in the definition of the following function:

```haskell
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, _, c) (d, _, f) = ((a, d), (c, f))
```
