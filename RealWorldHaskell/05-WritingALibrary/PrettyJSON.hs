-- instead of rendering to string, render to an abstract type
-- Doc is abstract type
-- use abstract type to change implementation without user knowing

renderJValue :: JValue -> Doc
renderJValue (JBool True) = text "true"
renderJValue (JBool False) = text "false"
renderJValue  JNull = text "null"
renderJValue (JNumber num)  =  double num
renderJValue (JString str)  =  string str

-- text / double / string functions provided in Prettify module


-- wrap a Doc with opening and closing character
enclose :: Char -> Char -> Doc -> Doc
enclose left right x = char left <> x <> char right

-- escapes or renders an individual character
oneChar :: Char -> Doc
oneChar c = case lookup c simpleEscapes of
                Just r -> text r
                Nothing | mustEscape c -> hexEscape c
                        | otherwise    -> char c
            where mustEscape c = c < ' ' || c == '\x7f' || c > '\xff'

-- associates character with escaped representation
-- list of pairs, association list (alist)
simpleEscapes :: [(Char, String)]
simpleEscapes = zipWith ch "\b\n\f\r\t\\\"/" "bnfrt\\\"/"
    where ch a b = (a, ['\\',b])
