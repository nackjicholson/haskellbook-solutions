# Chapter 9 Exercises

### 9.7 Intermission

Evaluate where `mySqr = [x^2 | x <- [1..5]]`

`[x | x <- mySqr, rem x 2 == 0]`

  - `[4, 16]`

`[(x, y) | x <- mySqr, y <- mySqr, x < 50, y > 50]`

  - `[]` because there are no `y` values GT 50

`take 5 [ (x, y) | x <- mySqr, y <- mySqr, x < 50, y > 50 ]`

  - `[]` as well, for the same reason...

Given the following:

    Prelude> let mySqr = [x^2 | x <- [1..5]]
    Prelude> let myCube = [x^3 | x <- [1..5]]

1. First write an expression that will make tuples of the outputs of mySqr and myCube.

  - `[(x, y) | x <- mySqr, y <- myCube]`

2. Now alter that function so that it only uses the x and y values that are less than 50.

  - `[(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]`

3. Now apply another function to that list comprehension
to determine how many tuples inhabit your output list

  - `length [(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]`

### 9.8 Intermission

**Will it blow up?**

1. `[x^y | x <- [1..5], y <- [2, undefined]]`

  - Yes, can't evaluate 1^undefined

2. `take 1 [x^y | x <- [1..5], y <- [2, undefined]]`

  - No, returns `[1]`

3. `sum [1, undefined, 3]`

  - Yes, can't add undefined to a number

4. `length [1, 2, undefined]`

  - No, return `3`

5. `length $ [1, 2, 3] ++ undefined`

  - Yes, can't build the list.

6. `take 1 $ filter even [1, 2, 3, undefined]`

  - No, returns `[2]`

7. `take 1 $ filter even [1, 3, undefined]`

  - Yes, blows up because it gets all the way to trying to evaluate `even undefined` before the list can have one item taken from it.

8. `take 1 $ filter odd [1, 3, undefined]`

  - No, returns `[1]`

9. `take 2 $ filter odd [1, 3, undefined]`

  - No, returns `[1, 3]`

10. `take 3 $ filter odd [1, 3, undefined]`

  - Yes, blows up evaluating `odd undefined`

**Is it normal form?**

1. `[1,2,3,4,5]`

  - NF

2. `1 : 2 : 3 : 4 : _`

  - WHNF

3. `enumFromTo 1 10`

  - Neither?

4. `length [1, 2, 3, 4, 5]`

  - Neither?

5. `sum (enumFromTo 1 10)`

  - Neither?

6. `['a'..'m'] ++ ['n'..'z']`

  - Neither

7. `(_, 'b')`

  - WHNF

### 9.9 Intermission

1. Will the following expression return a value or be `⊥`? `take 1 $ map (+1) [undefined, 2, 3]`

  - Bottom `⊥`

2. Will the following expression return a value?
`take 1 $ map (+1) [1, undefined, 3]`

  - Yes `[2]`

3. `take 2 $ map (+1) [1, undefined, 3]`

  - Bottom `⊥`

4. What does the following mystery function do? What
is its type? Describe it (to yourself or a loved one) in standard English and then test it out in the REPL to
make sure you were correct. `itIsMystery xs = map (\x -> elem x "aeiou") xs`

  - I takes a string (AKA list of characters AKA a sentence) and returns a list that indicates whether each char was a vowel. `itIsMystery "foobar" =  [False, True, True, False, True, False]`

5. What will be the result of the following functions:
    - (a) `map (^2) [1..10]`
      - `[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]`
    - (b) `map minimum [[1..10], [10..20], [20..30]]`
      - `[1, 10, 20]`
    - (c) `map sum [[1..5], [1..5], [1..5]]`
      - `[15, 15, 15]`
6. Back in the Functions chapter, you wrote a function
called foldBool. That function exists in a module known
as Data.Bool and is called bool. Write a function that
does the same as this `map (\x -> if x == 3 then (-x) else (x)) [1..10]` but uses bool instead of the
if-then-else syntax.

  - `map (\x -> bool x (-x) (x == 3)) [1..10]`

### 9.10 Intermission

1. Write a filter function that would give us all the
multiples of 3 out of a list from 1-30?

  - `filter (\x -> rem x 3 == 0) [1..30]`
  - `[x | x <- [1..30], rem x 3 == 0]`

2. Compose with length to produce how many multiples of three there are.

  - `(length . (filter (\x -> rem x 3 == 0))) [1..30]`

3. see [exercises.hs](./exercises.hs) `myFilter`

### 9.11 Intermission

see [exercises.hs](./exercises.hs) `myZip`
