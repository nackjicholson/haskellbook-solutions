# Exercises 7 - More functional patterns

## Exercises: Grab bag

1. Which (two or more) of the following are equivalent?

  a) mTh x y z = x * y * z  
  b) mTh x y = \z -> x * y * z  
  c) mTh x = \y -> \z -> x * y * z  
  d) mTh = \x -> \y -> \z -> x * y * z  

  > All are equivalent

2. The type of mTh (above) is Num a => a -> a -> a -> a. Which is the type of mTh 3?

  a) Integer -> Integer -> Integer  
  b) Num a => a -> a -> a -> a  
  c) Num a => a -> a  
  d) Num a => a -> a -> a

  > d

3.  

  a) Rewrite the f function in the where clause.

  ```haskell
  addOneIfOdd n = case odd n of
    True -> f n
    False -> n
    -- where f n = n + 1
    where f = \x -> x + 1
  ```

  b) Rewrite the following to use anonymous lambda syntax:

  ```haskell
  -- addFive x y = (if x > y then y else x) + 5
  addFive = \x -> \y -> (if x > y then y else x) + 5
  ```

  c) Rewrite the following so that it doesn’t use anonymous lambda syntax:

  ```haskell
  -- mflip f = \x -> \y -> f y x
  mflip f x y = f y x
  ```

## Exercises: Variety pack

1. Given the following declarations

  ```haskell
  k (x, y) = x
  k1 = k ((4-1), 10)
  k2 = k ("three", (1 + 2))
  k3 = k (3, True)
  ```

  a) What is the type of k?

  > `k :: (x, y) -> x`

  b) What is the type of k2? Is it the same type as k1 or k3?

  > `k2 :: [Char]`, no it is not the same as k1 or k3

  c) Of k1, k2, k3, which will return the number 3 as the result?

  > k1 and k3 both return 3

2. Fill in the definition of the following function:

  ```haskell
  f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
  f (a, _, c) (d, _, f) = ((a, d), (c, f))
  ```

## Exercises: Case Practice

See [exercises.hs](./exercises.hs)

## Exercises: Artful Dodgy

See [exercises.hs](./exercises.hs)

1. dodgy 1 0

  > 1

2. dodgy 1 1

  > 11

3. dodgy 2 2

  > 22

4. dodgy 1 2

  > 21

5. dodgy 2 1

  > 12

6. oneIsOne 1

  > 11

7. oneIsOne 2

  > 21

8. oneIsTwo 1

  > 21

9. oneIsTwo 2

  > 22

10. oneIsOne 3

  > 31

11. oneIsTwo 3

  > 23

### 7.8 intermission

1. The otherwise matches any argument passed, and forces the avgGrade function to always return an "F" grade.

2. It fails to return correctly. I put `| y >= 0.7 = 'C'` as the first rule
and now it returns C for anything over 70 because that rule catches all.
Basically makes A, B impossible conditions to reach.

Could fix by using ranges, and not relying on order of guards.

---

```
pal xs
  | xs == reverse xs = True
  | otherwise = False
```

3. Returns?

  - (b) True when xs is a palindrome

4. What argument types can `pal` take.

Lists

5. What is the type of function `pal`

`pal :: Eq a => [a] -> Bool`

---

```
numbers x
  | x < 0 = -1
  | x == 0 = 0
  | x > 0 = 1
```

6. Returns?

  - (c) An indication of whether it's argument is a positive or negative number or zero

7. What types of arguments can `numbers` take?

  - Instances of Ord

8. What is the type of `numbers`?

  - `numbers :: (Num a, Ord a, Num b) => a -> b`

### Chapter exercises

**Multiple Choice**

1. A polymorphic function

  - (d) may resolve to values of different types, depending on the inputs.

2. Two functions named f and g have types Char -> String
and String -> [String] respectively. The composed
function g . f has the type

  - (b) Char -> [String]

3. A function f has the type Ord a => a -> a -> Bool and
we apply it to one numeric value. What is the type now?

  - (d) (Ord a, Num a) => a -> Bool

4. A function with the type (a -> b) -> c

  - (b) is a higher order function

5. Given the following definition of f, what is the type of
f True?

```
f :: a -> a
f x = x
```

  - (a) f True :: Bool

**Let's write code**

see [exercises.hs](./exercises.hs)
