This NIST Technical Series Publication Metadata readme file was generated on 20240501 by Kathryn Miller


-------------------
GENERAL INFORMATION
-------------------


Name: NIST Technical Series Publication Metadata 


Format: XML 


Author Information

   Contact Information
        Name: Kathryn Miller
           Institution: NIST
           Address: 100 Bureau Drive Stop 2500 Gaithersburg, MD 20899
           Email: kathryn.miller@nist.gov


Date of data collection: 20240501

--------------------------
SHARING/ACCESS INFORMATION
-------------------------- 

Are there any restrictions or guidelines on how to use the data, (ex. information about access restrictions based on privacy, security, or other policies)?
	No


Is there a documentary standard that applies to this dataset?
	MARCXML: The MARC 21 XML Schema at https://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd
	MODS: Metadata Object Description Schema at https://www.loc.gov/standards/mods/v3/mods-3-7.xsd


Links to other publicly accessible locations of the data: 
	https://pages.nist.gov/NIST-Tech-Pubs/ , https://github.com/usnistgov/NIST-Tech-Pubs



Was data derived from another source? (example, Open FEMA)
           No


Recommended citation for the data:

NIST Research Library (2024) NIST Technical Series Publication Metadata. (National Institute of Standards and Technology, Gaithersburg, MD) https://doi.org/10.18434/M32192


---------------------
DATA & FILE OVERVIEW
---------------------


File List
   A. Filename: allrecords.xml       
      Short description: Metadata created in ExLibris Catalog for all NIST Technical Series publications with public Digital Object Identifiers. MARCXML Schema.

   B. Filename: allrecords-MODS.xml       
      Short description: Metadata created in ExLibris Catalog for all NIST Technical Series publications with public Digital Object Identifiers. Transformed from MARCXML to MODS XML. 
 

--------------------------
METHODOLOGICAL INFORMATION
--------------------------


 Description of methods used for collection/generation of data: 
	1. Export MARC21 XML file for all NIST Technical Series Publications in ExLibris Alma Catalog
	

Methods for processing the data: 
	1. Run BIBLIOMARC21_to_MARC21XML.xsl to transform to valid XML and rename allrecords.xml
	2. Run MARC21slim2MODS3-7.xsl to transform allrecords.xml to allrecords-MODS.xml


Instrument- or software-specific information needed to interpret the data:
	 XML files can be used using any open source product


Describe any quality-assurance procedures performed on the data:
	Data is created by NIST Research Library cataloging team and QC'd by metadata librarian.


People involved with sample collection, processing, analysis and/or submission:
	NIST Research Library employees are responsible for creating NIST Technical Series publication metadata, collecting metadata for analysis, and processing it for public consumption.


-----------------------------------------
DATA-SPECIFIC INFORMATION FOR: allrecords.xml
-----------------------------------------
see schema here for attributes and elements:
https://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd

-----------------------------------------
DATA-SPECIFIC INFORMATION FOR: allrecords-MODS.xml
-----------------------------------------
see schema here for attributes and elements:
https://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd
https://www.loc.gov/standards/mods/v3/mods-3-7.xsd

