VERSION = 1.1

PDF = la-tc-v$(VERSION).pdf

SRC = LoongArch-toolchain-conventions-EN.adoc

PDF_THEME = themes/la-doc-pdf.yml

IMGS = images/compiler-isa-config-model-EN.svg

.PHONY: all clean

$(PDF): $(SRC) $(IMGS) $(PDF_THEME)
	cd "$$(realpath "`pwd`")"; \
	asciidoctor-pdf \
		-a compress \
		-a date="$(DATE)" \
		-a monthyear="$(MONTHYEAR)" \
		-a pdf-style="$(PDF_THEME)" \
		-a pdf-fontsdir=fonts \
		-a imagesdir=images \
		-v \
		$(SRC) -o $@

html: $(patsubst %.adoc, %.html, $(SRC))

%.html: %.adoc
	asciidoctor $^ -o $@

clean:
	-rm -rf $(patsubst %.adoc, %.html, $(SRC))
