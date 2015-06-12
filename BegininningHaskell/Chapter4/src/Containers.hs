module Containers where

import qualified Data.Map as M
import qualified Data.Set as S
import Data.Tree
import Data.Graph

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


-- Graphs
timeMachineGraph :: [(String, String, [String])]
timeMachineGraph = 
  [("wood","wood",["walls"]), ("plastic","plastic",["walls","wheels"])
  ,("aluminum","aluminum",["wheels","door"]),("walls","walls",["done"])
  ,("wheels","wheels",["done"]),("door","door",["done"]),("done","done",[])]

timeMachinePrecedence :: (Graph, Vertex -> (String, String, [String]), String -> Maybe Vertex)
timeMachinePrecedence = graphFromEdges timeMachineGraph

timeMachineTravel :: Graph
timeMachineTravel = buildG (103,2013)
                      [(1302,1614),(1614,1302),(1302,2013),(2013,1302),(1614,2013)
                      ,(2013,1408),(1408,1993),(1408,917),(1993,917),(907,103),(103,917)]
