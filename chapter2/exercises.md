# Exercises 2 - Hello, Haskell!

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

## Equivalent expressions

1. 1 + 1

  2

  equivalent

2. 10 ^ 2

  10 + 9 * 10

  equivalent 100

3. 400 - 37

  (-) 37 400

  not equivalent

4. 100 `div` 3

  100 / 3

  not equivalent

5. 2 * 5 + 18

  2 * (5 + 18)

  not equivalent

## More fun with functions

REPL THIS:

``` haskell
z = 7
x = y ^ 2
waxOn = x * 5
y = z + 8
```

`let z = 7; y = z + 8; x = y ^ 2; waxOn = x * 5 in waxOn`

Or

```
λ: let z = 7
λ: let y = z + 8
λ: let x = y ^ 2
λ: let waxOn = x * 5
```

1. What happens with:

  10 + waxOn `1135`
  (+10) waxOn `1135`
  (-) 15 waxOn `-1110`
  (-) waxOn 15 `1110`

2. let triple x = x * 3

3. triple waxOn `3375`

4, 5, 6, 7. [practice.hs](./practice.hs)
