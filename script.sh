#!/bin/bash
find -type f \( -iname "*.pdf" ! -iname "merged.pdf" \)| cut -c 3- > /tmp/pdf
awk '{ print "\n\hyperlink{page.1}{click here to go to table of contents}\n\section{"$0"}\n\includepdf[pages=-]{"$0"}" }' /tmp/pdf > /tmp/latex;
echo -e '\n\\end{document}' >> /tmp/latex
cp baseLatexFile /tmp/merged.tex
cat /tmp/latex >> /tmp/merged.tex 
mv /tmp/merged.tex .
pdflatex -synctex=1 -interaction=nonstopmode "merged".tex
pdflatex -synctex=1 -interaction=nonstopmode "merged".tex

