-- Types in Haskell
-- 1) strong
-- 2) static
-- 3) automatically inferred
--
-- Strong typing - type system guarantees that a program 
--                 cannot contain certain kinds of errors
-- Well typed - an expression that obeys the type rules
-- ill typed - an expression that disobeys the type rules
--
-- no automatic coercion (casting)
-- casting in haskell involves copying
--
-- The strength of a type system refers to how permissive a type system is
-- A weaker type system treats more expressions as valid than a stronger type system
--
-- Static typing - the compiler knows the type of every
--                 value and expression at compile time
-- Duck typing - (python) an obj acts enough like another to be considered one
-- Typeclasses - provides some dynamic typing to Haskell
--
-- Strong static typing make type errors at runtime impossible
-- Dynamically typed languages require large test suites 
-- to give assurances that type erros cannot occur 
--
-- Type inference - Haskell compiler can deduce the types of
--                  all expressions in a program
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
take 2 [1,2,3,4,5]
drop 3 [1,2,3,4,5]

-- for tuples, return first element of a pair
fst (1, 'a')

-- for tuples, return second element of a pair
snd (1, 'a')

-- type signuature only defined for pairs
:type snd

-- tuples arent immutable lists, unlike python
-- passing an expression to a function
-- function application is left associative:
--   a b c d == (((a b) c ) d )
head ( drop 4 "azerty" )

-- Function types and purity
-- read the '->' as "to", or "returns"
:type lines
-- signature reads: "lines has the type string to list-of-strings"
lines "the quick\nbrown fox\njumps"
-- side effects introduce dependencies btw the global state
-- and the behavior of a function
-- side effects are essentially invisible inputs to or ouputs from funcitons 
--
-- Pure Functions - a function that does not have side effects
--                  the result of a function depends only on the inputs
--                  we explicitly provide
-- impure function type signature begins with 'IO'
:type readFile


-- Haskel source files and writing simple functions
:load add.hs
add 1 2

-- change working directory
:cd /tmp

-- a Haskell function is a single expression, 
-- not a sequence of statements 
-- There is no 'return' keyword

-- '=' symbol represents "meaning"
-- the name on the left is defined to be the expression on the right


-- Just what is a variable anyway
-- a variable gives a name to an expression
-- In Haskell, once a variable is bound to an expression,
-- it will not change.

-- in Assign.hs
x = 10
x = 11
-- results in an error
-- we cannot assign a value twice to 'x'

-- Conditional Evaluation
drop 2 "foobar"
drop 4 "foobar"
drop 4 [1,2]
drop 0 [1,2]
drop 7 []
drop (-2) "foo"

:type null
:type (||)

:{
myDrop n xs = if n <= 0 || null xs
              then xs
              else myDrop (n-1) (tail xs)
:}

-- operators are ordinary functions
-- || short circuits:
--   if the left evaluates to true, 
--   the right doesnt evaluate

-- Lazy Evaluation

let isOdd n = mod n 2 == 1
:type isOdd

isOdd (1+2)
-- Strict evaluation - the arguments to a function are evaluated 
--                     before the funciton is applied
-- non-strict (lazy) evaluation - a promise that when the value of
--                     an argument is needed, we'll compute it
-- thunk - the record to keep track of unevaluated expressions

print (myDrop 2 "abcd")

:type 2<=0 || null "abcd"

-- (||) short circuit is a result of lazy evaluation
let newOr a b = if a then a else b
newOr True (length [1..] > 0) 

-- Polymorphism in Haskell
last [1,2,3]
last "baz"
:type last
-- type variables always start with a lower case letter
-- variables of types and functions exists in separate contexts
--   types live in type signatures
--   variables live in normal expressions
-- It is common in Haskell practice to keep type var short, one letter
--
-- Polymorphic - when a funciton has a type variable in its signature
-- Parametric polymorphism - similar to templates in C++
-- Not in Haskell:
--   Subtype polymorphism - C++/Java subclassing mechanism
--   Coercion polymorphism - automatic conversion btw types

-- Reasoning about polymorphic functions
:type fst
fst :: (a,b) -> a
-- the argument contains two type variables, 'a' and 'b'
-- signifying that the elements can be of different types

-- The type of a function of more than one argument
:type take
-- '->' is right associative
take :: Int -> ([a] -> [a])
-- read the type signature as a function that takes one argument,
-- an Int and returns another function
-- That other function takes a list argument and returns a list
-- of the same type






