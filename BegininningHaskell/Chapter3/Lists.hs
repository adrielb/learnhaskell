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


