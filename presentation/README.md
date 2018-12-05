## To create slides

    open https://github.com/jgm/pandoc/wiki/Using-pandoc-to-produce-reveal.js-slides
	stack install pandoc
	pandoc -t revealjs -s -o index.html haskell.md -V revealjs-url=https://revealjs.com -V theme=solarized

## To create pdf

	open https://pandoc.org/MANUAL.html#creating-a-pdf
	brew cask install mactex
	(restart shell)
	pandoc index.html -o CheatSheet.pdf