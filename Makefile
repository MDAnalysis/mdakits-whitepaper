NAME := main
TEX := $(NAME).tex
PDF := $(NAME).pdf
BIB := zotero-mdanalysis.bib

# currently using biblatex, replace with bibtex otherwise
BIBTEX := bibtex
LATEX := pdflatex -shell-escape

%.pdf : %.tex
	$(LATEX) $<
	-$(BIBTEX) $(basename $<)
	$(LATEX) $<
	$(LATEX) $<

.phony: all see clean clean-all

all: $(PDF) $(BIB)

see: $(PDF)
	test "`uname`" == "Darwin" && open $<

clean:
	-rm $(NAME).{aux,bbl,bcf,log,blg,pyg,toc,out,run.xml} *~

clean-all: clean
	-rm $(PDF)
