main = do
  print "What is your name?"
  name <- getLine
  print "city?"
  city <- getLine
  print ("Hello " ++ name ++ " from " ++ city ++ "!")

-- Haskell Properties
-- * Functional
-- * Static typing
-- * Purity - applying function of the same params always returns same value
-- * Laziness - evaluates only when needed
--            - elegant way for manipulating infinite structures
--
--
-- all functions have only one argument
let f x y = x + y
:t f
f :: Num a => a -> a -> a

f 3 4
(f 3) 4
let g = f 3
g 4
:t g
f 3 2.4
let x :: Int


g x y = x*x - y*y + x - y

main = do
    print $ g 3 2
    print $ g 3 4

-- Anonymous functions
-- '\' looks like a lambda
g = \y -> 3*3 + y*y
