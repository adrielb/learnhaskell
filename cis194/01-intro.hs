-- 1: Haskell Basics
-- http://www.seas.upenn.edu/~cis194/spring13/lectures/01-intro.html
--
main :: IO()
main = do
    putStrLn "hello"
    print (hailstoneSeq 3)
    print (intListLength [5,4,3,2,1])
    print (sumEveryTwo [5,4,3,2,1])
    unusedMain

unusedMain :: IO()
unusedMain = do
    print y
    print x
    print biggestInt
    print smallestInt
    print i
    -- print (div 25 5)
    print (sumtorial 4)
    print (hailstone 20)
    print (hailstone 21)
    print (foo (-3))
    print (foo (0))
    print (foo (1))
    print (foo (36))
    print (foo (38))
    print (sumPair (3, 5))
    print ex17
    print range2
    print ex18
    print ex19
    print ex20


x :: Int
x = 3

-- infinit loop
y :: Int
y = y+1

i :: Int
i = -78

biggestInt, smallestInt :: Int
biggestInt = maxBound
smallestInt = minBound

-- n :: Integer
-- n=123789012347890123478901234789012347890123478901234789012344

-- reallyBig :: Integer
-- reallyBig = 2^(2^(2^2))

sumtorial :: Integer -> Integer
sumtorial 0 = 0
sumtorial n = n + sumtorial (n-1)

-- guards
hailstone :: Integer -> Integer
hailstone n
    | n `mod` 2 == 0 = n `div` 2
    | otherwise      = 3*n + 1


foo :: Integer -> Integer
foo 0 = 16
foo 1
    | "Haskell" > "C++" = 3
    | otherwise         = 4
foo n
    | n < 0 = 0
    | n `mod` 17 == 2 = -43
    | otherwise = n + 3

-- pairs
p :: (Int, Char)
p = (3, 'x')

sumPair :: (Int, Int) -> Int
sumPair (x,y) = x + y

f :: Int -> Int -> Int -> Int
f x y z = x + y + z
ex17 = f 3 17 8

-- Lists
nums, range, range2 :: [Integer]
nums = [1,2,4,100]
range = [1..100]
range2 = [2,4..100]

emptyList = []
ex18 = 1 : []
ex19 = 3 : (1 : [])
ex20 = 2 : 3 : 4 : []

hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

intListLength :: [Integer] -> Integer
intListLength [] = 0
intListLength (x:xs) = 1 + intListLength xs
intListLength (_:xs) = 1 + intListLength xs

sumEveryTwo :: [Integer] -> [Integer]
sumEveryTwo [] = []
sumEveryTwo (x:[]) = [x]
sumEveryTwo (x:y:zs) = (x+y) : sumEveryTwo zs
