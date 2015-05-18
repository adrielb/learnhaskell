module Chapter2.SimpleFunction where

firstOrEmpty :: [[Char]] -> [Char]
firstOrEmpty lst = if not (null lst) then head lst else "empty"


-- concatenation infix function
lst1 +++ lst2 = if null lst1
                   then lst2
                   else (head lst1) : (tail lst1 +++ lst2)

-- reversing a list function
reverse2 :: [a] -> [a]
reverse2 list = if null list
                   then []
                   else reverse2 (tail list) +++ [head list]

maxmin' list = if null (tail list)
                 then (head list, head list)
                 else ( if (head list) > fst (maxmin' (tail list))
                        then head list
                        else fst (maxmin' (tail list))
                    ,   if (head list) < snd (maxmin' (tail list))
                        then head list
                        else snd (maxmin' (tail list))
                      )

-- too much repetition, need to use local binding
--   * let-in  - defined before an expression
--   * where   - defined after an expression

maxmin list = let h = head list
               in if null (tail list)
                     then (h, h)
                     else ( if h > t_max then h else t_max 
                          , if h < t_min then h else t_min )
                            where t = maxmin (tail list)
                                  t_max = fst t
                                  t_min = snd t

