setup:
	python3 -m pip install -r requirements.txt

bibtex:
	mkdir -p ../bibtex
	/bin/rm -f ../bibtex/nist_technical_pubs.bib
	python3 generate_bibtex.py ../xml/allrecords.xml ../bibtex/nist_technical_pubs.bib --nosubtitle
