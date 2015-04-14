main :: IO()
main = do
    print "start"
    ex1

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

