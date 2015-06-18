main :: IO()
main = do 
    print "Start"
    print x
    print $ wrap 3
    print $ nil Nil
    print $ nil x
    print $ foldL  (\a b -> b) 0 y
    print $ foldL' (\a b -> b) 0 y
    print $ mapL (2*) y
    print $ appendL y x
    print $ appendL x y
    print $ concatL listOfLists
    print $ isort y
    print $ isort' y
      where x = Cons 1 (Nil)
            y = Cons 5 (Cons 3 (Cons 2 ( Cons 8 (Nil))))
            listOfLists = Cons (wrap 1) (Cons (wrap 5) (Cons (wrap 3) (Cons (wrap 2) ( Cons (wrap 8) (Nil)))))

data List a = Nil
            | Cons a (List a)
            deriving (Show)

wrap :: a -> List a
wrap x = Cons x Nil

nil :: List a -> Bool
nil Nil         = True
nil (Cons x xs) = False

foldL :: (a -> b -> b) -> b -> List a -> b
foldL f e Nil         = e
foldL f e (Cons x xs) = f x (foldL f e xs)

foldL' :: (a -> b -> b) -> b -> List a -> b
foldL' f e xs = case xs of
                  Nil -> e
                  Cons y ys -> f y (foldL' f e ys)

mapL :: (a -> b) -> List a -> List b
mapL f lst = foldL g Nil lst
  where
      g a b = Cons (f a) (b)

appendL :: List a -> List a -> List a
appendL a b = foldL f b a
  where f x xs = Cons x xs

concatL :: List (List a) -> List a
concatL lsts = foldL f Nil lsts
  where f lst xs = appendL lst xs

isort :: Ord a => List a -> List a
isort = foldL insert Nil
  where
      insert :: Ord a => a -> List a -> List a
      insert y Nil = wrap y
      insert y (Cons x xs) 
        | y < x     = Cons y (Cons x xs)
        | otherwise = Cons x (insert y xs)

isort' :: Ord a => List a -> List a
isort' = foldL insert' Nil
  where
      insert' = (xs (insert y xs))
