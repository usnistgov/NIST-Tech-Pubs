<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="query">
        <xsl:apply-templates select="doi_record/report-paper/report-paper_metadata/contributors/person_name"/>
        <xsl:call-template name="date"/>
        <xsl:call-template name="reportnumber"/>  
    </xsl:template>
 
    <xsl:template match="person_name"> 
        <xsl:value-of select="surname"/><xsl:text>, </xsl:text><xsl:value-of select="given_name"/>
        <xsl:text>&#x000a;</xsl:text>
    </xsl:template>
    
    <xsl:template name="date">
        <xsl:for-each select="doi_record/report-paper/report-paper_metadata/publication_date[1]">
            <xsl:value-of select="year"/>
        </xsl:for-each>  
        <xsl:text>
</xsl:text>
    </xsl:template>
    <xsl:template name="reportnumber">
        <xsl:choose>
            <xsl:when test="doi_record/report-paper/report-paper_metadata/publisher_item/item_number">
                <xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publisher_item/item_number"/>
            </xsl:when>
            <xsl:otherwise><xsl:value-of
                select="doi_record/report-paper/report-paper_metadata/publisher_item/identifier"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>
</xsl:text>
    </xsl:template>    
</xsl:stylesheet>