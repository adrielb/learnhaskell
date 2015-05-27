run: ./FixLines.hs.x
	./$< in.txt out.txt

InteractWith: ./InteractWith.hs.x 
	./$< in.txt out.txt

%.hs.x: %.hs
	ghc -Wall -o $@ $< 

clean:
	rm -f *.x *.hi *.o
