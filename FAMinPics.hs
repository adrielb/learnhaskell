-- Functors, Applicatives and Monads
-- http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html
--
-- functions
-- apply a function to a value
(+3) 2
-- Any value can be in a context
Just 2
-- When you apply a function to this value, you'll get a result depending on the context
-- This is the idea Functors, Applicatives, Monads and Arrows are all based on
-- 
-- The Maybe data type defines two related contexts:
data Maybe a = Nothing | Just a
--

-- When a value is wrapped in a context,
-- you can't apply a normal function to it:
(+3) (Just 2)
-- fmap applies functions to values that are wrapped in a context
fmap (+3) (Just 2)
-- A Functor is any data type that defines how fmap applies to it
-- A Functor is a typeclass:
class Functor f where 
  fmap :: (a -> b) -> f a -> f b
-- (a - > b)   fmap takes a function (+3)
--   f a       fmap takes a Functor (Just 2)
--   f b       fmap returns a new Functor (Just 5)
-- fmap applies this function because Maybe is a Functor
:{
instance Functor Maybe where
  fmap func (Just val) = Just (func val)
  fmap func Nothing = Nothing
:}

fmap (+3) Nothing
-- '$' infix notation
(+3) <$> Nothing

-- Lists are functors too
instance Functor [] where
    fmap = map

-- Apply a function to another function
fmap (+3) (+1)

