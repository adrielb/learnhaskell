data Name = Name String
data Quest = Quest String
data Color = Color String

data Knight = Knight { name :: Name,
                       quest :: Quest,
                       favoriteColor :: Color }

showNameQuestion :: Name -> String
showNameQuestion (Name someName) = "What is your name? My name is " ++ someName

showQuestQuestion :: Quest -> String
showQuestQuestion (Quest someQuest) = "What is your quest? " ++ someQuest

showColorQuestion :: Color -> String
showColorQuestion (Color someColor) = "What is your favorite color? " ++ someColor

showCharacter :: Knight -> String
showCharacter knight = showNameQuestion (name knight) ++ "\n"
                       ++ showQuestQuestion (quest knight) ++ "\n"
                       ++ showColorQuestion (favoriteColor knight)

galaad = Knight {
  name = Name "Galaad, the pure",
  quest = Quest "To seek the Holy Grail",
  favoriteColor = Color "The blue... No the red! AAH"
  }

main = do
  putStrLn $ showCharacter galaad
