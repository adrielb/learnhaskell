{-# LANGUAGE LambdaCase, ViewPatterns, NamedFieldPuns, RecordWildCards, 
TransformListComp #-}
module Chapter3.Lists where

import Data.List
import GHC.Exts
   
data Client i = GovOrg  { clientId :: i, clientName :: String }
              | Company { clientId :: i, clientName :: String
                         , person :: Person, duty :: String }
              | Individual { clientId :: i, person :: Person }
              deriving Show

data Person = Person { firstName :: String, lastName  :: String }
              deriving Show

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

skipUntilGov :: [Client a] -> [Client a]
skipUntilGov = dropWhile ( \case { 
                         GovOrg {} -> False;
                         _         -> True 
                         } )

isIndividual :: Client a -> Bool
isIndividual (Individual {}) = True
isIndividual _               = False

checkIndividualAnalytics :: [Client a] -> (Bool, Bool)
checkIndividualAnalytics cs = (any isIndividual cs, not $ all isIndividual cs)

elem' :: Int -> [Int] -> Bool
elem' e lst = let maybeFound = find (==e) lst
               in case maybeFound of 
                    Nothing -> False
                    Just _  -> True

compareClient :: Client a -> Client a -> Ordering
compareClient (Individual { person = p1 }) (Individual { person = p2 }) 
                                = compare (firstName p1) (firstName p2)
compareClient (Individual {}) _ = GT
compareClient _ (Individual {}) = LT
complareClient c1 c2             = compare (clientName c1) (clientName c2)


enum :: Int -> Int -> [Int]
enum a b | a > b = []
enum a b         = a : enum (a+1) b

withPositions :: [a] -> [(Int,a)]
-- withPositions list = zip (enum 1 $ length list) list
withPositions list = zip [1 .. length list] list

doubleOdds :: [Integer] -> [Integer]
-- doubleOdds list = map (*2) $ filter odd list
doubleOdds list = [2*x | x <- list, odd x]

companyAnalytics :: [Client a] -> [(String, [(Person,String)])]
companyAnalytics clients = [ (the clientName, zip person duty)
                           | client@(Company {..}) <- clients
                           , then sortWith by duty
                           , then group by clientName using groupWith
                           , then sortWith by length client
                           ]

filterAsFold :: (a -> Bool) -> [a] -> [a]
filterAsFold p = foldr (\x l -> 
                       if p x 
                       then x:l 
                       else l) []

mapAsFold :: (a -> b) -> [a] -> [b]
mapAsFold f = foldr (\x l -> f x : l) []

enumUnfold :: Int -> Int -> [Int]
enumUnfold n m = unfoldr (\x -> if x > m 
                         then Nothing 
                         else Just (x, x+2)) n

minSort :: [Integer] -> [Integer]
minSort = unfoldr (\case [] -> Nothing
                         xs -> Just (m, delete m xs) where m = minimum xs)

