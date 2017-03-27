# Exercises 3 - Strings

## Exercises: scope

1. These lines of code are from a REPL session. Is _y_ in scope for _z_?

  Prelude> let x = 5
  Prelude> let y = 7
  Prelude> let z = x * y

  > Yes, y is in scope for z.

2. These lines of code are from a REPL session. Is _h_ in scope for function _g_? Go with your gut here.

  Prelude> let f = 3
  Prelude> let g = 6 * f + h

  > No, h is not in scope.

3. This code sample is from a source file. Is everything we need to execute area in scope?

  ```haskell
  area d = pi * (r * r)
  r = d / 2
  ```

  > No, _d_ is out of scope for _r_.

4. This code is also from a source file. Now are _r_ and _d_ in scope for area?

  ```haskell
  area d = pi * (r * r)
  where r = d / 2
  ```

  > Yes.

## Exercises: Syntax Errors

Read the syntax of the following functions and decide whether it will compile. Test them in your REPL and try to fix the syntax errors where they occur.

1. ++ [1, 2, 3] [4, 5, 6]

  > No, needs parens around the `(++)`

2. '<3' ++ ' Haskell'

  > No, needs `"` double-quotes

3. concat ["<3", " Haskell"]

  > Yes

## Chapter Exercises:

### Reading Syntax

1. For the following lines of code, read the syntax carefully and decide if they are written correctly. Test them in your REPL after you’ve decided to check your work. Correct as many as you can.

  a) concat [[1, 2, 3], [4, 5, 6]]

    > correct

  b) ++ [1, 2, 3] [4, 5, 6]

    > incorrect `(++) [1, 2, 3] [4, 5, 6]`

  c) (++) "hello" " world"

    > correct

  d) ["hello" ++ " world]

    > correct if your goal is to have ["hello world"] for some reason.

  e) 4 !! "hello"

    > incorrect `"hello" !! 4` or `(!!) "hello" 4`

  f) (!!) "hello" 4

    > correct

  g) take "4 lovely"

    > incorrect `take 4 "lovely"`

  h) take 3 "awesome"

    > correct

2. Next we have two sets: the first set is lines of code and the other is a set of results. Read the code and figure out which results came from which lines of code. Be sure to test them in the REPL.

  a) concat [[1 * 6], [2 * 6], [3 * 6]]

  b) "rain" ++ drop 2 "elbow"

  c) 10 * head [1, 2, 3]

  d) (take 3 "Julie") ++ (tail "yes")

  e) concat [tail [1, 2, 3], tail [4, 5, 6], tail [7, 8, 9]]

  Can you match each of the previous expressions to one of these results presented in a scrambled order?

  a) "Jules"

    > d

  b) [2,3,5,6,8,9]

    > e

  c) "rainbow"

    > b

  d) [6,12,18]

    > a

  e) 10

    > c

### Building functions

1. Write expressions for these transformations

  "Curry is awesome" -- "Curry is awesome!"

  ```haskell
  "Curry is awesome" ++ "!"
  ```

  "Curry is awesome!" -- "y"
  ["Curry is awesome" !! 4]

  "Curry is awesome!" -- "awesome!"
  drop 9 "Curry is awesome!"

2, 3, 4, 5, 6. [exercies.hs](./exercises.hs)
