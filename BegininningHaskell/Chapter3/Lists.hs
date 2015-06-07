{-# LANGUAGE LambdaCase, ViewPatterns, NamedFieldPuns #-}

module Chapter3.Lists where

import Chapter2.DataTypes
import Data.List
   
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

bothFilters :: (a -> Bool) -> [a] -> ([a], [a])
bothFilters p list = (filter p list, filter (not.p) list)

skipUntilGov :: [Client] -> [Client]
skipUntilGov = dropWhile ( \case { 
                         GovOrg {} -> False;
                         _         -> True 
                         } )

isIndividual :: Client -> Bool
isIndividual (Individual {}) = True
isIndividual _               = False

checkIndividualAnalytics :: [Client] -> (Bool, Bool)
checkIndividualAnalytics cs = (any isIndividual cs, not $ all isIndividual cs)

elem' :: Int -> [Int] -> Bool
elem' e lst = let maybeFound = find (==e) lst
               in case maybeFound of 
                    Nothing -> False
                    Just _  -> True

compareClient :: ClientR -> ClientR -> Ordering
compareClient (IndividualR { person = p1 }) (IndividualR { person = p2 }) 
                                = compare (firstName p1) (firstName p2)
compareClient (IndividualR {}) _ = GT
compareClient _ (IndividualR {}) = LT
complareClient c1 c2             = compare (clientName c1) (clientName c2)


enum :: Int -> Int -> [Int]
enum a b | a > b = []
enum a b         = a : enum (a+1) b

withPositions :: [a] -> [(Int,a)]
-- withPositions list = zip (enum 1 $ length list) list
withPositions list = zip [1 .. length list] list
