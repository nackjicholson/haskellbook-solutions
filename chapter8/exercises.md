# Chapter 8 Exercises

### 8.2 intermission

1. Evaluate `applyTimes 5 (+1) 5`

```
applyTimes 5 (+1) 5
  = (+1) . applyTimes (5-1) (+1) $ 5
    (+1) . (+1) . applyTimes (4-1) (+1) $ 5
    (+1) . (+1) . (+1) . applyTimes (3-1) (+1) $ 5        
    (+1) . (+1) . (+1) . (+1) . applyTimes (2-1) (+1) $ 5        
    (+1) . (+1) . (+1) . (+1) . (+1) . applyTimes (1-1) (+1) $ 5
    (+1) . (+1) . (+1) . (+1) . (+1) $ 5
    (+1) . (+1) . (+1) . (+1) $ 6
    (+1) . (+1) . (+1) $ 7
    (+1) . (+1) $ 8
    (+1) $ 9
    10
```

### Chapter Exercises

**Review of types**

1. What is the type of [[True, False], [True, True], [False, True]] ?

  - (d) [[Bool]]

2. Which of the following has the same type as [[True,
False], [True, True], [False, True]]?

  - (b) [[3 == 3], [6 > 5], [3 < 4]]

```haskell
func :: [a] -> [a] -> [a]
func x y = x ++ y
```

3. For the above, which of the following is true?

  - (d) all of the above.

4. For the above, which is a valid application of `func` to both of it's
arguments?

  - (b) func "Hello" "World"

**Reviewing currying**

```haskell
cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"
```

1. What is the value of `appedCatty "woohoo!"`?

  - "woops mrow woohoo!"

2. And for `frappe "1"`?

  - "1 mrow haha"

3. For `frappe (appedCatty "2")`?

  - "woops mrow 2 mrow haha"

4. For `appedCatty (frappe "blue")`?

  - "woops mrow blue mrow haha"

5. For `cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue"))`?

  - "pink mrow haha mrow green mrow woops mrow blue"

6. For `cattyConny (flippy "Pugs" "are") "awesome"`

  - "are mrow Pugs mrow awesome"

**Recursion**

1. Write out the steps for reducing `dividedBy 15 2` to it's final answer?

```haskell
dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n d count
          | n < d = (count, n)
          | otherwise = go (n - d) d (count + 1)
```

```
dividedBy 15 2 =  go 15 2 0
                  go (15-2) 2 1
                  go (13-2) 2 2
                  go (11-2) 2 3
                  go (9-2) 2 4
                  go (7-2) 2 5
                  go (5-2) 2 6
                  go (3-2) 2 7
                  -- 1 < 2 true, so return tuple
                  (7, 1)
```

2. Write a function that recursively sums all numbers from 1 to n, n being
the argument. Sot taht if n was 5 you'd add 1+2+3+4+5 to get 15. The type
should be (Eq a, Num a) => a -> a.

-- see [exercises.hs](./exercises.hs) `sumN`

3. Write a function that multiplies two integral numbers using recursive
summation. The type should be (Integral a) => a -> a -> a

-- see [exercises.hs](./exercises.hs) `multipliedBy`
