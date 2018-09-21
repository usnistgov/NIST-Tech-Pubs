<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>
    
    <xsl:output indent="yes" />
    
    <xsl:template match="/">
        <xsl:copy-of select="body/query/doi_record/node()"/>
    </xsl:template>
  
</xsl:stylesheet>