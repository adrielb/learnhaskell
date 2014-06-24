import Data.List (foldl')
-- Given a list of integers,
-- return the sum of the even numbers in the list

main = mainSums

mainProd = do
  mainprod
  mainprod'

mainSums = do
  main1
  main2
  main3
  main4
  main5
  main6
  main7
  main8
  main9
  main10

-- version 1
evenSum1 :: [Integer] -> Integer

evenSum1 l = accumSum 0 l

accumSum n l = if l == []
               then n
               else let x = head l
                        xs = tail l
                    in if even x
                       then accumSum (n+x) xs
                       else accumSum n xs

main1 = print $ evenSum1 [1..10]

-- version 2
-- use 'where' so 'accumSum' doesn't pollute global name space
evenSum2 :: Integral a => [a] -> a

evenSum2 l = accumSum 0 l
      where accumSum n l = 
              if l == []
              then n
              else let x = head l
                       xs = tail l
                in if even x
                then accumSum (n+x) xs
                else accumSum n xs

main2 = print $ evenSum2 [1..12]

-- version 3
-- pattern matching
evenSum3 l = accumSum 0 l
  where 
    accumSum n [] = n
    accumSum n (x:xs) = 
      if even x
      then accumSum (n+x) xs
      else accumSum n xs

main3 = print $ evenSum3 [1..14]

-- version 4
-- pattern matching, eta-reducing it
evenSum4 = accumSum 0
  where 
    accumSum n [] = n
    accumSum n (x:xs) = 
      if even x
      then accumSum (n+x) xs
      else accumSum n xs

main4 = print $ evenSum4 [1..14]

-- version 5
-- higher order functions
-- filter :: (a -> Bool) -> [a] -> [a]
evenSum5 l = mysum 0 ( filter even l )
  where
    mysum n [] = n
    mysum n (x:xs) = mysum (n+x) xs

main5 = print $ evenSum5 [1..16]

-- version 6
-- foldl :: (a -> b -> a) -> a -> [b] -> a
evenSum6 l = foldl' mysum 0 (filter even l)
  where mysum acc value = acc + value

main6 = print $ evenSum6 [1..18]

-- version 7
-- use lambda notation instead of temporary name 'mysum'
evenSum7 l = foldl' (\x y -> x+y) 0 (filter even l)

main7 = print $ evenSum7 [1..19]

-- version 8
-- use (+)
evenSum8 :: Integral a => [a] -> a
evenSum8 l = foldl' (+) 0 (filter even l)

main8 = print $ evenSum8 [1..20]

-- rewrite 
-- prod [3,4,5] to return 3*4*5=60
prod :: [Integer] -> Integer
prod [] = 1
prod (x:xs) = x * prod xs

prod' :: [Integer] -> Integer
prod' l = foldl' (*) 1 l

mainprod  = print $ prod [3*4*5]
mainprod' = print $ prod' [3*4*5]

-- version 9
-- use (.) to eta-reduce further
evenSum9 = (foldl' (+) 0 ) . (filter even)

main9 = print $ evenSum9 [1..22]

-- version 10
-- split 'foldl' into another function
sum' :: (Num a) => [a] -> a
sum' = foldl' (+) 0
evenSum10 :: Integral a => [a] -> a
evenSum10 = sum' . (filter even)

main10 = print $ evenSum10 [1..22]

-- version 11
-- get sum of all even square elements
squareEvenSum = sum' . (filter even) . ( map (^2) )
squareEvenSum' = evenSum . (map (^2))
sqiareEvenSum'' = sum' . (map (^2)) . (filter even)
