module Chapter2.ListsAndTuples where

(+++) :: [a] -> [a] -> [a]
[] +++ list2 = list2
(x:xs) +++ list2 = x : (xs +++ list2)

-- @ : 'As pattern'
sorted ::  [Integer] -> Bool
sorted [] = True
sorted [_] = True
sorted (x: r@(y:xs)) = x < y && sorted r

-- 0 is a neutral element of the sum operation

-- matching on tuples
maxmin [x] = (x,x)
maxmin (x:xs) = ( if x > xs_max then x else xs_max
                , if x < xs_min then x else xs_min
                ) where (xs_max, xs_min) = maxmin xs

