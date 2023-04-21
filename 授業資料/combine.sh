#!/bin/bash

mkdir -p ../@combined_pdfs

for file in `ls -d */`
do 

    cd ${file}
    name=${file/%?/}
    
    for pdfs in `ls |grep "pdf"`
    do 
        qpdf --decrypt ${pdfs} --replace-input
    done
 
    pdfunite *.pdf output.pdf
    mv output.pdf ../../@combined_pdfs/${name}.pdf -n
    cd ..
    
done
