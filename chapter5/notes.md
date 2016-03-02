# Types

Values (results of expressions) that share something in common. Types are like
sets in mathematics. Sometimes the thing in common is abstract, sometimes its
a specific model of a concept or domain.

Type Constraints

You can have two types on one variable.

(Num a, Ord a) => a -> Ordering

### 5.6 Polymorphism

"Made of many forms"

Constrained Polymorphism (ad-hoc)

Implemented in Haskell by Type classes.

Parametric polymorphism is when you have a parameter that is fully polymorphic
The concrete type could be anything.

Constrained polymorphism actually increases what you can do by decreasing the
number of concrete types input can be, but bringing under a definition and scope
of operations.

```haskell
id :: a -> a
```

identity function is Parametric polymorphism

Nothing can be done to `a` it just can be returned, because you can't make anything
assumptions about what it is.

However, `negate` has a similar type signature

```haskell
negate :: Num a => a -> a
```

But that means that something can happen to a as long as the return type is unchanged.
That type signature allows for much more to be done to a. That is the type signature for a lot
of functions that operate on numbers. In the case of `negate` the number is turned
into a negative number, a simple, but pretty significant change.
