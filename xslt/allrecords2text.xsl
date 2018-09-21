<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="text" encoding="UTF-8" indent="no"/>



    <xsl:template match="/">

        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="body">
        <xsl:text>DOI Created</xsl:text>|<xsl:text>DOI Last Updated</xsl:text>|<xsl:text>Series</xsl:text>|<xsl:text>Report Number</xsl:text>|<xsl:text>Year Published</xsl:text>|<xsl:text>Month Published</xsl:text>|<xsl:text>Title</xsl:text>|<xsl:text>Authors</xsl:text>|<xsl:text>OU</xsl:text>|<xsl:text>DOI</xsl:text>|<xsl:text>URL</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:strip-space elements="titles title subtitle"/>
    <xsl:template match="query">
        <xsl:value-of select="crm-item[9]"/>|<xsl:value-of select="crm-item[8]"/>|<xsl:value-of
            select="@key"/>|<xsl:value-of
            select="doi_record/report-paper/report-paper_metadata/publisher_item/item_number"
            />|<xsl:value-of
            select="doi_record/report-paper/report-paper_metadata/publication_date/year"
            />|<xsl:value-of
            select="doi_record/report-paper/report-paper_metadata/publication_date/month"
            />|<xsl:call-template name="title"/>|<xsl:call-template name="authors"/>|<xsl:value-of
            select="doi_record/report-paper/report-paper_metadata/institution/institution_department"
            />|<xsl:value-of select="doi_record/report-paper/report-paper_metadata/doi_data/doi"
            />|<xsl:value-of
            select="doi_record/report-paper/report-paper_metadata/doi_data/resource"/>
    </xsl:template>

    <xsl:template name="authors">
        <xsl:for-each
            select="doi_record/report-paper/report-paper_metadata/contributors/person_name">
            <xsl:value-of select="surname"/>, <xsl:value-of select="given_name"/><xsl:if
                test="position() != last()">; </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="title">

        <xsl:for-each select="doi_record/report-paper/report-paper_metadata/titles">
            <xsl:value-of select="title"/>
            <xsl:value-of select="subtitle"/>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
