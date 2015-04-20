main :: IO()
main = do
    print "start"
    ex4

test :: IO()
test = do
    print $ (1201234 `div` 10 :: Int)
    print $ (1201234 `mod` 10 :: Int)
    print $ toD 32
    print $ (myreverse [1,2,4] :: [Int])

toD :: Integer -> [Integer]
toD d = [d `mod` 10]

ex1 :: IO()
ex1 = do
    print (toDigits 1234)
    print (toDigitsRev 1234)
    print (toDigits 0)
    print $ toDigits (-17)

toDigits :: Integer -> [Integer]
toDigitsRev :: Integer -> [Integer]

toDigits d  
    | d <= 0    = []
    | otherwise =  toDigits (d `div` 10) ++ [d `mod` 10]

toDigitsRev d
    | d <= 0    = []
    | otherwise = d `mod` 10 : toDigitsRev (d `div` 10)

myreverse :: [a] -> [a]
myreverse [] = []
myreverse (x:xs) = myreverse xs ++ [ x ]


ex2 :: IO()
ex2 = do
    print "ex2"
    print $ doubleEveryOther [8,7,6,5]
    print $ doubleEveryOther [4,9,5,5]
    print $ doubleEveryOther [1,2,3]
    print $ doubleEveryOther [0,0]

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther []       = []
doubleEveryOther (x:[])   = [x]
doubleEveryOther (x:y:zs) = x : 2*y : doubleEveryOther zs

ex3 ::IO()
ex3 = do
    print $ sumDigits [10,5,18,4]
    print $ sumDigits [16,7,12,5]

sumDigits :: [Integer] -> Integer
sumDigits' :: [Integer] -> [Integer]
sumDigits'' :: [Integer] -> Integer
sumDigits xs = sumDigits'' $ sumDigits' xs
sumDigits' [] = [0]
sumDigits' (x:xs) = toDigits x ++ sumDigits' xs
sumDigits'' [] = 0
sumDigits'' (x:xs) = x + sumDigits'' xs

ex4 :: IO()
ex4 = do
    print $ validate 4012888888881881
    print $ validate 4012888888881882

validate :: Integer -> Bool
validate a = sumDigits ( doubleEveryOther ( toDigitsRev a ) ) `mod` 10 == 0

