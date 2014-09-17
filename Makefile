TEX_DEPS := tex/copyright.tex tex/prelude.tex

IMAGE_DEPS := $(shell find img -type f)

OUTPUT_DIR := output

LATEXMK_OPTS := -xelatex -g

.PHONY : all clean

all : Our_Setting.pdf Star_Trek_Fate.pdf

$(OUTPUT_DIR) : Makefile
	mkdir -p $(OUTPUT_DIR)

%.pdf : %.tex Makefile $(OUTPUT_DIR) $(TEX_DEPS) $(IMAGE_DEPS)
	latexmk -outdir=$(OUTPUT_DIR) -pdf -dvi- -ps- $(LATEXMK_OPTS) '$<'
	cat $(OUTPUT_DIR)/'$@' >'$@'

clean :
	rm -r $(OUTPUT_DIR)

