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

## Exercises: Guard Duty

### 7.8 intermission

1. It is probably clear to you why you wouldn’t put an otherwise
in your top-most guard, but try it with avgGrade anyway
and see what happens. It’ll be more clear if you rewrite
it as an actual otherwise match: | otherwise = 'F'. What
happens now if you pass a 90 as an argument? 75? 60?

  ```haskell
  avgGrade :: (Fractional a, Ord a) => a -> Char
  avgGrade x
    | otherwise = 'F'
    | y >= 0.9 = 'A'
    | y >= 0.8 = 'B'
    | y >= 0.7 = 'C'
    | y >= 0.59 = 'D'
    | y < 0.59 = 'F'
    where y = x / 100
  ```

  > The otherwise matches any argument passed, and forces the `avgGrade`
  function to always return an "F" grade.

2. What happens if you take `avgGrade` as it is written and
reorder the guards? Does it still typecheck and work the
same? Try moving | y >= 0.7 = 'C' and passing it the
argument 90, which should be an ‘A.’ Does it return an ‘A’?

  ```haskell
  avgGrade :: (Fractional a, Ord a) => a -> Char
  avgGrade x
    | y >= 0.7 = 'C'
    | y >= 0.9 = 'A'
    | y >= 0.8 = 'B'
    | y >= 0.59 = 'D'
    | y < 0.59 = 'F'
    where y = x / 100
  ```

  > It fails to return correctly. I put `| y >= 0.7 = 'C'` as the first rule
  and now it returns C for anything over 70 because that rule catches all.
  Basically makes A, B impossible conditions to reach.

3. The following function returns

  ```haskell
  pal xs
    | xs == reverse xs = True
    | otherwise = False
  ```

  a) xs written backwards when it’s True  
  b) True when xs is a palindrome  
  c) False when xs is a palindrome  
  d) False when xs is reversed

  > b

4. What argument types can `pal` take.

  > Lists

5. What is the type of function `pal`

  > `pal :: Eq a => [a] -> Bool`

6. The following function returns

  ```haskell
  numbers x
    | x < 0 = -1
    | x == 0 = 0
    | x > 0 = 1
  ```

  a) the value of its argument plus or minus 1  
  b) the negation of its argument  
  c) an indication of whether its argument is a positive or negative number or zero  
  d) binary machine language

  > c

7. What types of arguments can `numbers` take?

  > Instances of Num and Ord

8. What is the type of `numbers`?

  - `numbers :: (Num a, Ord a, Num b) => a -> b`

## Chapter exercises

### Multiple Choice

1. A polymorphic function

  a) changes things into sheep when invoked  
  b) has multiple arguments  
  c) has a concrete type  
  d) may resolve to values of different types, depending on inputs

  > d

2. Two functions named f and g have types Char -> String and String -> [String] respectively.
The composed function g . f has the type

  a) Char -> String  
  b) Char -> [String]  
  c) [[String]]  
  d) Char -> String -> [String]

  > b

3. A function f has the type Ord a => a -> a -> Bool and we
apply it to one numeric value. What is the type now?

  a) Ord a => a -> Bool  
  b) Num -> Num -> Bool  
  c) Ord a => a -> a -> Integer  
  d) (Ord a, Num a) => a -> Bool

  > d

4. A function with the type (a -> b) -> c

  a) requires values of three different types  
  b) is a higher-order function  
  c) must take a tuple as its first argument  
  d) has its parameters in alphabetical order

  > b

5. Given the following definition of f, what is the type of `f True`?

  ```haskell
  f :: a -> a
  f x = x
  ```

  a) f True :: Bool  
  b) f True :: String  
  c) f True :: Bool -> Bool  
  d) f True :: a

  > a

### Let's write code

see [exercises.hs](./exersises.hs)

**Let's write code**

see [exercises.hs](./exercises.hs)
