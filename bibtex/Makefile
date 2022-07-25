test_document.pdf: test_document.tex Makefile nist_technical_pubs.bib
	latexmk -pdf test_document.tex

clean:
	rm -f test_document.pdf
	rm -f *.{aux,bbl,blg,dvi,lof,lot,toc,fdb_latexmk,fls,log}
