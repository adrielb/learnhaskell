:type lines

lines "line1\nline2\n"

:type break

break odd [2,4,5,6,8]

:module +Data.Char

break isUpper "isUpper"

:load SplitLines.hs

splitLines "foo"

break isLineTerminator "foo"

splitLines "foo\r\nbar"

break isLineTerminator "foo\r\nbar"


-- Infix Functions



