run: ./1_sum.hs.x
	./$<

%.hs.x: %.hs
	ghc -Wall -o $@ $< 

clean:
	rm -f *.x *.hi *.o
