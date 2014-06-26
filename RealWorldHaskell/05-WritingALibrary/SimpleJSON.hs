module SimpleJSON
    (
      JValue(..)
    , getString
    , getInt
    , getDouble
    , getBool
    , getObject
    , getArray
    , isNull
    ) where

-- A module lets us determine which names inside the module are accessible from
-- other modules 
--   Name of module must begin with a capital letter
--   JValue(..) notation means exporting both type and all constructors
--   list of exports denotes which names are visible
--   'where' keyword indicates body of module follows

-- each JSON type has a distinct value constructor
-- some constructors have parameters
data JValue = JString String
            | JNumber Double
            | JBool Bool
            | JNull
            | JObject [(String, JValue)]
            | JArray [JValue]
              deriving (Eq, Ord, Show)

-- Haskell value to JValue thru value constructor
-- 'getString' does the reverse
getString :: JValue -> Maybe String
getString (JString s) = Just s
getString _ = Nothing

{-getInt :: Integral a => JValue -> Maybe a-}
getInt ::  JValue -> Maybe Int
getInt (JNumber n ) = Just (truncate n)
getInt _ = Nothing

getDouble :: JValue -> Maybe Double
getDouble ( JNumber n) = Just n
getDouble _ = Nothing

getBool :: JValue -> Maybe Bool
getBool ( JBool b ) = Just b
getBool _ = Nothing

getObject :: JValue -> Maybe [(String, JValue)]
getObject (JObject o) = Just o
getObject _ = Nothing

getArray :: JValue -> Maybe [JValue]
getArray ( JArray a ) = Just a
getArray _ = Nothing

isNull :: JValue -> Bool
isNull v = v == JNull
