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
                   <xsl:if test="contains(doi, 'NIST.SP.800-')">
                       <xsl:text>800</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.1200-')">
                        <xsl:text>1200</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.1500-')">
                        <xsl:text>1500</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.1800-')">
                        <xsl:text>1800</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.1900-')">
                        <xsl:text>1900</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.2000-')">
                        <xsl:text>2000</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.2100-')">
                        <xsl:text>2100</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.2200-')">
                        <xsl:text>2200</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.250-')">
                        <xsl:text>250</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NBS.SP.250-')">
                        <xsl:text>250</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.260-')">
                        <xsl:text>260</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NBS.SP.260-')">
                        <xsl:text>260</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NBS.SP.300v')">
                        <xsl:text>300</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.400-')">
                        <xsl:text>400</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NBS.SP.400-')">
                        <xsl:text>400</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.480-')">
                        <xsl:text>480</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NBS.SP.480-')">
                        <xsl:text>480</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.500-')">
                        <xsl:text>500</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NBS.SP.500-')">
                        <xsl:text>500</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.700-')">
                        <xsl:text>700</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NBS.SP.700-')">
                        <xsl:text>700</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.823-')">
                        <xsl:text>823</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NBS.SP.823-')">
                        <xsl:text>823</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NIST.SP.960-')">
                        <xsl:text>960</xsl:text>
                    </xsl:if>
                    <xsl:if test="contains(doi, 'NBS.SP.960-')">
                        <xsl:text>960</xsl:text>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>ERROR</xsl:otherwise>
            </xsl:choose> 
        </xsl:attribute>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>
