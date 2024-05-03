<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:marc="http://www.loc.gov/MARC21/slim">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <marc:collection xmlns="http://www.loc.gov/MARC21/slim">
            <xsl:apply-templates/>
        </marc:collection>
    </xsl:template>
    
    <xsl:template match="record">
        <marc:record>
            <!-- Copying leader -->
            <marc:leader>
                <xsl:value-of select="leader"/>
            </marc:leader>
            <!-- Copying controlfields -->
            <xsl:for-each select="controlfield">
                <marc:controlfield tag="{@tag}">
                    <xsl:value-of select="."/>
                </marc:controlfield>
            </xsl:for-each>
            <!-- Copying datafields -->
            <xsl:for-each select="datafield">
                <marc:datafield tag="{@tag}" ind1="{@ind1}" ind2="{@ind2}">
                    <xsl:for-each select="subfield">
                        <marc:subfield code="{@code}">
                            <xsl:value-of select="."/>
                        </marc:subfield>
                    </xsl:for-each>
                </marc:datafield>
            </xsl:for-each>
        </marc:record>
    </xsl:template>
    
</xsl:stylesheet>
