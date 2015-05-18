:t 'a'

import Data.Char

:t toUpper

:t chr

chr 97

:t min

chr 'a'

-- Int - bounded integer type
-- Integer - unbounded integer type

import Data.Ratio

toRational 1.3

1 % 2 + 1 % 3

toRational (fromRational (13%10))

:t toInteger

toInteger (3.4::Int)

:t 5

:t 3.2

:t -5

-5

atan( -4 )

:t "hello"

:t [1,2,3]

:t reverse

:t (++)

reverse [1,2,3]

reverse "abc"

[1,2,3] ++ [5,7,9]

(++) [1,2,3] [4,3,8]

-- functions written in symbols are always infix

[1,2,3] ++ "abc"

-- [] nil
-- :  cons

1 : 3 : 8 : []


-- null - checks if a list is empty
null [1]

null []

head [1,2,44]

tail [1,3,20]

or [True, False, False]

and [False, False, True]

if True then 1 else 2

if True then 1 else "hello"

if 3 < 5.5 then "less" else "more"

if not (null ["hello", "hola"]) then (head ["hello", "hola"]) else "empty"

if not (null []) then (head []) else "empty"

:t [['a','b','c'],['d','e']]

head [['a','b','c'],['d','e']]

head (head [['a','b','c'],['d','e']])

head [[]]

[] : []

('a' : 'b' : 'c' : []) : ('d' : 'e' : []) : []

if null

let l = ["abc", "de"]

(head l) ++ (head (tail l))

let l = ['a']

tail l == [] 

let l = ['a', 'b']

tail l == []

let l = [[], ['a','b']]

head l == []

null l



:t ("hello", True, if 2 > 3 then 'a' else 'b')

:load src/DataTypes.hs

:module Chapter2.DataTypes

:reload

Person "Asdf" "Xcvb" Male

Individual (Person "Asdf" "Xcvb" Male) True

:reload

clientName (GovOrg "Hsadf")

clientName (Individual (Person "Asdf" "Xcvb" Male) True)

companyName (GovOrg "NAOT")

let Just name = companyName (GovOrg "QQwer")







