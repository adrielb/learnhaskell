module Chapter2.Guards where

ifibonacci :: Integer -> Maybe Integer
ifibonacci n = if n < 0
                  then Nothing
                  else case n of
                         0 -> Just 0
                         1 -> Just 1
                         n' -> let Just f1 = ifibonacci (n'-1)
                                   Just f2 = ifibonacci (n'-2)
                                in Just (f1 + f2)

-- using 'otherwise' is equivalent to leaving a blank and no guard
-- but it clearly signfies this pattern takes care of all other cases
ifib n | n < 0 = Nothing
ifib 0         = Just 0
ifib 1         = Just 1
ifib n | otherwise = let (Just f1, Just f2) = (ifib (n-1), ifib (n-2))
                      in Just (f1+f2)

-- any expression returning a Boolean value can be used as a guard
binom _ 0          = 1
binom x y | x == y = 1
binom n k          = (binom (n-1) (k-1)) + (binom (n-1) k)

multipleOf :: Integer -> Integer -> Bool
multipleOf x y = (mod x y) == 0

specialMultiples :: Integer -> String
specialMultiples n 
  | multipleOf n 2 = show n ++ " is multiple of 2"
  | multipleOf n 3 = show n ++ " is multiple of 3"
  | multipleOf n 5 = show n ++ " is multiple of 5"
  | otherwise      = show n ++ " is a number"

ackerman :: Integer -> Integer -> Integer
ackerman m n 
  | m == 0          = n + 1
  | m > 0 && n == 0 = ackerman (m-1) 1
  | m > 0 && n > 0  = ackerman (m-1) (ackerman m (n-1))

unzip' :: [(a,b)] -> ([a], [b])
unzip' []         = ([], [])
unzip' ((a,b):xs) = 
    let (alst, blst) = unzip xs
     in ( a : alst, b : blst)


