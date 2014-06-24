-- # Introduction 
--  
-- * imperative languages
--   * computes by a sequence of tasks, changing state
--   * control flow structures for looping
-- * functional progamming
--   * compute by telling what stuff is
--   * functions have no side effects - functions can only calculate inputs and return a result
-- * **referencial transparency** - if a function is called twice with the same parameters, it will always returns the same result
-- * **lazy** - wont execute functions unless forced to show a result
-- * **statically typed** - type is known at compile time
--   * lots of errors caught at compile time
-- * **type inference** - dont have to explicitly label every piece of code with a type

-- interactive mode
ghci 

-- load functions
:l myfunctions

-- reload current script
:r 

-- # Starting out
http://learnyouahaskell.com/starting-out

-- **succ** - returns its successor

succ 8 + max 1 2 + 10

:type max

-- backtick infix notation for two parameter functions
div 83 12
83 `div` 12

:l baby

-- the 'else' is mandatory 
if x > 100 then x else 2*x

-- apostrophe isnt used in syntax, is a valid character
--   * can denote strict version of function (one thats not lazy)
--   * or a slightly modified version of a function/variable
-- functions can't begin with uppercase letters
-- when a fuction doesn't take any parameters it's usually called a **definition** or **name**
connanO'Brien = "Hello World"

--
-- Intro to Lists
--

-- Lists are **homogeneous** data structures
lostNumbers = [3,'a',5]

-- concatenate with ++
-- (needs to iterate thru the whole list on the lhs, slow)
x = "hello" ++ " world"

-- cons operator :
x = 'a' : " small cat"
x = 4 : [1,3,4]
x = 1 : 2 : 3 : []

-- element by index !!
x = "hello world" !! 1

-- comparison is element wise
x = [1,2,3] > [0,1,2]
x = [1,2,3] > [0,1]

-- take first element: head
x = head [3,4,5]

-- delete first element: tail
x = tail [3,4,5]

-- take last element: last
x = last [3,4,5]

-- delete last element: init
x = init [3,4,5]

-- 'head' + 'tail' == 'init' + 'last'

-- size of list: length
x = length [3,4,5]

-- check if list empty: null
x = null []
x = null [3,4,5]

-- reverse list
x = reverse [3,4,5]

-- sublist from begining: take
x = take 8 [3,4,5]
x = take 2 [3,4,5]
x = take 0 [3,4,5]

-- remove from begining: drop
x = drop 8 [3,4,5]
x = drop 2 [3,4,5]
x = drop 0 [3,4,5]

-- sum
x = sum [3,4,5]

x = product [3,4,5]

-- test if element in list: elem
x = 3 `elem` [3,4,5]
x = elem 3 [3,4,5]

-- ranges
[3..9]
['a'..'d']
[4,8..19]

-- decrement range
[30,28..1]

-- floating point ranges arent precise
[0.1, 0.3 .. 1]

-- lazy evaluation with infinite lists
take 24 [13,26..]

-- cycle for lists
take 11 ( cycle [3,2,1] )
take 30 ( cycle "HELLO " )

-- repeat for elements
take 10 ( repeat 8 )

-- replicate 
replicate 10 8


--
-- List comprehension
-- [ function | input set, predicate ]
[x*2 | x <- [1..10]]

-- S = { 2x | x elem N, x >= 12 }
[x*2 | x <- [1..10], x*2 >= 12 ]

-- weeding out lists by predicates is also called **filtering**
[x | x <- [50..100], x `mod` 7 == 3 ]

let boomBangs xs = [ if x < 10 then "boom" else "bang" | x <- xs, odd x ]

boomBangs [1..20]

-- can include several predicates
[ x | x <- [10..20], x /= 13, x /= 15]

-- can include multiple input lists, returns their product
[ x * y | x <- [1,2,3], y <- [1,1,1] ]

[ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50 ]

-- list comprehension with strings
let nouns = ["hobo", "frog", "pope"]
let adjs = ["lazy","grouchy","scheming"]
[adj ++ " " ++ noun | adj <- adjs, noun <- nouns ]

-- length thru list comprehension
-- underscore means element not attached to name
let length' xs = sum [ 1 | _ <- xs ]

length' [1..101]

-- for strings
let removeNonUppercasee st = [ c | c <- st, elem c ['A'..'Z'] ]

removeNonUppercasee "I dont LIKE FROGS"

-- removing odd numbers without flattening the list
let xxs = [[1,3,5], [1,2,3], [1,2,4]]
[ [ x | x <- xs, even x ] | xs <- xxs ]

--
-- Tuples
--

-- lists are of the same type with unlimited elements
-- the type of tuples depends on 
--   * the number of elements in the tuple
--   * the type of each element

-- a tuple of size two is its own type
[ (1,2), (8,11), (4,5)]

-- type mismatches:
[ (1,2), (8,39,11), (4,5)]
[ (1,2), ("one",11), (4,5)]

-- singleton tuples dont make sense
(1)

-- take a pair and return the first component: fst 
fst (9,11)

-- take a pair and return the second component: snd
snd ( "wow" , False )

-- combine lists into a list of tuples: zip
zip [1..5] ["o", "t", "h", "f", "i" ] 

-- using lazy eval, can zip infinite lists with finite ones
zip [1..] ["apple", "orange", "cherry", "mango" ]

-- the set of all integer triangles smaller than 10
let triangle = [ (a,b,c) | c <- [1..10] , b <- [1..10], a <- [1..10] ]

-- the set of all right triangles
let rightTriangle = [ (a,b,c) | c <- [1..10] , b <- [1..10], a <- [1..10], a^2 + b^2 == c^2 ]

-- the set of all right triangles with perimeter 24
let rightTriangle = [ (a,b,c) | c <- [1..10] , b <- [1..10], a <- [1..10], a^2 + b^2 == c^2, a+b+c==24 ]

--------------------------------------------------------------------------------
-- 3. Types and Typeclasses
--------------------------------------------------------------------------------
-- static typing - type is know at compile time
-- type inference - infer type without it explicitly declared
:t 'a'
:t True
:t "Hellow"
:t (True, 'a')
:t 4 == 5
-- :: is read as "has type of"
:t ('a','b', 'c')

-- it is a good practice to give functions explicit type declarations
-- maps from string to string
removeNonUppercase :: [Char] -> [Char]
let removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
:t removeNonUppercase

-- function type with multiple parameters
-- there is no distinction between parameters and return type
addThree :: Int -> Int -> Int -> Int
let addThree x y z = x + y + z
:t addThree

-- Int is bounded
-- Integer is unbounded, but not efficient
factorial :: Integer -> Integer
let factorial n = product [1..n]
factorial 9898

-- floating precision
circumference :: Float -> Float
let circumference r = 2 * pi * r
circumference 4.0

-- double precision
circumference' :: Double -> Double
let circumference' r = 2 * pi * r
circumference' 4.0

-- Bool - True or False
-- Char - a single character in single quotes 
-- String - list of characters
-- () - empty tuple is also a type, whose sole value is ()

-- 
-- Type Variables
--
:t head
head :: [a] -> a
-- types can only be writen in capital case
-- type variables are not in capital case
-- a type variable can be of any type
-- **polymophic functions** - Functions that have type variables
:t fst 

-- 
-- Typeclasses 
--
-- typeclass - an interface that describes some behaviour
:t (==)
(==) :: (Eq a) => a -> a -> Bool
-- class constraint => type
-- the type must be a member of the Eq class
--
-- The Eq typeclass provides a interface for equality testing: == and /=
:t elem
-- For comparison functions, types that have ordering: Ord
:t (>)
(>) :: Ord a => a -> a -> Bool
"Aba" > "Bab"
"Aba" < "Bab"
-- take to Ord members and returns an ordering: compare
compare 5 4
2 `compare` 4
-- present as strings: Show
show 3
-- opposite of show, takes a string and returns a type: read
read "True" || False
read "4" + 2
:t read
read :: (Read a) => String -> a
-- explicity state return type - type annotations 
read "4" :: Int
read "4" :: Float
read "[1,2]" :: [Int]
read "(3, 'a')" :: (Int, Char)
-- Sequentially ordered types: Enum
['a'..'e']
succ 'B'
-- upper and lower bounds: Bounded 
minBound :: Int
maxBound :: Char
-- members of the Bounded typeclass are polymophic constants
:t maxBound
maxBound :: Bounded a => a
-- numeric typeclass: Num
:t 20
20 :: Num a => a
20 :: Int
20 :: Float
-- the type of * accepts all numbers
:t (*)
(*) :: Num a => a -> a -> a
-- type error:
(4 :: Int) * (4 :: Integer)
-- Int and Integer: Integral typeclass
-- Float and Double : Floating typeclass
-- take an integral number and turn it into a general number
:t fromIntegral
fromIntegral :: (Integral a, Num b) => a -> b
fromIntegral ( length [1,2,3]) + 4.2

--------------------------------------------------------------------------------
-- 4. Syntax in Functions
--------------------------------------------------------------------------------
-- Pattern Matching
--
-- patterns are checked from top to bottom
-- specifiy more specific ones first 
-- then more general ones laters
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY SEVEN"
lucky x = "no luck" 
lucky 1
lucky 7
-- patterns avoid if/else trees
sayMe :: (Integral a) => a -> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe 3 = "Three"
sayMe x = "Not btw 1 and 3"
-- define factorial recursively
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)
-- pattern matching can fail without a catch-all
charName :: Char -> String
charName 'a' = "allison"
charName 'b' = "Broseth"
charName 'c' = "Cecil"
-- charName 'z': Non-exhaustive patterns ...
-- pattern matching on tuples
addVectors :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors a b = (fst a + fst b, snd a + snd b)
addVectors (x1, y1) (x2, y2) = (x1+x2, y1+y2)
-- extracting from 3-tuples
first :: (a,b,c) -> a
first (x, _, _) = x
second :: (a,b,c) -> b
second (_, y, _) = y
third :: (a,b,c) -> c
third (_,_,z) = z
-- pattern match in list comprehension
let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
[a+b | (a,b) <- xs ]
-- implement 'head' using pattern matching
-- [1,2,3] is equivalent to 1:2:3:[]
-- x:xs matches head to rest of list
-- x:y:z:zs matches the first three elements with the rest of the list
-- ':' matches lists of length one or more
head' ::  [a] -> a
head' [] = error "empty list"
head' (x:_) = x
-- tell first elements of list
tell :: (Show a) => [a] -> String
tell [] = "empty list"
tell (x:[]) = "one elememnt: " ++ show x
tell (x:y:[]) = "two elems: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "many elems. " ++ show x ++ " and " ++ show y
-- 'length' through pattern matching and recursion
length' :: (Num b) => [a] -> b
length' [] = 0 
length' (_:xs) = 1 + length' xs
-- implement 'sum'
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs







--------------------------------------------------------------------------------
-- 8. Making our own types and typeclasses
--------------------------------------------------------------------------------
-- use 'data' keyword to define a type
data Bool = False | True
-- before (=) denotes the type
-- after (=) are value constructors
data Int = -234 | -233 | .... | -1 | 0 | 1  | ...
-- Can think of defining an Int like this
data Shape = Circle Float Float Float | Rectangle Float Float Float Float
-- the circle value constructor is a function that ultimately returns a value
-- of a data type
:t Circle
Circle :: Float -> Float -> Float -> Shape
