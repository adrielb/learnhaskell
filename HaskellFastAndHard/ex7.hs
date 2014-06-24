-- in general, use the same name for the DataTypeName and DataTypeConstructor

-- using record syntax
data Knight = Knight {
  name :: String,
  quest :: String, 
  favoriteColor :: String
}


galaad = Knight {
  name = "Galaad, the pure",
  quest = "To seek the Holy Grail",
  favoriteColor = "The blue... No the red! AAH"
  }

showCharacter :: Knight -> String
showCharacter knight = "What is your name?\n"
  ++ "My name is " ++ name knight
  ++ "\nwhat is your quest?\n"
  ++ quest knight
  ++ "\nWhat is your fav color?\n"
  ++ favoriteColor knight

main = do
  putStrLn $ showCharacter galaad
