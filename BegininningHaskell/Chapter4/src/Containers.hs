module Containers where

import qualified Data.Map as M
import qualified Data.Set as S
import Data.Tree

data Client i = GovOrg  { clientId :: i, clientName :: String }
              | Company { clientId :: i, clientName :: String
                         , person :: Person, duty :: String }
              | Individual { clientId :: i, person :: Person }
              deriving Show

data Person = Person { firstName :: String, lastName  :: String }
              deriving Show

data ClientKind = GovOrgKind | CompanyKind | IndividualKind

-- classifyClients :: [Client Integer] -> M.Map ClientKind (S.Set (Client Integer))
-- classifyClients clients = let classifier = \case GovOrg -> 
--                            in map classifier clients

preOrder :: (a -> b) -> Tree a -> [b]
preOrder f (Node v subtrees) = let subtreesTraversed = concat $ map (preOrder f) subtrees
                                in f v : subtreesTraversed

pictureTree :: Tree Int
pictureTree = Node 1 [ Node 2 [ Node 3 []
                              , Node 4 []
                              , Node 5 [] ]
                     , Node 6 [] ]
