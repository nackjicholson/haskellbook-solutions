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
