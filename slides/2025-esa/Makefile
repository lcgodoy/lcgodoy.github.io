source := $(wildcard *.qmd)
out := $(patsubst %.qmd,%.html,$(source))
bib := $(wildcard *.bib)

.PHONY: all
all: build

preview: $(source) $(bib)
	@quarto preview $<


build: $(source) $(bib)
	@quarto render $<

.PHONY: clean
clean:
	rm -rf $(out)\
	  *~ .*~ .\#* .Rhistory *.aux *.bbl *.blg *.out *.log *.toc\
	  *.fff *.fdb_latexmk *.fls *.ttt *diff* *oldtmp* *.docx \
	  main-full* main-blind*
