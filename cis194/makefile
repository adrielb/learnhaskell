run: ./01-intro.hs.x
	./$<

%.hs.x: %.hs
	ghc -Wall -o $@ $< 

clean:
	rm -f *.x *.hi *.o
