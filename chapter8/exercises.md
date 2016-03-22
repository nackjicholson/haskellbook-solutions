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

  - 
