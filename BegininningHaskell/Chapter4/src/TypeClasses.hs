module TypeClasses where


-- "values of this type have a name"
class Nameable n where
    name :: n -> String

initial :: Nameable n => n -> Char
initial n = head (name n)

data Client i = GovOrg  { clientId :: i, clientName :: String }
              | Company { clientId :: i, clientName :: String
                         , person :: Person, duty :: String }
              | Individual { clientId :: i, person :: Person }
              deriving Show

data Person = Person { firstName :: String, lastName  :: String }
              deriving (Show, Read)


instance Nameable (Client i) where
    name Individual { person = Person { firstName = f
                                      , lastName = n } 
                    } = f ++ " " ++ n
    name c = clientName c
