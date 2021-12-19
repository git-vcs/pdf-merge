#!/usr/bin/env bash
set -euo pipefail

awk_script='
{
    print "\n\\hyperlink{page.1}{Click here to go to table of contents}"
    print "\n\\section{"$0"}"
    print "\n\\includepdf[pages=-, landscape=false, angle=0]{"$0"}"
};
END {
    print "\n\\end{document}"
}'

# Assemble LaTeX
cp base.tex /tmp/merged.tex
find . -type f \( -iname "*.pdf" ! -iname "merged.pdf" \) \
    | cut -c 3- \
    | awk "$awk_script" >> /tmp/merged.tex
mv /tmp/merged.tex .

# Render PDF
pdflatex -synctex=1 -interaction=nonstopmode merged.tex
