#!/usr/bin/env sh


#Arguments
OUT_DIR="$1"

# default values if no arguments specified
OUT_DIR=${1:-.} #if none specified, create *TeX makefile in pwd


echo "Output Directory is $OUT_DIR"

#touch $OUT_DIR/Makefile

# Accept compiler as a typed argument in the terminal. Assumes that whatever is typed is a valid compiler. 
#TODO: Check if argument is a valid compiler before creating make target. 
echo "What's your preferred compiler(Default is LaTeXmk)?"
read -r COMPILER
COMPILER=${COMPILER:-latexmk}
case $COMPILER in
    latexmk) read -p "Would you like to enable continuous preview [Yes/No]?(Default is No)" ny;ny=${ny:-n};;
    pdflatex)ny=pdflatex;;
    *)ny=x;
esac

# also assumes all arguments are valid. Needs checks in place for valid output targets. 
echo "Preferred output file format (Default is PDF):"
read -r FORMAT
FORMAT=${FORMAT:-pdf}
echo "Compiler Set to $COMPILER to output to $FORMAT file."

echo "What's the title of your document? If it does not already exist, it will be created. Just the filename is enough the filetype '.tex' is not needed"
read FILENAME
FILENAME=${FILENAME:-paper}
if [ -e "$FILENAME.tex" ]
then
    echo "$FILENAME found, Continuing...."
else
    touch $OUT_DIR/$FILENAME.tex
    echo "$FILENAME.tex created in $OUT_DIR"
fi

# The first line of the makefile sets the make target
case $ny in
    [yY]*)echo "PAPER=$FILENAME\n all: ## Compile Paper\n\t$COMPILER --$FORMAT --pvc \$(PAPER)">Makefile ;break;;
    [nN]*)echo "PAPER=$FILENAME\n all: ## Compile Paper\n\t$COMPILER --$FORMAT \${PAPER}">Makefile;break ;;
    pdflatex)echo "PAPER=$FILENAME \n all: ## Compile Paper\n\t$COMPILER \$(PAPER)">Makefile;break ;;
    x)echo "PAPER=$FILENAME\n all: ## Compile Paper\n\t$COMPILER --$FORMAT \${PAPER}">Makefile;break ;;
esac

# optional second line to autoclean aux, bbl, out, fls, etc. 
# TODO add options to select which filetypes to clean. Mo foreseeable reason, but I suspect it would be nice to have
echo "Would you like to autoclean generated build files?[Yes/No](default is no)"
read TOCLEAN
TOCLEAN=${TOCLEAN-n}

case $TOCLEAN in
    [yY]*)echo "clean:\n\trm *.aux *.bbl *.log *.out">>Makefile;;
    [nN]*)echo "Build files will need to be removed manually, if you so wish.";break;;
esac

# Make a basic document if none existed

# TODO Add default list of packages, ability to add new packages by space separated arguments 
# Would be nice if default packages were in a list in the same repo or project repo 
if [ ! -s "$FILENAME.tex" ]
then
    read -p "Select Document Class (default is ARTICLE)" DOC_CLASS
    DOC_CLASS=${DOC_CLASS:-article}
    read -p "Select Paper Type (default is letter)" PAPERDIM;PAPERDIM=${PAPERDIM:-letter}
    echo "\\documentclass[11pt,$PAPERDIM]{$DOC_CLASS}">$FILENAME.tex
    read -p "Document Title (Default is $FILENAME)" TITLE;TITLE=${TITLE:-$FILENAME};
    echo "\\\title{$TITLE}">>$FILENAME.tex
    read -p "Who's writing it? (Default is $USER)" AUTHOR;AUTHOR=${AUTHOR:-$USER};
    echo "\\\author{$AUTHOR}\n\\date{}">>$FILENAME.tex
    echo "\\\begin{document}\n\\maketitle\n\n\\end{document}">>$FILENAME.tex
else
    break;
fi
