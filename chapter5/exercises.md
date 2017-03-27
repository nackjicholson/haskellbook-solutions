# Exercises 5 - Types

## Exercises: Type Matching

Match functions to their type:

1. Functions:

  a) not  
  b) length  
  c) concat  
  d) head  
  e) (<)

2. Type signatures:

  a) _ :: [a] -> a  
  b) _ :: [[a]] -> [a]  
  c) _ :: Bool -> Bool  
  d) _ :: [a] -> Int  
  e) _ :: Ord a => a -> a -> Bool

```haskell
-- (a, c)
not :: Bool -> Bool
-- (b, d)
length :: [a] -> Int
-- (c, b)
concat :: [[a]] -> [a]
-- (d, a)
head :: [a] -> a
-- (e, e)
(<) :: Ord a => a -> a -> Bool
```

## Exercises: Type Arguments

Which type results from application of function?

1. If the type of f is `a -> a -> a -> a`, and the type of 𝑥 is Char then the type of `f x` is

  a) Char -> Char -> Char  
  b) x -> x -> x -> x  
  c) a -> a -> a  
  d) a -> a -> a -> Char

  > a

2. If the type of g is `a -> b -> c -> b`, then the type of `g 0 'c' "woot"` is

  a) String  
  b) Char -> String  
  c) Int  
  d) Char

  > d

3. If the type of h is `(Num a, Num b) => a -> b -> b`, then the type of `h 1.0 2` is:

  a) Double  
  b) Integer  
  c) Integral b => b  
  d) Num b => b  

  > d

4. If the type of h is `(Num a, Num b) => a -> b -> b`, then the type of `h 1 (5.5 :: Double)` is

  a) Integer  
  b) Fractional b => b  
  c) Double  
  d) Num b => b

  > c

5. If the type of jackal is `(Ord a, Eq b) => a -> b -> a`, then the type of `jackal "keyboard" "has the word jackal in it"`

  a) [Char]  
  b) Eq b => b  
  c) b -> [Char]  
  d) b  
  e) Eq b => b -> [Char]

  > a

6. If the type of jackal is `(Ord a, Eq b) => a -> b -> a`, then the type of `jackal "keyboard"`

  a) b  
  b) Eq b => b  
  c) [Char]  
  d) b -> [Char]  
  e) Eq b => b -> [Char]

  > e

  Note: Because the b argument is still unknown, go with generic Eq

7. If the type of kessel is `(Ord a, Num b) => a -> b -> a`, then the type of `kessel 1 2` is

  a) Integer  
  b) Int  
  c) a  
  d) (Num a, Ord a) => a  
  e) Ord a => a  
  f) Num a => a

  > d

  Note: This is tricky, I thought it was e but I see now that because the argument bound to `a` is `1` (which is a `Num`) it is inferred that the return value must be Ord and Num. I think I'm still a bit confused as to why it's not just Num...but the next chapter is typeclasses.

8. If the type of kessel is `(Ord a, Num b) => a -> b -> a`, then the type of `kessel 1 (2 :: Integer)` is

  a) (Num a, Ord a) => a  
  b) Int  
  c) a  
  d) Num a => a  
  e) Ord a => a  
  f) Integer

  > a

  Note: Same reason as 7, they just trying to trick you with the casting of b to Integer.

9. If the type of kessel is `(Ord a, Num b) => a -> b -> a`, then the type of `kessel (1 :: Integer) 2` is

  a) Num a => a  
  b) Ord a => a  
  c) Integer  
  d) (Num a, Ord a) => a  
  e) a

  > c

  Note: It's set as Integer, no more guessing.

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

1.

```haskell
i :: a -> a
i a = a
```

2.

```haskell
c :: a -> b -> a
c a b = a
```

3. Yes I believe so `c'' :: b -> a -> b` is the same signature.

4.

```haskell
c` :: a -> b -> b
c` a b = b
```

5.

```haskell
r :: [a] -> [a]
r (_:xs) = xs
r [] = []
```

6.

```haskell
co :: (b -> c) -> (a -> b) -> (a -> c)
co f g = f . g
```

7.

These exercises are garbage tbh...learning nothing useful

```haskell
a :: (a -> c) -> a -> a
a b c = c
```

8.

```haskell
a' :: (a -> b) -> a -> b
a' f = f
-- or a' f x = f x
```

Again...wtf is this shit? Why am I doing this!!!???!!!

**Fix it**

see sing.hs and arith3broken.hs
