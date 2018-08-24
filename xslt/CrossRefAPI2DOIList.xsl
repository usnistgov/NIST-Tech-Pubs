<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="root">
        <xsl:for-each select="message/items/element">
        <xsl:value-of select="DOI"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>