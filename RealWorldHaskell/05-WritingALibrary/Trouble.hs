import Data.Char

upcaseFirst :: String -> String
upcaseFirst (c:cs) = toUpper c : cs  -- forgot ":cs" here
upcaseFirst [] = []

camelCase :: String -> String
{-camelCase xs = concat (map upcaseFirst (words xs))-}
camelCase xs = concat . map . upcaseFirst (words xs)
