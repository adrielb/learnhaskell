add a b = a + b


myDrop n xs = if n <= 0 || null xs
              then xs
              else myDrop (n-1) (tail xs)

myDrop :: Int -> [a] -> [a]

lastButOne xs = last (take (length xs - 1) xs)
