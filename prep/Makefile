.PHONY: all clean

all: 
	pdflatex doc.tex
	#bibtex   doc.aux
	pdflatex doc.tex
	pdflatex doc.tex
	pdflatex doc.tex

clean:
	rm -f *.aux
	rm -f *.bbl
	rm -f *.blg
	rm -f *.log
	rm -f *.out
	rm -f *.toc
	rm -f *.lot
	rm -f *.lof

