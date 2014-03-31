TEX_DEPS := tex/copyright.tex tex/prelude.tex

IMAGE_DEPS := $(shell find img -type f)

OUTPUT_DIR := output

LATEXMK_OPTS := -xelatex -g

.PHONY : all

all : $(OUTPUT_DIR) $(OUTPUT_DIR)/Our_Setting.pdf $(OUTPUT_DIR)/Star_Trek_Fate.pdf

$(OUTPUT_DIR) : Makefile
	mkdir -p $(OUTPUT_DIR)

$(OUTPUT_DIR)/%.pdf : %.tex Makefile $(TEX_DEPS) $(IMAGE_DEPS)
	latexmk -outdir=$(OUTPUT_DIR) -pdf -dvi- -ps- $(LATEXMK_OPTS) '$<'

