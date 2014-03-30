TEX_DEPS := tex/copyright.tex tex/prelude.tex

IMAGE_DEPS := img/CommBadge.eps img/ConstitutionClass.eps img/FateLight.eps \
    img/Federation.eps img/Phaser.eps

OUTPUT_DIR := output

LATEXMK_OPTS := -xelatex

.PHONY : all

all : $(OUTPUT_DIR)/Our_Setting.pdf $(OUTPUT_DIR)/Star_Trek_Fate.pdf

$(OUTPUT_DIR)/%.pdf : %.tex Makefile $(TEX_DEPS) $(IMAGE_DEPS)
	latexmk -outdir=$(OUTPUT_DIR) -pdf -dvi- -ps- $(LATEXMK_OPTS) '$<'

