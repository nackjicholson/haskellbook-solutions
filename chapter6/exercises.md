# Chapter 6 Exercises

### 6.5 intermission

I think they take two integral numbers and try to divide the first by the
second yeilding a tuple of how many times the second number goes into the first
and a second number which is the remainder of the operation.

The example function `ones` always divides the given number `x` by 10, and
the `snd` function is used to pull the remainder which when you divide by ten
is the value of the "ones" place value.

### 6.7 intermission

Do they work, what's the return, why?

1. `max (length [1, 2, 3]) (length [8, 9, 10, 11, 12])`
Returns, `5 :: Int`

2. `compare (3 * 4) (3 * 5)`, returns `LT`

3. `compare "Julie" True`, error because the args are not of same type, it
will expecte `True` to be a string because the first argument was a string.

4. `(5 + 3) > (3 + 6)`, returns `False`

### Chapter Exercises

**Multiple Choice**

1. The `Eq` class: (c) makes equality checks possible
2. The `Ord` class: (b) is a subclass of `Eq`
3. Suppose the typeclass `Ord` has operator `>`, what is it's type?
  - (a) `Ord a => a -> a -> Bool`
4. In `x = divMod 16 12`: (c) the type of x is a tuple
5. The typeclass `Integral` includes: (a) `Int` and `Integer` numbers

**Does it typecheck**

see exercises.hs


**Given a datatype declaration, what can we do?**

see exercises.hs

**Match the types**

2.
```
f :: Float
f = 1.0
```

alt: `f :: Num a => a`

You can't interchange these type signatures because Num doesn't have an instance
of Fractional, but float does.

3.
```
f :: Float
f = 1.0
```

alt: `f :: Fractional a => a`

Yes.

4.
```
f :: Float
f = 1.0
```

alt: `f :: RealFrac a => a`

I think so, don't know what RealFrac is, but I imagine it's a real Fractional
number that implements Fractional as a subclass.

Yes it does work.

5.
```
freud :: a -> a
freud x = x
```

alt: `freud :: Ord a => a -> a`

Yes, it's just a version of the identity function constrained to Ord

6.
```
freud :: a -> a
freud x = x
```

`freud :: Int -> Int`

Yes, I think same thing, identity constrained to concrete type Int

7.
```
myX = 1 :: Int

sigmund :: Int -> Int
sigmund x = myX
```

alt: `sigmund :: a -> a`

No, because `myX` is always `Int` and that means if you pass in a non int,
this would not typecheck.

8.
```
myX = 1 :: Int

sigmund :: Int -> Int
sigmund x = myX
```

alt: `sigmund :: Num a => a -> a`

I still think this is a no, for the same reason. You could pass any type of
Num and then it would be expecting that type back, but it would always return
an Int.

9.
```
jung :: Ord a => [a] -> a
jung xs = head (sort xs)
```

alt: `jung :: [Int] -> Int`

Yes. Int has Ord

10.
```
young :: [Char] -> Char
young xs = head (sort xs)
```

alt: `young :: Ord a => [a] -> a`

Yes.

11.
```
mySort :: [Char] -> [Char]
mySort = sort
signifier :: [Char] -> Char
signifier xs = head (mySort xs)
```

alt: `signifier :: Ord a => [a] -> a`

No because using `mySort` is constrained to `[Char]`

**Type-Kwon-do**

see exercises.hs
