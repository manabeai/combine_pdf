#!/bin/bash

mkdir -p ../@combined_pdfs

for dir in */; do
    cd "${dir}" || continue
    name="${dir%/}"

    find . -maxdepth 1 -type f -name "*.pdf" | while read -r pdf_file; do
        qpdf --decrypt "$pdf_file" --replace-input
    done

    pdfunite ./*.pdf output.pdf

    mv -n output.pdf "../../@combined_pdfs/${name}.pdf"

    cd ..
done

