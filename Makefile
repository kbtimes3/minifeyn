TEX = texfot pdflatex
TEXOPTS = -shell-escape
EXS = equation1 equation2 equation3 equation4 equation5 equation6
EXS := $(addsuffix .tex,$(EXS))
EXS := $(addprefix include/,$(EXS))

.PHONY: clean dev docs

clean:
	rm $(wildcard *.aux *.log *.out *.toc)

dev: devel.pdf

docs: manual.pdf

%.pdf: %.tex minifeyn.sty $(EXS)
	$(TEX) $(TEXOPTS) $<
	$(TEX) $(TEXOPTS) $<
