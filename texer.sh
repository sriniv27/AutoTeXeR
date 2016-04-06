#!/usr/bin/env bash

# Functions go here




# Actual code

## Set up working directory
echo "\t Welcome to AutoTeXeR. I will be your guide.\n\n\n"
read -p "Are you in the directory you want to be? If yes press ENTER else type in the path of the directory you want to work in: " directory;
directory=${directory-.}
if [ -d "$directory" ];
then
    echo "Found $directory";
else
    read -p "Directory not found. Do you want to create it? [yn] " yn;
    case $yn in
        [yY]*)mkdir -p $directory;;
        [nN]*) echo "Nothing created. Defaulting to current directory";;
    esac
fi

## Select compiler to use
compilers=("latex" "xelatex" "pdflatex" "latexmk")

PS3="Select preferred compilation method: "
select texer in "${compilers[@]}";
do
    case $texer in
        "latex")echo "$texer";break
                ;;
        "pdflatex")break
                   ;;
        "latexmk")break
                  ;;
        "xelatex") break;
                   ;;
        *)echo "Type in a number from the options above.";
    esac
done
