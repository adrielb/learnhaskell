-- 
-- Create types using 'data' keyword 
-- now if color and names are switched => error

data Name = NameConstr String
data Color = ColorConstr String

showInfos :: Name -> Color -> String
showInfos (NameConstr name) (ColorConstr color) =
  "Name: " ++ name ++ ", Color: " ++ color

name = NameConstr "Robin"
color = ColorConstr "Blue"

main = do
  putStrLn $ showInfos name color
  putStrLn $ showInfos color name 

-- Constructors are functions
--   NameConstr :: String -> Name
--   ColorConstr :: String -> Color
