main :: IO()
main = do
    print "start"
    print $ mysum [1,2,3]
    print $ mysum' [1,2,3]
    print $ myprod [3,4,5]
    print $ anytrue [True, False, False]
    print $ anytrue [False, False, False]
    print $ alltrue [True, False, False]
    print $ alltrue [True, True, True]
    print $ mycopy [3,3,2]
    print $ (append [1,2] [3,4] :: [Int])
    print $ Main.length [5::Int,5,5,5,5] 
    print $ doubleAll [1..5]


mysum :: [Int] -> Int
mysum [] = 0
mysum (x:xs) = x + sum xs

mysum' :: [Int] -> Int
mysum' = foldr (+) 0

myprod :: [Int] -> Int
myprod = foldr (*) 1

anytrue :: [Bool] -> Bool
anytrue = foldr (||) False

alltrue :: [Bool] -> Bool
alltrue = foldr (&&) True

mycopy :: [Int] -> [Int]
mycopy = foldr (:) []

append :: [a] -> [a] -> [a]
append a b = foldr (:) b a

length :: [a] -> Int
length = 
    let count _ n = n + 1
    in foldr count 0
-- count :: a -> Int -> Int

doubleAll :: [Int] -> [Int]
doubleAll = 
    let doubleAndCons n list = (2*n) : list
     in foldr doubleAndCons []

doubleAll' :: [Int] -> [Int]
doubleAll' =
    let double n = 2 * n
        fAndCons f el list = f el : list
     in fAndCons f = : . f

map f = foldr ( : . ) []


