<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="text" encoding="UTF-8" indent="no"/>



    <xsl:template match="/">

        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="body">
        <xsl:text>URL</xsl:text>|<xsl:text>PubType</xsl:text>|<xsl:text>seriesNumber</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:strip-space elements="titles title subtitle"/>
    <xsl:template match="query">
        <xsl:value-of
            select="doi_record/report-paper/report-paper_metadata/doi_data/resource"/>|>|<xsl:value-of
            select="@key"/>|<xsl:value-of
            select="doi_record/report-paper/report-paper_metadata/publisher_item/item_number"
            />
    </xsl:template>


</xsl:stylesheet>
