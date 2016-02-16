3.3 intermission

1. y is in scope
2. no h is not in scope

3.4 intermission

1. ++ [1, 2, 3] [4, 5, 6] No, needs parens around operator (++)
2. '<3' ++ ' Haskell' No, because it needs double quote strings.
"<3" ++ " Haskell"
3. concat ["<3", " Haskell"] yes

Exercises:

1. Correct if needed, run in REPL

a) concat [[1,2,3], [4,5,6]]
correct

b) Needs parens around ++
(++) [1, 2, 3] [4, 5, 6]

c) (++) "hello" " world!"
correct

d) all sorts of wrong, don't know what they are trying to do. Maybe this...a list with a string inside
["hello" ++ " world!"]

e) should be reversed to "hello" !! 4

f) correct

g) should be take 4 "lovely"

h) correct


2.

a -- d
b -- c
c -- e
d -- a
e -- b

3.

Write expressions for these transformations

"Curry is awesome" -- "Curry is awesome!"

```hs
"Curry is awesome" ++ "!"
```

"Curry is awesome!" -- "y"
["Curry is awesome" !! 4]

"Curry is awesome!" -- "awesome!"
drop 9 "Curry is awesome!"
