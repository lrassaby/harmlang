harmlang
========
By Cyrus Cousins, Louis Rassaby, and Caleb Malchik
---
A language for music notation, transposition, and probabilistic generation. Built on Haskell's quasi-quotation.

To run:

	$ cabal configure
	$ cabal repl

You can then load and run example programs:

	*HarmLang.Interpreter> :l examples/stylisticinference.hs
	...
	*Examples.StylisticInference> main
	...
