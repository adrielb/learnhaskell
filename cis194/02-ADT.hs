-- Enumeration types
data Thing = Shoe
    | Ship
    | SealingWax
    | Cabbage
    | King
    deriving Show

shoe :: Thing
show = Shoe

listO'Things :: [Thing]
listO'Things = [Shoe, SealingWax, King, Cabbage, King]

-- pattern matching Things
isSmall :: Thing -> Bool
isSmall Show = True
isSmall Ship = False
isSmall SealingWax = True
isSmall Cabbage = True
isSmall King = False

isSmall2 :: Thing -> Bool
isSmall2 Ship = False
isSmall2 King = False
isSmall2 _ = True

--
-- Algebraic Data Types
--
--  Two constructors
data FailableDouble = Failure
                    | OK Double
                    deriving Show

ex01 = Failure
ex02 = OK 3.5

:type OK
OK :: Double -> FailableDouble

safeDiv :: Double -> Double -> FailableDouble
safeDiv _ 0 = Failure
safeDiv x y = OK (x/y)

failureToZero :: FailableDouble -> Double
failureToZero Failure = 0
failureToZero (OK d) = d

-- type constructor and data constructor can have the same name
-- exist in different namespaces
data Person = Person String Int Thing
                deriving Show

brent :: Person
brent = Person "Brent" 41 SealingWax

stan :: Person
stan = Person "Stan" 13 Cabbage

getAge :: Person -> Int
getAge (Person _ a _) = a

-- In general
data AlgDataType = Constr1 Type11 Type12
                 | Constr2 Type21
                 | Constr3 Type31 Type32 Type33
                 | Constr4

-- patterns can be given a name
baz :: Person -> String
baz p@(Person n _ _) = "Name of " ++ show p ++ " is " ++ n

-- patterns can be nested
checkFav :: Person -> String
checkFav (Person n _ SealingWax) = n ++ " favorite"
checkFav (Person n _ _) = n ++ " lame"

-- In general:
patt ::=
    _
  | var
  | var @ (pat)
  | (Constructor pat1 pat2 ... patn)

-- Case Expressions
case exp of
    pat1 -> exp1
    pat2 -> exp2
    ...

ex03 = case "Hello" of
         [] -> 3
         ('H':s) -> length s
         _ -> 7

failureToZero' :: FailableDouble -> Double
failureToZero' x = case x of 
                     Failure -> 0
                     OK d -> d

-- Recursive data types
data IntList = Empty | Cons Int IntList

intListProd :: IntList -> Int
intListProd Empty = 1
intListProd (Cons x l) = x * intListProd l

-- binary tree
data Tree = Leaf Char
          | Node Tree Int Tree
          deriving Show

tree :: Tree
tree = Node (Leaf 'x') 1 (Node (Leaf 'y') 2 (Leaf 'z'))
