This NIST Technical Series Publication Metadata readme.txt file was generated on 20230404 by Kathryn Miller


-------------------
GENERAL INFORMATION
-------------------


Name: NIST Technical Series Publication Metadata 


Format: XML and TXT


Author Information

   Contact Information
        Name: Kathryn Miller
           Institution: NIST
           Address: 100 Bureau Drive Stop 2500 Gaithersburg, MD 20899
           Email: kathryn.miller@nist.gov


Date of data collection: 20230404

--------------------------
SHARING/ACCESS INFORMATION
-------------------------- 

Are there any restrictions or guidelines on how to use the data, (ex. information about access restrictions based on privacy, security, or other policies)?
No


Is there a documentary standard that applies to this dataset? 
http://www.crossref.org/qrschema/3.0
http://www.w3.org/2001/XMLSchema-instance
http://www.crossref.org/schemas/crossref_query_output3.0.xsd


Links to other publicly accessible locations of the data: https://pages.nist.gov/NIST-Tech-Pubs/ , https://github.com/usnistgov/NIST-Tech-Pubs



Was data derived from another source? (example, Open FEMA)
           If yes, list source(s): doi.crossref.org 


Recommended citation for the data:

NIST Research Library (2023) NIST Technical Series Publication Metadata. (National Institute of Standards and Technology, Gaithersburg, MD) https://doi.org/10.18434/M32192


---------------------
DATA & FILE OVERVIEW
---------------------


File List
   A. Filename: allrecords.xml       
      Short description: Metadata deposited with Crossref for all final NIST Technical Series publications with public Digital Object Identifiers. Schema is adapted from the XSD schema for CrossRef XML based queries (3.0).


        
   B. Filename: NIST_Tech_Pubs_all.txt       
      Short description: Metadata deposited wtih CrossRef for all final NIST Technical publications with public Digital Object Identifiers. Transformed from XML to TXT using a vertical bar (|) as a delimiter.         


   
Relationship between files: allrecords.xml was transformed to NIST_Tech_Pubs_all.txt using an XSLT that pulled the following fields into a text-based format:

Series|Report Number|Month Published|Year Published|Title|Authors|OU|DOI|URL



--------------------------
METHODOLOGICAL INFORMATION
--------------------------


 Description of methods used for collection/generation of data: 
	1. Retrive list of all DOIs deposited with CrossRef
		a) HTTPS CrossRef Query https://api.crossref.org/prefixes/10.6028/works?filter=type:report
		b) convert JSON to XML using any means (example: https://www.freeformatter.com/json-to-xml-converter.html)
		c) Run a transform to pull just DOI fields into a txt file
	2. Use list of DOIs to submit a DOI-to-metadata batch query and retrive and save results as XML file. Instructions here: https://support.crossref.org/hc/en-us/articles/215007943-DOI-to-metadata-query
	

Methods for processing the data: 
	1. In Query Results XML file, Delete everything before the <body> element; don't forget to delete the end tags as well. Also delete the <crossref> tags.
	2. Run an XSLT transformation to fill in the query key attribute with the series abbreviation
		a) series abbreviation is pulled from second part of DOI structure.
	3. Remove line breaks and white spaces using any means available.
	4. Run a transformation to get TXT file with all desired data fields.


 Instrument- or software-specific information needed to interpret the data:
	 XML and TXT files can be used using any open source product


24. Describe any quality-assurance procedures performed on the data:
	Data is imported into Excel and reviewed for errors/duplications. Since errors originated in CrossRef DOI deposits, updates to DOI metadata are deposited with CrossRef and data is retrived again through DOI-to-metadata queries.


People involved with sample collection, processing, analysis and/or submission:
	NIST Research Library employees are responsible for depositing metadata with Crossref, collecting metadata for analysis, and processing it for public consumption.


-----------------------------------------
DATA-SPECIFIC INFORMATION FOR: allrecords.xml
-----------------------------------------
see schema here for attributes and elements:
http://www.crossref.org/schemas/crossref_query_output3.0.xsd
<query-key> has been changed to series abbreviation key.

-----------------------------------------
DATA-SPECIFIC INFORMATION FOR: NIST_Tech_Pubs_all.txt 
-----------------------------------------

Series = NIST Technical Series abbreviation
Report Number = NIST Technical Series report number
Month Published = first month published
Year Published = first year published
Title = full title
Authors = all authors
OU = NIST operating unit / office / lab
DOI = CrossRef DOI
URL = most recent URL of the PDF