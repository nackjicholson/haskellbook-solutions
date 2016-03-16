# Chapter 5 Exercises

### 5.4 Intermission

not :: Bool -> Bool
length :: [a] -> Int
concat :: [[a]] -> [a]
head :: [a] -> a
(<) :: Ord a => a -> a -> Bool

### 5.5 Intermission

1. If the type of `f` is `a -> a -> a -> a` and the type of `x` is `Char`, then
the type of `f x` is:
  - (a) `Char -> Char -> Char`

2. If the type of `g` is `a -> b -> c -> b` then the type of `g 0 'c' "woot"` is:
  - (d) `Char`

3. If the type of `h` is `(Num a, Num b) => a -> b -> b` then the type of `h 1.0 2` is:
  - (d) `Num b => b` -- I had to write code to get this, I kind of thought it would be `Integer`

4. If the type of `h` is `(Num a, Num b) => a -> b -> b` then the type of
`h 1 (5.5 :: Double)` is:
  - (c) `Double`

5. If the type of `jackal` is `(Ord a, Eq b) => a -> b -> a` then the type of `jackal "keyboard" "has the word jackal in it"`
  - (a) `[Char]`

6. If the type of `jackal` is `(Ord a, Eq b) => a -> b -> a` then the type of
`jackal "keyboard"`
  - (e) `Eq b => b -> [Char]`

7. If the type of `kessel` is `(Ord a, Num b) => a -> b -> a`, then the type of
`kessel 1 2` is:
  - (e) `(Num a, Ord a) => a`

8. If the type of `kessel` is `(Ord a, Num b) => a -> b -> a`, then the type of
`kessel 1 (2 :: Integer)` is:
  - (e) `(Num a, Ord a) => a`

9. If the type of `kessel` is `(Ord a, Num b) => a -> b -> a`, then the type of
`kessel (1 :: Integer) 2` is:
  - (c) `Integer`

### 5.6 Intermission

2.

```haskell
foo :: a -> a -> a
foo a b = a
foo a b = b
```

3.

```haskell
foo :: a -> b -> b
foo a b = b
foo _ b = b
```

### 5.7 intermission

1. `myConcat :: [Char] -> [Char]`
2. `myMult :: Fraction a => a -> a`
3. `myTake :: Int -> [Char]`
4. `myCom :: Int -> Bool`
5. `myAlph :: Char -> Bool`

### Chapter exercises

**Multiple Choice**

1. A value of type [a] is:
  - (c) a list whose elements are all of some type `a`
2. A function of type [[a]] -> [a] could: 
  - (a) take a list of strings as an argument
3. A function of type [a] -> Int -> a
  - (b) returns one element of type `a` from a list
4. A function of type (a, b) -> a
  - (c) takes a tuple argument and returns the first value

**Determine the type**

1. All function application return a value. Determine the value returned by these function applications and the type of that value.
  - (a) `(*9) 6` returns 54, with type `Num a => a`
  - (b) `head [(0,"doge"),(1,"kitteh")]` returns (0, "doge") of type `Num t => (t, [Char])`
  - (c) `head [(0 :: Integer,"doge"),(1,"kitteh")]` return (0 :: Integer, "doge") of type `(Integer, [Char])`
  - (d) `if False then True else False` return False type `Bool`
  - (e) `length [1, 2, 3, 4, 5]` returns 5 type `Int`
  - (f) `(length [1, 2, 3, 4]) > (length "TACOCAT")` return False `Bool`

2.

```haskell
x = 5
y = x + 5
w = y * 10
```

What is the type of `w`?
It is `Num a => a`

3.

```haskell
x = 5
y = x + 5
z y = y * 10
```

What is the type of z?
It is `Num a => a -> a`

4.

```haskell
x = 5
y = x + 5
f = 4 / y
```

What is the type of f?
It is `Fractional a => a`

5.

```haskell
x = "Julie"
y = " <3 "
z = "Haskell"
f = x ++ y ++ z
```

What is the type of f?
It is `[Char]`

**Does it compile?**

1. Nope, I just would say do `wahoo = bigNum`
2. I think it compiles
3. Nope.

```haskell
a = (+)
b = 5
c = a b 10
d = a c 200
```

4. Nope `c` is not in scope

**Type variable or specific type constructor?**

2. 

```haskell
f :: zed -> Zed -> Blah
--   [0]    [1]    [2]
```

[0] `zed` is a fully polymorphic type variable
[1] `Zed` is concrete
[2] `Blah` is concrete

3.

```haskell
f :: Enum b => a -> b -> C
--             [0]  [1]  [2]
```

[0] `a` is fully polymorphic
[1] `b` is constrained polymorphic
[1] `C` is concrete

4.

```haskell
f :: f -> g -> C
--   [0]  [1]  [2]
```

[0] is fully polymorphic???
[1] is fully polymorphic
[2] is concrete

**Write a type signature**

1.

```haskell
functionH :: [a] -> a
functionH (x:_) = x
```

2.

```haskell
functionC :: (Ord a) => a -> a -> Bool
functionC x y = if (x > y) then True else False
```

3.

```haskell
functionS :: (a, b) -> b
functionS (x, y) = y
```

**Given a type, write a function**
