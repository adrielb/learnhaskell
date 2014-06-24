doubleMe x = x + x
--doubleUs x y = x*2 + y*2
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100
                      then x
                      else 2*x
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY SEVEN"
lucky x = "no luck"

sayMe :: (Integral a) => a -> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe 3 = "Three"
sayMe x = "Not btw 1 and 3"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)

charName :: Char -> String
charName 'a' = "allison"
charName 'b' = "Broseth"
charName 'c' = "Cecil"

first :: (a,b,c) -> a
first (x, _, _) = x
second :: (a,b,c) -> b
second (_, y, _) = y
third :: (a,b,c) -> c
third (_,_,z) = z

head' ::  [a] -> a
head' [] = error "empty list"
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "empty list"
tell (x:[]) = "one elememnt: " ++ show x
tell (x:y:[]) = "two elems: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "many elems. " ++ show x ++ " and " ++ show y

length' :: (Num b) => [a] -> b
length' [] = 0 
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs
