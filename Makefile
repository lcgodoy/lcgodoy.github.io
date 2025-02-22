all: publications
	@quarto render

style:=lcg-cv.csl

publications: pubs.bib $(style) lua-refs.lua
	@quarto pandoc -L lua-refs.lua \
		pubs.bib --csl=$(style) \
		-V --toc=false \
		--to=markdown-citations \
		-o publications.qmd
	@Rscript highlight-author.R \
		"Godoy, L. da C." "publications.qmd"

clean:
	rm -rf publications* *~
