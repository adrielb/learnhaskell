module Chapter2.DataTypes where

data Client = GovOrg String
            | Company String Integer Person String
            | Individual Person Bool
            deriving Show
data Person = Person String String Gender
  deriving Show

-- inside a module all constructors must have a different name
-- Data types and constructors have different namespaces
-- all types must be showable in order to print

-- enumerations
data Gender = Male | Female | Unknown
  deriving Show

clientName :: Client -> String
clientName client = case client of
                      GovOrg name -> name
                      Company name id person resp -> name
                      Individual person ads ->
                        case person of Person fName lName gender -> fName ++ " " ++ lName

clientName' client = case client of
                       Individual (Person fName lName _) _ -> fName ++ " " ++ lName

companyName :: Client -> Maybe String
companyName client = case client of 
                        Company name _ _ _ -> Just name
                        _ -> Nothing
