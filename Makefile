TEX_DEPS := tex/copyright.tex tex/prelude.tex

IMAGE_DEPS := img/CommBadge.eps img/FateLight.eps

OUTPUT_DIR := output

LATEXMK_OPTS := -xelatex

all : Our\ Setting.pdf Star\ Trek\ Fate.pdf

%.pdf : %.tex $(TEX_DEPS) $(IMAGE_DEPS)
	latexmk -outdir=$(OUTPUT_DIR) -pdf -dvi- -ps- $(LATEXMK_OPTS) '$<'

