# AutoTeXeR

AutoTeXeR is essentially a BASH script that works to generate Makefiles for a LaTeX project and optionally scaffold a document template if the user so chooses for a new project.  

## Existing Features:
1. Ability to select compiler (default option is latexmk)
2. Optionally generate a target to clean build files (default option is NO)
3. Look for a specified .tex document and if absent, create said document
4. Include a user-editable list of default packages to use when scaffolding the document

## In the pipeline
1. More interactive and user friendly interface
2. Generate a more finely tailored makefile for each LaTeX compiler
3. Add make options depending on the need/use of a .bib file

## Installation and Usage
1. Clone the repo ``git@github.com:sriniv27/AutoTeXer`` or fork it. 
2. Symlink texmake.sh to /usr/bin or your choice of folder in your PATH (this is only a matter of convenience so that it can be called from anywhere)
3. run ``~/<path>/<to>/<repo>/texmake.sh`` with an optional argument of directory (for example ``~/AutoTeXer/texmake.sh ~/Shiny_new_Paper`` ) you want to populate (default is the pwd)
4. Follow the instructions as they come up!   


### Using the packagelist  
**packagelist** is the list of packages you would normally want in any document you start. To add more packages to this list, open the file in your preferred text editor and add the name of the package in a new line without any blank lines between package names.   
   
I understand the code is a bit messy. I'll clean it up once some better skeleton functionality is in place.
Feature requests, code improvements and pull requests to implement the same are always appreciated.

## Contributing
1. Fork the repo
2. Submit changes as a PR with a description of what's being chanwged and why
