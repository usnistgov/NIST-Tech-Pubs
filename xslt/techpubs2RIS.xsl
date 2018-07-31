<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:output method="text" encoding="UTF-8"/>
    
  
   
    <xsl:template match="body">
        
        <xsl:apply-templates />
    </xsl:template>
   
   
    
<xsl:template match="query">
    <xsl:call-template name="TY"/>
    <xsl:apply-templates select="doi_record/report-paper/report-paper_metadata/titles"/>
    <xsl:apply-templates select="doi_record/report-paper/report-paper_metadata/contributors/person_name"/>
    <xsl:call-template name="date"/>
    <xsl:apply-templates select="doi_record/report-paper/report-paper_metadata/publisher/publisher_name"/>
    <xsl:apply-templates select="doi_record/report-paper/report-paper_metadata/publisher/publisher_place"/>
    <xsl:apply-templates select="doi_record/report-paper/report-paper_metadata/publisher_item/item_number"/>
    <xsl:apply-templates select="doi_record/report-paper/report-paper_metadata/doi_data/doi"/>
    <xsl:text>ER  - </xsl:text>
    </xsl:template>
    
<xsl:template name="TY">
<xsl:text>TY  - RPRT</xsl:text>
    <xsl:text>
</xsl:text>
</xsl:template>
    
    <xsl:template match="titles">
        <xsl:text>TI  - </xsl:text>
        <xsl:value-of select="title"/><xsl:text> </xsl:text> 
        <xsl:value-of select="subtitle"/>
        <xsl:text>
</xsl:text>
    </xsl:template>   
    
    <xsl:template match="person_name">
        <xsl:text>AU  - </xsl:text>
        
        <xsl:value-of select="surname"/><xsl:text>, </xsl:text><xsl:value-of select="given_name"/>
        <xsl:text>&#x000a;</xsl:text>
    </xsl:template>
    
    <xsl:template name="date">
        <xsl:text>PY  - </xsl:text>
        <xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/>
        <xsl:text>
</xsl:text>
        <xsl:text>DA  - </xsl:text>
        <xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/>/<xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/month"/>/<xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/day"/>
        <xsl:text>
</xsl:text>
    </xsl:template>
    
    <xsl:template match="publisher_name">
        <xsl:text>PB  - </xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>
</xsl:text>
    </xsl:template>
    
    <xsl:template match="publisher_place">
        <xsl:text>CY  - </xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>
</xsl:text>
    </xsl:template>
    
        <xsl:template match="item_number">
        <xsl:text>SN  - </xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>
</xsl:text>
    </xsl:template> 
          
    <xsl:template match="doi">
        <xsl:text>DO  - </xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>
</xsl:text>
    </xsl:template>
  
</xsl:stylesheet>