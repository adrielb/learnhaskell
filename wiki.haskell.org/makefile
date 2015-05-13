run: ./foldr_foldl.hs.x
	./$<

%.hs.x: %.hs
	ghc -Wall -o $@ $< 

clean:
	rm -f *.x *.hi *.o
