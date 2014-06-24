-- In haskell, types are strong and static
-- Haskell can infer types (type inference)
-- function types are as general as possible

import Data.Complex

square x = x*x

main1 = do
  print $ square 2
  print $ square 2.1
  print $ square (2 :+ 1)
  print $ square (3 :+ 4)


-- 
-- Name, Color, and String are treated identically
-- types didnt protect you from swapping name and color

type Name = String
type Color = String

showInfos :: Name -> Color -> String
showInfos name color = "Name: " ++ name 
  ++ ", Color: " ++ color

name :: Name
name = "Robin"
color :: Color
color = "Blue"

main2 = do
  putStrLn $ showInfos name color
  putStrLn $ showInfos color name

main = main2


