{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Data.Monoid

-- http://adit.io/posts/2013-04-15-making-a-website-with-haskell.html

main = scotty 3000 $ do
    get "/" $ do
        html "Hello world"
        
    get "/:word" $ do
        beam <- param "word"
        html $ mconcat ["<h1>Scotty, ",beam," me up!</h1>"]

    notFound $ do
        text "No such route."

