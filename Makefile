TEX_DEPS := tex/copyright.tex tex/prelude.tex tex/common.tex

IMAGE_DEPS := $(shell find img -type f)

OUTPUT_DIR := output

LATEXMK_OPTS := -xelatex -g

.PHONY : all archive clean

all : Our_Setting.pdf Star_Trek_Fate.pdf Character_Sheet.pdf

$(OUTPUT_DIR) : Makefile
	mkdir -p $(OUTPUT_DIR)

%.pdf : %.tex Makefile $(OUTPUT_DIR) $(TEX_DEPS) $(IMAGE_DEPS)
	latexmk -outdir=$(OUTPUT_DIR) -pdf -dvi- -ps- $(LATEXMK_OPTS) $<
	cat $(OUTPUT_DIR)/$@ >$@

archive: Star_Trek_Fate.zip

Star_Trek_Fate.zip : Our_Setting.pdf Star_Trek_Fate.pdf Character_Sheet.pdf
	zip $@ $^

clean :
	rm -r $(OUTPUT_DIR)

