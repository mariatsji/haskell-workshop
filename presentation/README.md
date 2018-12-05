## To create slides

    open https://github.com/jgm/pandoc/wiki/Using-pandoc-to-produce-reveal.js-slides
	stack install pandoc
	pandoc -t revealjs -s -o myslides.html myslides.md -V revealjs-url=https://revealjs.com

## To create pdf

	open https://pandoc.org/MANUAL.html#creating-a-pdf
	brew cask install mactex
	pandoc index.html --pdf-engine mactex -o test.pdf