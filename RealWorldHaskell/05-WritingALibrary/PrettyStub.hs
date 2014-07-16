-- placeholder / stub version of types and functions
-- code that doesnt do anything but allows compilation without errors 
import SimpleJSON

data Doc = ToBeDefined
    deriving (Show)

string :: String -> Doc
string str = undefined

text :: String -> Doc
text str = undefined

double :: Double -> Doc
double num = undefined

-- undefined has type a
-- undefined :: a
-- undefined always typechecks no matter where it is used

-- :load PrettyStub.hs
-- double 23.12

(<>) :: Doc -> Doc -> Doc
a <> b = undefined

char :: Char -> Doc
char c = undefined

-- concats multiple Docs into one
hcat :: [Doc] -> Doc
hcat xs = undefined
