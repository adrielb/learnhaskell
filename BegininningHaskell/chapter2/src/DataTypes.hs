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
