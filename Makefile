PAPER=paper
all:
	 pdflatex $(PAPER).tex
clean:
	 rm *.aux *.bbl *.log *.out
