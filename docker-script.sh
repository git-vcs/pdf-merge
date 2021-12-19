#!/bin/bash
ls pdfmerge/
cp pdf-merge/script.sh pdfmerge/
cp pdf-merge/base.tex pdfmerge/
ls pdfmerge/
cd pdfmerge/
./script.sh
# for some reason the docker version needs to compile the file twice to get the table of contents 
pdflatex -synctex=1 -interaction=nonstopmode merged.tex
