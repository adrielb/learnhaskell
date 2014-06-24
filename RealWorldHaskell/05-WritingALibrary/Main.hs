module Main (main) where
-- empty export list exports no names at all

import SimpleJSON

main = print (JObject [("foo", JNumber 1), ("bar", JBool False)])
