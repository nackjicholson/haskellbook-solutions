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

  - No, returns `1`

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

  - Neither?

3. `enumFromTo 1 10`

  - Neither?

4. `length [1, 2, 3, 4, 5]`

  - Neither?

5. `sum (enumFromTo 1 10)`

  - Neither?

6. `['a'..'m'] ++ ['n'..'z']`

  - WHNF?

7. `(_, 'b')`

  - WHNF?

If you know the answers here, let me know or make a PR.
This doesn't make sense to me
