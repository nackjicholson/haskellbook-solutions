# Exercises 4

## Exercises: Mood Swing

```haskell
data Mood = Blah | Woot deriving Show
```

1. What is the type constructor?

  > `Mood`

2. If the function requires a `Mood` value what are the values you could possible use there?

  > `Blah` and `Woot`

3. What's wrong with this signature if we want to change mood. `changeMood :: Mood -> Woot`

  > Woot is not a Type constructor and cannot be used in a function signature `changeMood :: Mood -> Mood`

4. Now we want to write the function that changes his mood. Given an input mood, it gives us the other one. Fix any mistakes and complete the function:

  ```haskell
  changeMood Mood = Woot
  changeMood _ = Blah
  ```

  Fix:

  ```haskell
  changeMood :: Mood -> Mood
  changeMood Blah = Woot
  changeMood Woot = Blah
  ```

5. [changeMood.hs](./changeMood.hs)

## Exercises: Find the mistakes

The following lines of code may have mistakes — some of them won’t compile! You know what you need to do.

1. not True && true

  > `not (True && True)`

2. not (x = 6)

  > `let x = 5 in not (x == 6)`

3. (1 * 2) > 5

  > is okay

4. [Merry] > [Happy]

  > Either define a datatype that has Merry and Happy as types that are instances of Ord, or do:
  >
  > `["Merry"] > ["Happy"]`

5. [1, 2, 3] ++ "look at me!"

  I don't think I know what to do with this.

  ```haskell
  "1 2 3 " ++ "look at me!"
  ```
  This is my most complex and tricky way using a fold over an anon lambda to build a string from the [1, 2, 3] list of Integers

  ```haskell
  let countIn = foldl (\str a -> str ++ show a ++ ", ") "" [1, 2, 3] in concat [countIn, "look at me!"]
  ```

## Chapter Exercises

In scope:

```haskell
awesome = ["Papuchon", "curry", ":)"]
alsoAwesome = ["Quake", "The Simons"]
allAwesome = [awesome, alsoAwesome]
```

`length` is a function that takes a list and returns a result that tells how many items are in the list.

1. Given the definition of length above, what would the type signature be? How many arguments, of what type does it take? What is the type of the result it evaluates to?

  > `length :: Foldable t => t -> Int`
  >
  > It takes 1 argument, a list / Foldable. And it evaluates to an Int

2. What are the results of the following expressions?

  a) length [1, 2, 3, 4, 5]

    > 5

  b) length [(1, 2), (2, 3), (3, 4)]

    > 3

  c) length allAwesome

    > 2

  d) length (concat allAwesome)

    > 5

3. Given what we know about numeric types and the type signature of length, look at these two expressions. One works and one returns an error. Determine which will return an error and why.

  ```
  Prelude> 6 / 3
  -- and
  Prelude> 6 / length [1, 2, 3]
  ```

  > The second fails, because `(/)` works on Fractional types and Int is not that.
  >
  > Though, I'm not really sure why `(/)` takes 3, it must be able to convert it to a Fractional type because it's type isn't explicitly set.

4. How can you fix the broken code from the preceding
exercise using a different division function/operator?

  > `div 6 (length [1, 2, 3])`

5. What is the type of the expression 2 + 3 == 5? What would we expect as a result?

  > `Bool`, `True`

6. What is the type and expected result value of the following:

  ```
  Prelude> let x = 5
  Prelude> x + 3 == 5
  ```

  > type is `Bool`, and the value is `False`

7. Below are some bits of code. Which will work? Why or why not? If they will work, what value would these reduce to?

  ```
  Prelude> length allAwesome == 2
  True

  Prelude> length [1, 'a', 3, 'b']
  Error, list with different types

  Prelude> length allAwesome + length awesome
  5

  Prelude> (8 == 8) && ('b' < 'a')
  False

  Prelude> (8 == 8) && 9
  Error 9 isn't a Bool
  ```
8, 9, 10: [exercises.hs](./exercises.hs)

### Correcting Syntax

1. Here, we want a function that adds 1 to the length of a string argument and returns that result.

  ```haskell
  x = (+)

  F xs = w 'x' 1
  where w = length xs
  ```

  Corrected:

  ```haskell
  x = (+)

  f xs = w `x` 1
    where w = length xs
  ```

2. This is supposed to be the identity function, id.

  `\ X = x` to `\x -> x`

3. When fixed, this function will return 1 from the value [1, 2, 3]. Hint: you may need to refer back to the section about variables conventions in “Hello Haskell” to refresh your memory of this notation.

  `\ x : xs -> x`

  to:

  `\(x:xs) -> x`

4. When fixed, this function will return 1 from the value (1, 2).

  `f (a b) = A` to `f (a, _) = a` or `f = fst`

### Match the function names to their types

1. Which of the following types is the type of show?

  a) show a => a -> String  
  b) Show a -> a -> String  
  c) Show a => a -> String

  > c

2. Which of the following types is the type of (==)?

  a) a -> a -> Bool  
  b) Eq a => a -> a -> Bool  
  c) Eq a -> a -> a -> Bool  
  d) Eq a => A -> Bool

  > b

3. Which of the following types is the type of `fst`?

  a) (a, b) -> a  
  b) b -> a  
  c) (a, b) -> b

  > a

4. Which of the following types is the type of (+)?

  a) (+) :: Num a -> a -> a -> Bool  
  b) (+) :: Num a => a -> a -> Bool  
  c) (+) :: num a => a -> a -> a  
  d) (+) :: Num a => a -> a -> a  
  e) (+) :: a -> a -> a

  > d
