intermission:

1. 8 + 7 * 9, not the same as (8  + 7) * 9
2. is the same
3. different

2.6:

1. let area x = 3.14 * (x * x)
2. let double x = x * 2
3.

```haskell
x = 7
y = 10
f = x + y
```

2.12 let and where

1. let x = 5 in x
5
2. let x = 5 in x * x
25
3. let x = 5; y = 6 in x * y
30
4. let x = 3; y = 1000 in x + 3
Tricky! it's 6

Write the `let` expressions into declarations with `where` clauses:

1. let x = 3; y = 1000 in x * 3 + y

x * 3 + y
  where x = 3
        y = 1000

2. let y = 10; x = 10 * 5 + y in x * 5

x * 5
  where y = 10
        x = 10 * 5 + y

3. let x = 7; y = negate x; z = y * 10 in z / x + y

z / x + y
  where x = 7
        y = negate x
        z = y * 10

Rewrite this code for the repl

```haskell
z = 7
x = y ^ 2
waxOn = x * 5
y = z + 8
```

I think it will b (15 ^ 2) * 5

for repl

let z = 7
let y = z + 8
let x = y ^ 2
let waxOn = x * 5

10 + waxOn
-- 1135

(+10) waxOn
-- 1135

(-) 15 waxOn
-- -1110

(-) waxOn 15
-- 1110
