# Chapter 10 Exercises

### 10.5 "Fold Left" Intermission

`foldl` and `foldr` definitions as reference

```haskell
foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b
foldr f acc [] = acc
foldr f acc (x:xs) = f x (foldr f acc xs)

foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
foldl f acc [] = acc
foldl f acc (x:xs) = foldl f (f acc x) xs
```

1. `foldr (*) 1 [1..5]` will return the same result as which of the following:

  - (b) `foldl (flip (*)) 1 [1..5]`
  - (c) `foldl (*) 1 [1..5]`

  I think b and c both because `flip (*)` is the same as `(*)`. Here are the drawn out evaluations.

  ```
  foldr (*) 1 [1..5]
  (*) 1 (foldr (*) 1 [2..5])
  (*) 1 ((*) 2 (foldr (*) 1 [3..5]))
  (*) 1 ((*) 2 ((*) 3 (foldr (*) 1 [4..5])))
  (*) 1 ((*) 2 ((*) 3 ((*) 4 (foldr (*) 1 [5]))))
  (*) 1 ((*) 2 ((*) 3 ((*) 4 ((*) 5 (foldr (*) 1 []))))))
  (*) 1 ((*) 2 ((*) 3 ((*) 4 ((*) 5 (1))))))
  (*) 1 ((*) 2 ((*) 3 ((*) 4 5))))
  (*) 1 ((*) 2 ((*) 3 20)))
  (*) 1 ((*) 2 60))
  (*) 1 120
  120
  ```
  ```
  foldl (*) 1 [1..5]
  foldl (*) ((*) 1 1) [2..5]
  foldl (*) ((*) 1 2) [3..5]
  foldl (*) ((*) 2 3) [4..5]
  foldl (*) ((*) 6 4) [5]
  foldl (*) ((*) 24 5) []
  120
  ```

2. Write out the evaluation steps for `foldl (flip (*)) 1 [1..3]`

  ```
  foldl (flip (*)) 1 [1..3]
  foldl (flip (*)) ((flip (*)) 1 1) [2..3]
  foldl (flip (*)) ((flip (*)) 1 2) [3]
  foldl (flip (*)) ((flip (*)) 2 3) []
  foldl (flip (*)) (6) []
  6
  ```

3. One difference between foldr and foldl is:

  - (c) foldr, but not foldl associates to the right

4. Folds are catamorphisms, which means they are generally used
to

  - (a) reduce structure

5. The following are simple folds very similar to what you’ve already
seen, but each has at least one error. Please fix them and
test in your REPL:

  - (a) `foldr (++) ["woot", "WOOT", "woot"]`
    - `foldr (++) "" ["woot", "WOOT", "woot"]`
  - (b) `foldr max [] "fear is the little death"`
    - `foldr max (minBound :: Char) "fear is the little death"` crucial knowledge `minBound :: Char` is `\NUL`
  - (c) `foldr and True [False, True]`
    - `foldr (&&) True [False, True]`
  - (d) This one is more subtle than the previous. Can it ever return a
  different answer? `foldr (||) True [False, True]`
    - No? I dunno, shut up book you're annoying.
  - (e) `foldl ((++) . show) "" [1..5]`
    - `foldr ((++) . show) "" [1..5]` or `foldl (flip ((++) . show)) "" [1..5]`
  - (f) `foldr const 'a' [1..5]`
    - `foldl const 'a' [1..5]` or `foldr (flip const) 'a' [1..5]`
  - (g) `foldr const 0 "tacos"`
    - yada yada yada
  - (h) `foldl (flip const) 0 "burritos"`
    - yada yada yada
  - (i) `foldl (flip const) 'z' [1..5]`
    - yada yada yada

### 10.6 Intermission

see [Database.hs](./database.hs)
