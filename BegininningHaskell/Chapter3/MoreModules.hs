module Chapter3.MoreModules where

-- import Data.List (permutations, subsequence)
import Data.List hiding (head, tail)
-- import qualified Data.List (filter, permutations) -- Data.List.filter
-- import qualified Data.List as L                   --         L.filter

permuationsStartingWith :: Char -> String -> [String]
permuationsStartingWith letter = filter (\l -> head l == letter) . permutations


