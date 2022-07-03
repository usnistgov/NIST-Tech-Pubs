import sys
import xml.etree.ElementTree as ET
from bibtexparser.bwriter import BibTexWriter
from bibtexparser.bibdatabase import BibDatabase

TAG_XLATE = [('title', 'title'),
             ('subtitle', 'subtitle')
             ]

def xml_to_dict(node):
    """Returns a dict from the XML"""
    ret = dict()
    for (xml_tag, bibtex_tag) in TAG_XLATE:
        tags = node.findall(f".//{xml_tag}")
        if tags:
            ret[bibtex_tag] = tags[0].text
    return ret


def generate(in_fname,out_fname):
    tree = ET.parse(in_fname)
    for node in tree.findall(".//doi_record"):
        t = node.findall(".//title")
        if(len(t)==1):
            continue
        print("Total number of titles:",len(t))
        for _ in t:
            print(_.text)
        print("")

if __name__=="__main__":
    import argparse
    a = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter,
                                description="Generate BiBTeX file from NIST XML")
    a.add_argument("infile", help="Input file")
    a.add_argument("outfile", help="Output file")
    args = a.parse_args()
    generate(args.infile, args.outfile)
