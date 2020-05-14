<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:output method="text" encoding="UTF-8"/>
    
  
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="body">
        <xsl:for-each select="query">
            <xsl:result-document href="{concat('../bib/bibtex', substring-after(doi_record/report-paper/report-paper_metadata/doi_data/doi, '10.6028/'), '.bib')}">
                <xsl:call-template name="bibtex"/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
   
    <xsl:template name="bibtex">
    <xsl:call-template name="techreport"/>
    <xsl:apply-templates select="doi_record/report-paper/report-paper_metadata/titles"/>
    <xsl:apply-templates select="doi_record/report-paper/report-paper_metadata/contributors/person_name"/>
    <xsl:call-template name="date"/>
    <xsl:apply-templates select="doi_record/report-paper/report-paper_metadata/publisher/publisher_name"/>
    <xsl:apply-templates select="doi_record/report-paper/report-paper_metadata/publisher/publisher_place"/>
    <xsl:apply-templates select="doi_record/report-paper/report-paper_metadata/publisher_item/item_number"/>
    <xsl:apply-templates select="doi_record/report-paper/report-paper_metadata/doi_data/doi"/>
    <xsl:text>}</xsl:text>
    
    </xsl:template>
<xsl:template name="techreport">
<xsl:text>@techreport{</xsl:text>
    <xsl:value-of select="doi_record/report-paper/report-paper_metadata/publisher_item/item_number"/><xsl:text>,</xsl:text>
    <xsl:text>
</xsl:text>
</xsl:template>
    
    <xsl:template match="titles">
        <xsl:text>title = {</xsl:text>
        <xsl:value-of select="title"/><xsl:text> </xsl:text> 
        <xsl:value-of select="subtitle"/>
        <xsl:text>},</xsl:text>
        <xsl:text>
</xsl:text>
    </xsl:template>   
    
    <xsl:template match="person_name">
        <xsl:text>author = {</xsl:text>
        
        <xsl:value-of select="surname"/><xsl:text>, </xsl:text><xsl:value-of select="given_name"/>
        <xsl:text>},</xsl:text>
        <xsl:text>&#x000a;</xsl:text>
    </xsl:template>
    
    <xsl:template name="date">
        <xsl:text> year = {</xsl:text>
        <xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/>
        <xsl:text>},</xsl:text>
        <xsl:text>
</xsl:text>
    </xsl:template>
    
    <xsl:template match="publisher_name">
        <xsl:text>institution = {</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>},</xsl:text>
        <xsl:text>
</xsl:text>
    </xsl:template>
    
    <xsl:template match="publisher_place">
        <xsl:text>address= {</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>},</xsl:text>
        <xsl:text>
</xsl:text>
    </xsl:template>
    
        <xsl:template match="item_number">
        <xsl:text>number = {</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>},</xsl:text>    
        <xsl:text>
</xsl:text>
    </xsl:template> 
          
    <xsl:template match="doi">
        <xsl:text>DOI = {</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>},</xsl:text>
        <xsl:text>
</xsl:text>
    </xsl:template>
        
  
</xsl:stylesheet>