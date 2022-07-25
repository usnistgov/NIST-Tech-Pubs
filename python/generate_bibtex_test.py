import generate_bibtex

import pytest
import xml.etree.ElementTree as ET
tree = ET.parse("/Users/simsong/gits/NIST-Tech-Pubs/xml/allrecords.xml")
sp800_177 = tree.find('.//query/doi[. = "10.6028/NIST.SP.800-177r1"]/..')

def test_xml_to_dict():
    # Validate the XML
    bibdict = generate_bibtex.xml_to_dict(sp800_177)
    assert(bibdict['title']=='Trustworthy email')
