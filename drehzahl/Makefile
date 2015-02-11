DOCUMENT = drehzahl

.PHONY: all clean

all: 
	pdflatex $(DOCUMENT).tex
	#bibtex   niveau.aux
	pdflatex $(DOCUMENT).tex
	pdflatex $(DOCUMENT).tex
	pdflatex $(DOCUMENT).tex

clean:
	rm -f *.aux
	rm -f *.bbl
	rm -f *.blg
	rm -f *.log
	rm -f *.out
	rm -f *.toc
	rm -f *.lot
	rm -f *.lof

