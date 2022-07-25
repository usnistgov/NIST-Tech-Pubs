setup:
	python3 -m pip install -r requirements.txt

# This updates the bibtex file in the parent directory. Is this a good idea?
bibtex:
	mkdir -p ../bibtex
	/bin/rm -f ../bibtex/nist_technical_pubs.bib
	python3 generate_bibtex.py ../xml/allrecords.xml ../bibtex/nist_technical_pubs.bib --nosubtitle
