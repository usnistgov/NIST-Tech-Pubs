import xml.etree.ElementTree as ET
from bibtexparser.bwriter import BibTexWriter
from bibtexparser.bibdatabase import BibDatabase
import json


class NoDOIException(Exception):
    pass


TITLE='title'
SUBTITLE = 'subtitle'

# Translate XML tag to BiBTeX tag
TAG_XLATE = [(TITLE, TITLE),
             (SUBTITLE, SUBTITLE),
             ('doi', 'doi'),
             ('year', 'year'),
             ('institution_name', 'institution'),
             ('publisher_name', 'publisher'),
             ('publisher_place', 'address'),
             ('resource', 'url'),
             ]

def show(obj):
    ET.indent(obj)
    print(ET.tostring(obj).decode('utf-8'))

def get_text(node, tag):
    try:
        return node.find(f".//{tag}").text
    except AttributeError:
        return ""

def xml_to_dict(node):
    """Returns a dict from the XML"""
    ret = dict()
    ret['ENTRYTYPE'] = 'misc'

    # Do the simple maps
    for (xml_tag, bibtex_tag) in TAG_XLATE:
        tag = node.find(f".//{xml_tag}")
        if tag is not None and tag.text is not None:
            ret[bibtex_tag] = tag.text.replace('&',r'\&').replace(' :',': ')

    # Get authors or editors
    author = ""
    for person in node.find(".//contributors").findall("person_name"):
        name = (get_text(person, "given_name") + " " + get_text(person,"surname")).strip()
        if author:
            author += " and "
        author += name
    ret['author'] = author

    try:
        ret['ID'] = ret['doi']
    except KeyError:
        print("No DOI in:")
        show(node)
        raise NoDOIException()
    return ret


def generate(in_fname, out_fname, doi=None, nosubtitles=False):
    db = BibDatabase()
    tree = ET.parse(in_fname)
    if doi:
        obj = tree.find(f'.//query/doi[. = "{doi}"]/..')
        if not obj:
            raise KeyError(doi)
        print(json.dumps(xml_to_dict(obj),indent=4))
        return

    for node in tree.findall(".//doi_record"):
        try:
            entry = xml_to_dict(node)
            if nosubtitles and SUBTITLE in entry:
                if entry[TITLE].endswith(": "):
                    entry[TITLE] = entry[TITLE] + entry[SUBTITLE]
                else:
                    entry[TITLE] = entry[TITLE] + ": " + entry[SUBTITLE]
                del entry[SUBTITLE]
            db.entries.append(entry)
        except NoDOIException:
            pass

    writer = BibTexWriter()
    with open(out_fname,"w") as out:
        out.write(writer.write(db))
    return

if __name__=="__main__":
    import argparse
    a = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter,
                                description="Generate BiBTeX file from NIST XML")
    a.add_argument("infile", help="Input file")
    a.add_argument("outfile", help="Output file")
    a.add_argument("--doi", help="Only generate output for this doi")
    a.add_argument("--nosubtitles", help="Do not use subtitle attribute", action="store_true")
    args = a.parse_args()
    generate(args.infile, args.outfile, doi=args.doi, nosubtitles=args.nosubtitles)
