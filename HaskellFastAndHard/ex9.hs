-- Recursive types
--

{- recreate list type, but with more verbose syntax
 - data List a = Empty | Cons a (List a)
 -}

-- use infix name for constructor for easier syntax
infixr 5 :::
data List a = Nil | a ::: (List a)
              deriving (Show, Read, Eq, Ord)
-- Show - prints to screen
-- Read - parses string to produce values
-- Eq - test for equality
-- Ord - comparision

convertList [] = Nil
convertList (x:xs) = x ::: convertList xs

main = do
  print (0 ::: 1 ::: Nil)
  print (convertList [0,1])
  print (convertList [0..8])

