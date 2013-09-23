-- Types in Haskell
-- 1) strong
-- 2) static
-- 3) automatically inferred
--
-- Strong typing - type system guarantees that a program cannot contain certain kinds of errors
-- Well typed - an expression that obeys the type rules
-- ill typed - an expression that disobeys the type rules
--
-- no automatic coercion (casting)
-- casting in haskell involves copying
--
-- The strength of a type system refers to how permissive a type system is
-- A weaker type system treats more expressions as valid than a stronger type system
--
-- Static typing - the compiler knows the type of every value and expression at compile time
-- Duck typing - (python) an obj acts enough like another to be considered one
-- Typeclasses - provides some dynamic typing to Haskell
--
-- Strong static typing make type errors at runtime impossible
-- Dynamically typed languages require large test suites to give assurances that type erros cannot occur 
--
-- Type inference - Haskell compiler can deduce the types of all expressions in a program
-- 
-- Common types:
--   Char - unicode character
--   Bool - True and False
--   Int  - signed fixed width integers
--   Integer - signed integer of unbounded size
--   Double  - 64-bit floating point
--
-- Writing types explicitly
--   expression :: MyType
:type 'a'
'a' :: Char 
'a' :: Int 
-- Type Signature - The combination of :: and MyType

-- Function Applicaiton
odd 3
odd 6
-- Dont use parens or commas
compare 2 3
compare 3 3
compare 3 2
-- funciton applicaiton has higher precedence than operators
(compare 2 3) == LT
compare 2 3 == LT
-- sometimes we must use parens to parse a complicated expression
-- if you omit the parens, it looks like you are trying to to pass 
-- four args to compare instead of two
compare (sqrt 3) (sqrt 6)

-- Composites of data types: Lists and Tuples
-- Strings are represented as a list of characters
-- head returns first element of list
head [1,2,3,4]
-- tail returns everything but the head of list
tail [1,2,3,4]
tail "list"
tail []
-- polymorphic - values in a list can have any type
-- type variable - must start with a lower case letter
-- type name - must start with an upper case letter
:type [[True],[False,False]]

-- A tuple is a fixed size collection
-- each value can have a different type
-- A list can have any length, 
-- but all elements must have the same type
:type (1964, "laby")
-- () - tuple of zero elememts
-- The type of () is ()
-- both type and value are pronounced "unit"
-- similar to 'void' in C
:type (False, 'a')
--
:type ["foo","bar"]
:type (["foo","bar"], 'a')
:type [(True, []), (False, [['a']])]
[(Bool,[[Char]])]

-- Functions over lists and tuples









