<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output method="text" encoding="UTF-8" indent="no"/>

    <xsl:variable name="delimiter" select="'|'"/>
    

    <xsl:template match="/">

        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="body">
        <xsl:text>Series</xsl:text><xsl:value-of select="$delimiter"/><xsl:text>Report Number</xsl:text><xsl:value-of select="$delimiter"/><xsl:text>Month Published</xsl:text><xsl:value-of select="$delimiter"/><xsl:text>Year Published</xsl:text><xsl:value-of select="$delimiter"/><xsl:text>Title</xsl:text><xsl:value-of select="$delimiter"/><xsl:text>Authors</xsl:text><xsl:value-of select="$delimiter"/><xsl:text>OU</xsl:text><xsl:value-of select="$delimiter"/><xsl:text>DOI</xsl:text><xsl:value-of select="$delimiter"/><xsl:text>URL</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:strip-space elements="titles"/>
    <xsl:template match="query">
        <xsl:value-of
            select="@key"/> <xsl:value-of select="$delimiter"/><xsl:call-template name="reportnum"/> <xsl:value-of select="$delimiter"/><xsl:value-of
            select="doi_record/report-paper/report-paper_metadata/publication_date/month"
            /> <xsl:value-of select="$delimiter"/><xsl:value-of
            select="doi_record/report-paper/report-paper_metadata/publication_date/year"
            /> <xsl:value-of select="$delimiter"/><xsl:call-template name="title"/> <xsl:value-of select="$delimiter"/><xsl:call-template name="authors"/> <xsl:value-of select="$delimiter"/><xsl:call-template name="OU"/> <xsl:value-of select="$delimiter"/><xsl:value-of select="doi_record/report-paper/report-paper_metadata/doi_data/doi"
            /> <xsl:value-of select="$delimiter"/><xsl:value-of
            select="doi_record/report-paper/report-paper_metadata/doi_data/resource"/>
    </xsl:template>
    <xsl:template name="reportnum">
        <xsl:for-each select="doi_record/report-paper/report-paper_metadata/publisher_item">
            <xsl:value-of select="item_number"/>
            <xsl:value-of select="identifier"/>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="authors">
        <xsl:for-each
            select="doi_record/report-paper/report-paper_metadata/contributors/person_name">
            <xsl:value-of select="surname"/><xsl:text>,</xsl:text><xsl:value-of select="given_name"/>
            <xsl:if
                test="position() != last()"><xsl:text>;</xsl:text> </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="OU">
        <xsl:for-each
        select="doi_record/report-paper/report-paper_metadata/institution">
            <xsl:value-of select="institution_department"/>
            <xsl:if test="position() != last()">
                <xsl:text>,</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="title">       
        <xsl:for-each select="doi_record/report-paper/report-paper_metadata/titles">
            <xsl:value-of select="title"/><xsl:text>:</xsl:text><xsl:value-of select="subtitle"/>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
