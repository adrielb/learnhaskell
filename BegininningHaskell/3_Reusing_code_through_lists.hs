-- Parametric Polymorphism
-- head is parametric polymorphic
:t head

:t head "Hello"

:t fst

:t ([3,4], "hello")

let maybeString (Just _) = "Just"
let maybeString Nothing  = "Nothing"

:t maybeString

maybeString Nothing

data Triple a b c = Triple a b c deriving Show

:t Triple "a" 3 3.4

-- type name    = constructor name
data SamePair a = SamePair a a deriving Show

:t SamePair 3 4

let swapTriple (x,y,z) = (y,z,x)

:t swapTriple

let duplicate x = (x,x)

:t duplicate

let nothing _ = Nothing

:t nothing

let index [] = []
let index [x] = [(0,x)]
let index (x:xs) = let indexed@((n,_):_) = index xs
                    in (n+1, x):indexed

index []

:t index

let maybeA [] = 'a'

:t maybeA

--
-- Functions as Parameters
succ 1

map succ [1,2,3]

:t map

apply3f2 :: (Integer ->Integer) -> Integer -> Integer

let apply3f2 f x = 3 * f (x + 2)

apply3f2 succ 7

:t ($)

maximum (map succ [1,2,3])

maximum $ map succ [1,2,3]

--
-- Anonymous Functions
-- \param1 param2 ... -> body

map (\x -> x + 2) [1,2,3]

equalTuples :: [(Integer, Integer)] -> [Bool]

let equalTuples t = map (\(x,y) -> x == y) t

equalTuples [(1,2),(3,3), (5,4)]

-- anon functions dont have a name, forbidding recursion
-- must use 'case' for pattern matching
sayHello :: [String] -> [String]

let sayHello names = map (\name -> case name of 
                     "Alejandro" -> "Hello, writer"
                     _           -> "Welcome, " ++ name
                     ) names

sayHello ["Max", "Alejandro", "Jack"]

-- special syntax to match cases for only one parameter
:set -XLambdaCase

{-# LANGUAGE LambdaCase #-}

let sayHello names = map (\case "Alejandro" -> "hello, writer"
                            name -> "Welcom, " -> name
                     ) names

-- closures
let multiplyByN n = \x -> n*x

map (multiplyByN 4) [4,3,2]

:t filter

filter even [1,2,3,4,5]

let lst = [1,2,3,1,5]

let filterOnes x = x == 1

filter filterOnes lst

let filterANumber n = \x -> x == n

filter (filterANumber 5) lst

let filterNot f lst = filter (\x -> not $ f x) lst

let filterNot f lst = filter (not . f) lst

filterNot filterOnes lst

--
-- Partial Application of a Function
let double = map (\x -> x * 2) 

:t double

:t \x -> x * 2

-- as a 'section'
let double = map (*2)

:t double

map (/2) [1,2,3]

map (2/) [1,2,3]

:t Just

:t ('a':)

-- point-free style - functions are combined without ever mentioning their parameters
let duplicateOdds list = map (*2) $ filter odd list

duplicateOdds [1,2,3,4,5]

let duplicateOdds = map (*2) . filter odd

duplicateOdds [1,2,3,4,5]

-- combinators
let uncurry f = \(x,y) -> f x y

let curry f = \x y -> f (x,y)

max 3 2

(uncurry max) (3,2)

-- need to curry max before map application since max requires two arguments
map (uncurry max) [(1,2), (2,1), (3,4)]

-- *** combinator: performs parallel compostion of two functions
let f *** g = \(x,y) -> (f x, g y)

(sqrt *** atan) (4,3)

let duplicate x = (x,x)

(sqrt *** atan) (duplicate 4)

-- rewrite 3x + 7(x + 2)
formula1 = uncurry (+) . ( ( (*7) . (+2) ) *** (*3) ) . duplicate

--
if 1 < 2 then error "bzzz" else 1

:load Chapter3/Ranges.hs

Range 3 4

Range 4 2

range 3 4

range 4 2

r (Range 3 1)

prettyRange (Range 2 4)

prettyRange (Range 5 2)

--
-- Diving into List
:load Chapter3/Lists.hs

foldr (+) 0 [1,2,3]

let x = MinusInfinity

foldr infMax MinusInfinity [1,2,3]

foldr infMax MinusInfinity $ map Number [1,2,3]

foldr (\x y -> infMax (Number x) y) MinusInfinity [1,2,3]

foldl (+) 0 [1,2,3]

-- 0 - ( 1 - ( 2 - ( 3 ) ) ) = 2
foldr (-) 0 [1,2,3]

-- ((0 - 1) - 2) - 3 =  -6
foldl (-) 0 [1,2,3]

-- exercises
product' [1,2,3,4]

product'' [1,2,3,4]

all' [True, True, True, True]

all' [True, True, False, True]

all'' [True, True, True, True]

all'' [True, True, False, True]

minimumBy (\x -> -x) [1,2,3]

:t foldr1

max (-1, 3) (1, -1)

:t max


