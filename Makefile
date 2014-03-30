TEX_DEPS := tex/copyright.tex tex/prelude.tex

IMAGE_DEPS := img/CommBadge.eps img/FateLight.eps

OUTPUT_DIR := output

LATEXMK_OPTS := -xelatex

.PHONY : all

all : $(OUTPUT_DIR)/Our_Setting.pdf $(OUTPUT_DIR)/Star_Trek_Fate.pdf

$(OUTPUT_DIR)/%.pdf : %.tex $(TEX_DEPS) $(IMAGE_DEPS)
	latexmk -outdir=$(OUTPUT_DIR) -pdf -dvi- -ps- $(LATEXMK_OPTS) '$<'

