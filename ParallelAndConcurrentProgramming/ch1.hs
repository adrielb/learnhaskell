-- Chapter 2. Basic Parallelism: The Eval Monad
--
-- lazy - expressions are not evaluated until they are required
-- principal of unevaluated computation
let x = 1 + 2 :: Int
-- x in unevaluated
-- 'sprint' command prints the value of the expression without causing it to be
-- evaluated
:sprint x
-- underscore indicates unevaulated, "thunk"
let x = 1 + 2 :: Int
let y = x + 1
:sprint x
:sprint y
-- 'seq' evaluates its arguments
seq y ()
:sprint x
:sprint y
-- 1. Defining expressions causes a thunk to be built representing that
--    expressgion
-- 2. A thunk remain unevaulated until its value is required
let x = 1 + 2 :: Int
let z = (x, x)
:sprint z
-- we can build data structures with unevaluated components

import Data.Tuple
let z = swap (x, x+1)
:sprint z
seq z ()
:sprint z
-- z is evaluated to a pair but the components of the pair remain unevaulated
-- 'seq' evaluates only as far as the first constructor
-- 'seq' evaluates to **weak head normal form** (WHNF)
-- normal form - fully evaluated, deepseq
seq x ()
:sprint z

-- Example with lists: map
-- map :: ( a -> b ) -> [a] -> [b]
-- map f [] = []
-- map (x:xs) = f x : map f xs
let xs = map (+1) [1..10] :: [Int]

--
-- The Eval Monad, rpar and rseq
data Eval a
instance Monad Eval

runEval :: Eval -> a
rpar :: a -> Eval a
rseq :: a -> Eval a

-- Eval monad expresses parallelism 
-- rpar creates parallelism
-- rseq forces sequential evaluation
--
-- arguments to rpar should be a thunk (an unevaulated computation)
-- Calculate the result of f x and f y in parallel:
-- This returns immediately
runEval $ do
  a <- rpar (f x)
  b <- rpar (f y)
  return (a, b)
-- This returns when f y completed
runEval $ do
  a <- rpar (f x)
  b <- rseq (f y)
  return (a, b)
-- This waits for both f x and f y to complete
runEval $ do
  a <- rpar (f x)
  b <- rseq (f y)
  rseq a
  return (a, b)
-- This is more symmetrical (preferable)
runEval $ do
  a <- rpar (f x)
  b <- rpar (f y)
  rseq a
  rseq b
  return (a,b)
-- 
-- Soduku example
$ ./sudoku1 sudoku17.1000.txt +RTS -s
-- '+RTS -s' emits runtime statistics
-- Total time: CPU Time, elapsed (wall-clock) time
-- rpar only evaluates to weak head normal form
rpar (map solve as)
-- evaluation would stop at first (:) constructor
force :: NFData a => a -> a
-- 'force' evaluates the entire structure of its arguments
-- Control.DeepSeq module
-- Par monad makes 'force' the default 
--
-- Static partitoning  -  fixed division of work
-- Dynamic partitioning  -  distrubting smaller units of work at runtime
