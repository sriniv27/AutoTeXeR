# AutoTeXeR

AutoTeXeR is essentially a BASH script that works to generate Makefiles for a LaTeX project and optionally scaffold a document template if the user so chooses for a new project.  

## Existing Features:
1. Ability to select compiler (default option is latexmk)
2. Optionally generate a target to clean build files (default option is NO)
3. Look for a specified .tex document and if absent, create said document

## In the pipeline
**migrate echo to printf for consistent shell agnostic performance**  

1. More interactive and user friendly interface
2. Continuous preview option for all compilers (currently only works for latexmk)
3. Generate a more finely tailored makefile for each LaTeX compiler
4. Add make options depending on the need/use of a .bib file
5. Include a user-editable list of default packages to use when scaffolding the document

## Installation
1. Clone the repo
2. Symlink texmake.sh to /usr/bin or your choice of folder in your PATH (this is only a matter of convenience so it can be called from anywhere)
3. run texmake.sh with an optional argument of directory you want to populate (default is the pwd)
4. Follow the instructions!

I understand the code is a bit messy. I'll clean it up once some better skeleton functionality is in place.
Feature requests, code improvements and pull requests to implement the same are always appreciated.
