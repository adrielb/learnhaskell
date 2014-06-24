-- Binary Trees
import Data.List

data BinTree a = Empty
                 | Node a (BinTree a) (BinTree a)
                 deriving( Show )

-- Turns a list into an ordered binary tree
treeFromList :: (Ord a) => [a] -> BinTree a
treeFromList [] = Empty
treeFromList (x:xs) = Node x (treeFromList (filter (<x) xs))
                             (treeFromList (filter (>x) xs))
-- the root is x
--   left subtree from xs that are inferior to x
--   right subtree from xs that are superior to x

main = print $ treeFromList [7,2,4,8]
