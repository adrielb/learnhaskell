-- Defining a new data type

data BookInfo = Book Int String [String] deriving (Show)

-- BookInfo is a type constructor
--   **must start with a capital letter**
-- Book is the name of the value constructor
--   aka data constructor
--   **must start with a capital letter**
-- Int String [String] are components of the type
--   similar to a field in a structure
--   Int - Book ID
--   String - book title
--   [String] - author list

data MagazineInfo = Magazine Int String [String] deriving (Show)

-- type and value constructors have different names
-- deriving (show) lets ghci know how to print a value of this type

-- Create a new value of type BookInfo
-- treat Book as a function with component arguments
myInfo = Book 203948320948 "Algebra of Prog" ["Richard Bird", "Oege de Moor"]

:type Book 1 "some title" ["a1","a2"]

-- need to use 'let' to define new variables in ghci
-- not needed in Haskell source files
let cities = Book 173 "Use of W" ["Ian M. Bank"]

:type cities

-- ghci browsing 
:info BookInfo

-- see Book construct
:type Book 


-- Naming types and values
--
-- Only use a type constructor in a type declaration or type signature
-- Only use a value constructor in actual code
-- Since uses are distinct, they can have the same name

-- It is normal for the type constructor to have the same name as 
-- the value constructor

data BookReview = BookReview BookInfo CustomerID String

-- Type synonyms
-- purely for making code more readable
type CustomerID = Int
type ReviewBody = String

data BetterReview = BetterReview BookInfo CustomerID ReviewBody

-- BookRecord is a synonym for the tuple 
-- a shorter name for a verbose type
type BookRecord = (BookInfo, BookReview)


-- Algebraic data types
-- Bool is the simplest alg data type
-- Alg data types can have more than one value constructor
-- Bool has two value constructors, True and False
--  | is read as 'or', 'alternatives', or 'cases'
data Bool = False | True

type CardHolder = String
type CardNumber = String
type Address = [String]

-- Three ways to bill our customers
:{
data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDelivery
                 | Invoice CustomerID
                   deriving (Show)
:}

:type CreditCard
CreditCard "12312313" "thomas gere" ["dickens", "england"]
:type it
Invoice
:type it

-- Tuples, algebraic data types
-- There is some overlap btw tuples and alg data types
Book 2 "some title" ["a b"]
(2, "some tit", ["a b"]) 

a = ( "porp", "Grey" )
b = ( "table", "oak" )

-- with alg data types, there is no possibility of confusion
:{
data Cartesian2D = Cartesian2D Double Double
                     deriving( Eq, Show )
data Polar2D = Polar2D Double Double
                 deriving( Eq, Show )
:}

Cartesian2D (sqrt 2) (sqrt 2) == Polar2D (pi / 4) 2

-- The discriminated union
-- an algebraic data type with multiple alternatives
:{
type Vector = (Double, Double)
data Shape = Circle Vector Double
           | Poly [Vector]
:}


-- Pattern Matching
-- 1) If the type has more than one value constructor,
--    we need to be able to tell which value constructor
--    was used to create the value
-- 2) If the value constructor has data components,
--    we need to be able to extract those values

-- Reproducing the not fuction
let myNot True  = False
let myNot False = True

myNot False

-- adds together the elements of a list
let sumList (x:xs) = x + sumList xs
let sumList []     = 0

sumList [1,2]

