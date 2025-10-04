EXTENSION=pdf

all: thesis.$(EXTENSION)
	firefox thesis.$(EXTENSION)

thesis.$(EXTENSION): main.typ template.typ bibliography.bib content/*.typ
	typst compile main.typ thesis.$(EXTENSION)

clean:
	rm thesis.$(EXTENSION)
