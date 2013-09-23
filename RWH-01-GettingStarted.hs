:set prompt "ghci > "

-- load definitions from other modules
:module + Data.Ratio

-- infix arithmetic 
2 + 2

-- prefix form
(+) 2 2

-- negative numbers
2 + (-3)

-- Boolean logic
True && False
False || True
not True

-- zero is not false
True && 0

-- comparison
1 == 1
1 /= 0

-- numeric precedence 1 to 9
:info (+)
:info (*)

-- (+) and (*) are left associative
-- evaluated left-to-right
-- (^) is right associative
:info (^)

-- make definition
let e = exp 1

-- raise to floating point exponent
(e ** pi ) - pi

-- Lists
[1,2,3]

-- all elements of list must be same type
[True, False, "asdfsadf"]

-- enumeration notation
[1..10]

-- closed interval plus step size
[1.0, 1.25..2.0]
[1,4..15]
[10,9..1]

-- operators on lists
-- concatenate lists
[3,3,3] ++ [4,5]

[] ++ [False, True] ++ [True]

-- "construct" operator adds to front of list
-- first arg must be element
-- second arg must be list
1 : [2,3]
1 : []

-- print a string
putStrLn "A newline\nSee?"

-- a text string is a list of individual characters
let a = ['h', 'e', 'l', 'p' ]
a

-- the empty string is syn with []
"" == []

-- Since strings are lists:
'a' : "bc"
"foo" ++ "bar" 

-- Types
-- print more type information
:set +t
'c'
"foo"

-- 'it' result of last expression (ghci)
-- x :: y   "x has type y"
-- use 'it' as a shortcut in new evaluations
"foo"
it ++ "bar"

-- Rational numbers
11 % 29

-- turn off extra type info
:unset +t

-- get type information
:type 'a'
"foo"
:type it

:type 3 + 2


-- EXERCISES
succ 6

succ 7

pred 9

:type it

sin( pi / 2) 

truncate pi

round 3.5

floor 3.7

ceiling 3.3

let x = 1

:show bindings


