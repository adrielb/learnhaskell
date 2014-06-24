-- should return "win"

selectWin1 = snd 

main1 = do
  print $ selectWin1 (1, "win")

selectWin2 = fst . fst

main2 = do
  print $ selectWin2 (( "win", "no" ), "not this one" )


selectWin3 = fst . snd . snd

main3 = do
  print $ selectWin3 ( 1, ("no", ("win", "almost")))

main = main1
