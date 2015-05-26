{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE RecordWildCards #-}


module Chapter2.DataTypes where
import Data.Char


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

-- BUG: ordered dependent behavior of patterns
--      if _ was first, infinite recursion
fibonacci :: Integer -> Integer
fibonacci n = case n of 
                0 -> 0
                1 -> 1
                _ -> fibonacci (n-1) + fibonacci (n-2)
                

data Counts = NumMales Int
            | NumFemales Int
            | NumUnknown Int

countGender :: [Client] -> (Int, Int, Int)
countGender [] = (0,0,0)
countGender ((Company _ _ (Person _ _ a)   _):xs) =
    case a of
      Male -> ( 1 + numMales, numFemales, numUnknown)
      Female -> ( numMales, 1 + numFemales, numUnknown)
      Unknown -> ( numMales, numFemales, 1 + numUnknown)
    where (numMales, numFemales, numUnknown) = countGender xs
countGender ((Individual  (Person _ _ a)   _):xs) = 
    case a of
      Male -> ( 1 + numMales, numFemales, numUnknown)
      Female -> ( numMales, 1 + numFemales, numUnknown)
      Unknown -> ( numMales, numFemales, 1 + numUnknown)
    where (numMales, numFemales, numUnknown) = countGender xs


-- View Patterns
-- (function -> pattern)

responsibility :: Client -> String
responsibility (Company _ _ _ r) = r
responsibility _                 = "Unknown"

specialClient :: Client -> Bool
specialClient (clientName -> "Mr. Alejandro") = True
specialClient (responsibility -> "Director") = True
specialClient _                             = False

-- Records
-- { name :: type }
data ClientR = GovOrgR { clientRName :: String }
             | CompanyR { clientRName :: String
                        , companyId :: Integer
                        , person :: PersonR
                        , duty :: String }
            | IndividualR { person :: PersonR }
            deriving Show

data PersonR = PersonR { firstName :: String
                       , lastName :: String
                       } deriving Show

greet :: ClientR -> String
-- greet IndividualR { person = PersonR { firstName = fn } } 
--                                       = "Hi, " ++ fn
-- greet CompanyR    { clientRName = c } = "Hello, " ++ c
-- greet GovOrgR     {}                  = "Welcome"

greet IndividualR { person = PersonR { firstName } } = "Hi, " ++ firstName
greet CompanyR    {..} = "Hello, " ++ clientRName
greet GovOrgR     { }  = "Welcome"

nameInCapitals :: PersonR -> PersonR
nameInCapitals p@(PersonR { firstName = initial:rest } ) =
    let newName = (toUpper initial):rest
     in p { firstName = newName }
nameInCapitals p@(PersonR { firstName = "" }) = p


