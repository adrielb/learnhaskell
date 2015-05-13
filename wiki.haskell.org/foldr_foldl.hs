-- https://wiki.haskell.org/Foldr_Foldl_Foldl'
import Prelude hiding (foldr, foldl)

main ::IO()
main = do
    print "START"
    runfoldr
    runfoldl
    runfoldl'
    print "END"
   

runfoldr :: IO()
runfoldr = do
    let veryBigList = [1..10000000] :: [Int]
    let sum1 = foldr (+) 0 :: [Int] -> Int
    let try1 = sum1 veryBigList
    print try1

-- foldr allocates on the stack
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ z [] = z
foldr f z (x:xs) = x `f` foldr f z xs


-- foldl allocates on the heap
foldl :: (b -> a -> b) -> b -> [a] -> b
foldl _ z [] = z
foldl f z (x:xs) = 
    let z' = z `f` x
    in foldl f z' xs 

sum2 :: [Int] -> Int
sum2 = foldl (+) 0

runfoldl :: IO()
runfoldl = do
    let veryBigList = [1..10000000] :: [Int]
    print $ sum2 veryBigList

-- foldl' forces inner reduction with 'seq'
foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f z [] = z
foldl' f z (x:xs) = 
    let z' = z `f` x
     in seq z' $ foldl' f z' xs

sum3 :: [Int] -> Int
sum3 = foldl' (+) 0

runfoldl' :: IO()
runfoldl' = do
    let veryBigList = [1..10000000] :: [Int]
    print $ sum3 veryBigList
