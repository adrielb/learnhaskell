-- ^ uses infix notation 
square :: Num a => a -> a
square x = x^2

-- convert to prefix notation
square' x = (^) x 2
square'' x = (^2) x 

-- remove the x in the left and right side
-- (eta-reduction)
square''' = (^2) 

-- absolute value implementation
absolute :: (Ord a, Num a) => a -> a
absolute x = if x >= 0 then x else -x
absolute' x
  | x >= 0 = x
  | otherwise = -x

f x y = x*x + y*y
g x y = (+) ((*) x x) ((*) y y)

main = do
  print  (square 3)
  print $ square 3
  print $ square' 3
  print $ square'' 3
  print $ square''' 3
  print $ absolute 10
  print $ absolute (-10)
  print $ absolute' 10
  print $ absolute' (-10)
  print $ f 2 4
  print $ g 2 4

