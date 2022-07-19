import xml.etree.ElementTree as ET
from bibtexparser.bwriter import BibTexWriter
from bibtexparser.bibdatabase import BibDatabase
import json
import logging


class NoDOIException(Exception):
    pass


TITLE='title'
SUBTITLE = 'subtitle'
DOI = 'doi'
URL = 'url'

# Translate XML tag to BiBTeX tag
TAG_XLATE = [(TITLE, TITLE),
             (SUBTITLE, SUBTITLE),
             (DOI, DOI),
             ('year', 'year'),
             ('institution_name', 'institution'),
             ('publisher_name', 'publisher'),
             ('publisher_place', 'address'),
             ('resource', URL),
             ]

def show(obj):
    ET.indent(obj)
    print(ET.tostring(obj).decode('utf-8'))

def get_text(node, tag):
    try:
        return node.find(f".//{tag}").text
    except AttributeError:
        return ""

SUBSTITUTIONS = [
    (" ", r""),                 # this seems to be an error in the file
    ("_", r"\_"),               # this is a real underbar
    (u"\uFFFD", r""),           # remove Unicode replacement character
    (u"\u0081", r"\textbullet"),
    ("á", r"\'{a}"),
    ("ä", r'\"{a}'),
    ("é", r"\'{e}"),
    ("í", r"\'{i}"),
    ("Ì", r"\`{I}"),
    ("ö", r'\"{o}'),
    ("ó", r"\'{o}"),
    ("ú", r"\'{u}"),
    ("ü", r'\"{u}'),
    ("α", r"$\alpha$"),
    ("π", r"$\pi$"),
    ("^", r"\verb!^!"),
    ("#", r"\#"),
    ("ᵒ", r"$^{\circ}$"),
    ("⁰", r"\textsuperscript{0}"),
    ("¹", r"\textsuperscript{1}"),
    ("²", r"\textsuperscript{2}"),
    ("³", r"\textsuperscript{3}"),
    ("⁴", r"\textsuperscript{4}"),
    ("⁵", r"\textsuperscript{5}"),
    ("⁶", r"\textsuperscript{6}"),

    ("⁺", r"\textsuperscript{+}"),
    ("₀", r"\textsuperscript{0}"),
    ("₁", r"\textsuperscript{1}"),
    ("₂", r"\textsuperscript{2}"),
    ("₃", r"\textsuperscript{3}"),
    ("₄", r"\textsuperscript{4}"),
    ("₅", r"\textsuperscript{5}"),
    ("ᵪ", r"\textsubscript{x}"),
    ("ℓ", r"$\mathscr{l}$"),
    ("Σ", r"$\Sigma$"),
    ("μ", r"$\mu$"),

    # These are not satisfactgory:
    ("ỳ", "\'{y}"),
    ("ư", "u"),
    ("ẫ", "a"),
    ("ề", "e"),
    ("ê", r"\^{e}"),
    ("ầ", "a"),
    ("â", r"\^{a}"),
    ("ớ", "o"),
    ("ủ", "u"),
    ("đ", "d"),
    ("ố", "o"),
    ("á", r"\'{a}"),
    ("à", r"\`{a}"),
    ("ệ", "e"),
    ("ụ", "u"),
    ("ậ", "a"),
    ("ồ", "o"),
    ("ỗ", "o"),

]

def latex_recode(txt):
    """Handle a few Unicode items that are in the bibliographic database which are not handled by LaTeX"""
    #if txt.startswith("transformation coefficients"):
    #    print(txt)
    for (old,new) in SUBSTITUTIONS:
        txt = txt.replace(old,new)
    return txt

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

    # Recode the fields as necessary
    for key in ret.keys():
        if key in [DOI,URL]:         # do not recode DOI or URL
            continue
        ret[key] = latex_recode( ret[key] )

    try:
        ret['ID'] = ret[DOI]
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

    seen_doi = set()
    for node in tree.findall(".//doi_record"):
        try:
            entry = xml_to_dict(node)
            if nosubtitles and SUBTITLE in entry:
                if entry[TITLE].endswith(": "):
                    entry[TITLE] = entry[TITLE] + entry[SUBTITLE]
                else:
                    entry[TITLE] = entry[TITLE] + ": " + entry[SUBTITLE]
                del entry[SUBTITLE]
            if entry[DOI] in seen_doi:
                logging.warning("DOI %s appears twice in input file",entry[DOI])
                continue
            db.entries.append(entry)
            seen_doi.add( entry[DOI] )
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
