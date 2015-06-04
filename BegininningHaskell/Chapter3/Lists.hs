module Chapter3.Lists where
   
-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- foldr f initial [] = initial
-- foldr f initial (x:xs) = f x (foldr f initial xs)

data InfNumber a = MinusInfinity
                 | Number a
                 | PlusInfinity
                 deriving Show

infMax MinusInfinity x = x
infMax x MinusInfinity = x
infMax PlusInfinity _  = PlusInfinity
infMax _ PlusInfinity  = PlusInfinity
infMax (Number a) (Number b) = Number (max a b)

-- foldl :: (a -> b -> a) -> a -> [b] -> a
-- foldl _ initial []     = initial
-- foldl f initial (x:xs) = foldl f (f initial x) xs

product' :: [Int] -> Int
product' [] = 1
product' (x:xs) = x * (product' xs)

product'' :: [Int] -> Int
product'' = foldr (*) 1

all' :: [Bool] -> Bool
all' [] = True
all' (x:xs) = x && (all' xs)

all'' :: [Bool] -> Bool
all'' = foldr (&&) True

minimumBy :: (Int -> Int) -> [Int] -> Int
minimumBy f lst = snd . (foldr1 min) $ map (\v -> (f v, v)) lst
