f :: Num a => a -> a -> a
f x y = x*x + y*y

x :: Float
x = 3
y :: Float
y = 2.4

main = print ( f x y )
