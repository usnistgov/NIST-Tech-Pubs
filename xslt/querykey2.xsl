<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output omit-xml-declaration="yes" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="query">
        <xsl:copy>
            
        <xsl:attribute name="key">
            <xsl:choose>  
                <xsl:when test="doi">
                    <xsl:if test="contains(doi, 'NIST.')">
            <xsl:value-of select="substring-before(
                        substring-after(doi, 'NIST.'), '.')"/>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NBS.')">
                    <xsl:value-of select="substring-before(
                        substring-after(doi, 'NBS.'), '.')"/>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>ERROR</xsl:otherwise>
            </xsl:choose> 
        </xsl:attribute>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
