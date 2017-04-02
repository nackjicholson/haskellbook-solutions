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

## Exercises: Parametricity

1. Given the type a -> a, which is the type for id, attempt
to make a function that is not bottom and terminates
successfully that does something other than returning
the same value. This is impossible, but you should try it
anyway.

  > okay

2. We can get a more comfortable appreciation of parametricity
by looking at `a -> a -> a`. This hypothetical
function `a -> a -> a` has two–and only two–implementations.
Write both possible versions of `a -> a -> a`. After
doing so, try to violate the constraints of parametrically
polymorphic values we outlined above.

  ```haskell
  f :: a -> a -> a
  f a b = a

  g :: a -> a -> a
  g a b = b

  -- Trying to violate with any operation on the parameters would
  -- change the type signature to be more specific
  h :: Num a => a -> a -> a
  h a b = a * b
  ```

3. Implement `a -> b -> b`. How many implementations can
it have? Does the behavior change when the types of _a_
and _b_ change?

  > I think there is only this one, and types of the parameters do not have
  any impact

  ```haskell
  f :: a -> b -> b
  f _ b = b
  ```

## Exercises: Apply Yourself

Here the code sample from the book is missing the type signature,
of the function with type inference and I'm filling it in.

1.

  ```haskell
  -- Type signature of general function
  (++) :: [a] -> [a] -> [a]
  -- How might that change when we apply
  -- it to the following value?
  myConcat :: String -> String
  myConcat x = x ++ " yo"
  ```

2.

  ```haskell
  -- General function
  (*) :: Num a => a -> a -> a
  -- Applied to a value
  myMult :: Fractional a => a -> a
  myMult x = (x / 3) * 5
  ```

3.

  ```haskell
  take :: Int -> [a] -> [a]

  myTake :: Int -> String
  myTake x = take x "hey you"
  ```

4.

  ```haskell
  (>) :: Ord a => a -> a -> Bool

  myCom :: Int -> Bool
  myCom x = x > (length [1..10])
  ```

5.

  ```haskell
  (<) :: Ord a => a -> a -> Bool
  myAlph :: Char -> Bool
  myAlph x = x < 'z'
  ```

## Chapter Exercises

### Multiple Choice

1. A value of type [a] is

  a) a list of alphabetic characters  
  b) a list of lists  
  c) a list whose elements are all of some type _a_  
  d) a list whose elements are all of different types

  > c

2. A function of type [[a]] -> [a] could

  a) take a list of strings as an argument  
  b) transform a character into a string  
  c) transform a string in to a list of strings  
  d) take two arguments

  > a

3. A function of type [a] -> Int -> a

  a) takes one argument  
  b) returns one element of type _a_ from a list  
  c) must return an Int value  
  d) is completely fictional  

  > b

4. A function of type (a, b) -> a

  a) takes a list argument and returns a Char value  
  b) has zero arguments  
  c) takes a tuple argument and returns the first value  
  d) requires that _a_ and _b_ be of different types  

  > c

### Determine the type

1. All function applications return a value. Determine the
value returned by these function applications and the type
of that value.

  a) (* 9) 6 :: Num a => a

    > `(* 9) 6 :: Num a => a`

  b) head [(0,"doge"),(1,"kitteh")]

    > `head [(0, "doge"), (1, "kitteh")] :: Num a => (a, [Char])`

  c) head [(0 :: Integer ,"doge"),(1,"kitteh")]

    > `head [(0 :: Integer ,"doge"),(1,"kitteh")] :: (Integer, [Char])`

  d) if False then True else False

    > `if False then True else False :: Bool`

  e) length [1, 2, 3, 4, 5]

    > `length [1, 2, 3, 4, 5] :: Int`

  f) (length [1, 2, 3, 4]) > (length "TACOCAT")

    > `(length [1, 2, 3, 4]) > (length "TACOCAT") :: Bool`

2. Given

  ```haskell
  x = 5
  y = x + 5
  w = y * 10
  ```

  What is the type of w?

  > `w :: Num a => a`

3. Given

  ```haskell
  x = 5
  y = x + 5
  z y = y * 10
  ```

  What is the type of z?

  > `z :: Num a => a -> a`

4. Given

  ```haskell
  x = 5
  y = x + 5
  f = 4 / y
  ```

  What is the type of f?

  > `Fractional a => a`

5. Given

  ```haskell
  x = "Julie"
  y = " <3 "
  z = "Haskell"
  f = x ++ y ++ z
  ```

  What is the type of f?

  > `f :: [Char]``

### Does it compile?

1.

  ```haskell
  bigNum = (^) 5 $ 10
  wahoo = bigNum $ 10
  ```

  > Nope

  ```haskell
  bigNum = (5^)
  wahoo = bigNum 10
  ```

2.

  ```haskell
  x = print
  y = print "woohoo!"
  z = x "hello world"
  ```

  > It compiles

3.

  ```haskell
  a = (+)
  b = 5
  c = b 10
  d = c 200
  ```

  > No, can't apply 10 to b because it is a value not a function

  ```haskell
  a = (+)
  b = 5
  c = a b
  d = c 200
  ```

4.

  ```haskell
  a = 12 + b
  b = 10000 * c
  ```

  > No, c is not in scope

  ```haskell
  a = 12 + b
  b = 10000 * c
  c = 2
  ```

### Type variable or specific type constructor?

1. You will be shown a type declaration, and you should
categorize each type. The choices are a fully polymorphic
type variable, constrained polymorphic type variable, or
concrete type constructor.

  ```haskell
  f :: Num a => a -> b -> Int -> Int
  -- [0] [1] [2] [3]
  ```

  > Here, the answer would be: constrained polymorphic
  (Num) ([0]), fully polymorphic ([1]), and concrete ([2] and
  [3]).

2. Categorize each component of the type signature as described
in the previous example.

  ```haskell
  f :: zed -> Zed -> Blah
  -- [0]      [1]    [1]

  -- [0] A fully polymorphic parameter
  -- [1] Concrete
  -- [2] Concrete
  ```
3. Categorize each component of the type signature

  ```haskell
  f :: Enum b => a -> b -> C
  --            [0]  [1]  [2]

  -- [0] Fully polymorphic
  -- [1] Constrained polymorphic Enum
  -- [2] Concrete
  ```

4.

  ```haskell
  f :: f -> g -> C
  --  [0]  [1]  [2]

  -- [0] Fully polymorphic
  -- [1] Fully polymorphic
  -- [2] Concrete
  ```

### Write a type signature

1.

  ```haskell
  functionH :: [a] -> a
  functionH (x:_) = x
  ```

2.

  ```haskell
  functionC :: Ord a => a -> a -> Bool
  functionC x y = if (x > y) then True else False
  ```

3.

  ```haskell
  functionS :: (a, b) -> b
  functionS (x, y) = y
  ```

### Given a type, write a function

1.

  ```haskell
  i :: a -> a
  i a = a
  ```

2.

  ```haskell
  c :: a -> b -> a
  c x y = x
  ```

3. Given alpha equivalence are c'' and c (see above) the same
thing?

  ```haskell
  c'' :: b -> a -> b
  c'' = ?
  ```

  > Yes, I believe so

4.

  ```haskell
  c' :: a -> b -> b
  c' x y = y
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

  ```haskell
  a :: (a -> c) -> a -> a
  a f x = x
  ```

8.

  ```haskell
  a' :: (a -> b) -> a -> b
  a' f = f
  -- or a' f x = f x
  ```

### Fix it

see [sing.hs](./sing.hs) and [arith3broken.hs](./arith3broken.hs)

### Type-Kwon-Do

see [exercises.hs](./exercises.hs)
