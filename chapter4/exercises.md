### 4.2 intermission

```haskell
data Mood = Blah | Woot deriving Show
```

1. What is the type constructor?
Mood

2. If the function requires a `Mood` value what are the values you could possible use there?
`Blah` and `Woot`

3. What's wrong with this signature if we want to change mood. changeMood :: Mood -> Woot

It always returns Woot mood. Also Woot isn't a type, its a value.

4. Fix mistakes:

```haskell
changeMood Mood = Woot
changeMood _ = Blah
```

### 4.4 Intermission

Compile errors fix them.

1. not True && True
2. let x = 6 in not (x == 6)
3. No mistake
4. ["Merry"] > ["Happy"]
5. I don't think I know what to do with this one.

This is the quickest way by just making "1 2 3" a string.

```haskell
"1 2 3 " ++ "look at me!"
```

This is my most complex and tricky way using a fold over an anon lambda to build a string

foldl (\str a -> str ++ show a ++ " ") "" [1, 2, 3] ++ "look at me!"

### Chapter Exercises:

1. length :: [a] -> Int

2.
  a) 5
  b) 3
  c) 2
  d) 5

3. The `Int` type returned by length isn't the `Fractional` type expected by `(/)` operator

4. Using `div` works, because div expects types of `Intergral`, that is integral numbers.

5. Bool, should expect True as result

6. Bool, False
   False

7.
a) True
b) error
c) 5
d) False
e) error

8.
```haskell
-- isPalindrome.hs
module IsPalindrome where

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome list = (list == reverse list)

isPalindromeStr :: [Char] -> Bool
isPalindromeStr str = (stripped == reverse stripped)
  where stripped = filter (/=' ') str
```

9.

```haskell
myAbs :: Integer -> Integer
myAbs x =
  if x >= 0
    then x
  else
    (-x)
```

10.

```haskell
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))
```

### Reading Syntax

Fix 'em:

1.
```haskell
x = (+)

f xs = w `x` 1
  where w = length xs
```

2.
`id x = x`

3.

`(\(x:xs) -> x)`

4.

`f (a, b) = a`

Match function name to their types

1. c
2. b
3. a
4. d
