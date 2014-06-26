module PutJSON where

import Data.List (intercalate)
import SimpleJSON

renderJValue :: JValue -> String

renderJValue (JString s) = show s
renderJValue (JNumber n) = show n
renderJValue (JBool True) = "True"
renderJValue (JBool False) = "False"
renderJValue JNull = "null" 

renderJValue (JObject o) = "{" ++ pairs o ++ "}"
  where pairs [] = ""
        pairs ps = intercalate ", " (map renderPair ps)
        renderPair (k,v) = show k ++ ": " ++ renderJValue v

renderJValue (JArray a) = "[" ++ values a ++ "]"
  where values [] = ""
        values vs = intercalate ", " (map renderJValue vs)

-- separate rendering code from code that actually prints
-- separate pure from impure code
putJValue :: JValue -> IO ()
putJValue v = putStrLn (renderJValue v)
