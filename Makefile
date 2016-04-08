PAPER=test
all:
	 latex --ps $(PAPER).tex
clean:
	 rm *.aux *.bbl *.log *.out
