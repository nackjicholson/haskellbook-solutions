
## Parenthesization

1. 2 + 2 * 3 - 1

  `2 + (2 * 3) - 1`
  `7`

2. (^) 10 $ 1 + 1

  `10 ^ (1 + 1)`
  `100`

3. 2 ^ 2 * 4 ^ 5 + 1

  `(2 ^ 2) * (4 ^ 5) + 1`
  `4097`


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
