<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output encoding="UTF-8" method="html" use-character-maps="m1"/>

    <xsl:character-map name="m1">
        <xsl:output-character character="&#127;" string=" "/>
        <xsl:output-character character="&#128;" string=" "/>
        <xsl:output-character character="&#129;" string=" "/>
        <xsl:output-character character="&#130;" string=" "/>
        <xsl:output-character character="&#131;" string=" "/>
        <xsl:output-character character="&#132;" string=" "/>
        <xsl:output-character character="&#133;" string=" "/>
        <xsl:output-character character="&#134;" string=" "/>
        <xsl:output-character character="&#135;" string=" "/>
        <xsl:output-character character="&#136;" string=" "/>
        <xsl:output-character character="&#137;" string=" "/>
        <xsl:output-character character="&#138;" string=" "/>
        <xsl:output-character character="&#139;" string=" "/>
        <xsl:output-character character="&#140;" string=" "/>
        <xsl:output-character character="&#141;" string=" "/>
        <xsl:output-character character="&#142;" string=" "/>
        <xsl:output-character character="&#143;" string=" "/>
        <xsl:output-character character="&#144;" string=" "/>
        <xsl:output-character character="&#145;" string=" "/>
        <xsl:output-character character="&#146;" string=" "/>
        <xsl:output-character character="&#147;" string=" "/>
        <xsl:output-character character="&#148;" string=" "/>
        <xsl:output-character character="&#149;" string=" "/>
        <xsl:output-character character="&#150;" string=" "/>
        <xsl:output-character character="&#151;" string=" "/>
        <xsl:output-character character="&#152;" string=" "/>
        <xsl:output-character character="&#153;" string=" "/>
        <xsl:output-character character="&#154;" string=" "/>
        <xsl:output-character character="&#155;" string=" "/>
        <xsl:output-character character="&#156;" string=" "/>
        <xsl:output-character character="&#157;" string=" "/>
        <xsl:output-character character="&#158;" string=" "/>
        <xsl:output-character character="&#159;" string=" "/>
    </xsl:character-map>


    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="body">

        <!-- creates the home page -->
        <xsl:result-document href="../public/index.html">
            <xsl:call-template name="html"/>
        </xsl:result-document>

        <!-- creates pages for each article type -->

        <xsl:for-each-group select="query" group-by="@key">
            <xsl:result-document href="{concat('../public/', current-grouping-key(), '.html')}">
                <xsl:call-template name="html">
                    <xsl:with-param name="report-type" select="current-grouping-key()"/>
                </xsl:call-template>
            </xsl:result-document>
        </xsl:for-each-group>




        <!-- creates page sorted by date  -->
        <xsl:result-document href="../public/date.html">
            <xsl:call-template name="html">
                <xsl:with-param name="report-type">date</xsl:with-param>
            </xsl:call-template>
        </xsl:result-document>


    </xsl:template>

    <xsl:template name="html">
        <xsl:param name="report-type"/>
        <html>
            <head>
                <title>NIST Technical Publications List</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" type="text/css" href="./css/reset.css"/>
                <link rel="stylesheet" type="text/css" href="./css/techpubs-html2.css"/>
                <link rel="stylesheet" type="text/css" href="./css/accordian.css"/>
            </head>
            <body>

                <div style="margin-left:25px; margin-top:25px">
                    <a href="https://inet.nist.gov/nvl">
                        <img src="NIST-research-library.png" height="79px" width="186px"
                            alt="Library logo" title="NIST Research Library" border="none"/>
                    </a>
                </div>
                <div id="container">
                    <header id="header">
                        <h1 id="title">NIST Technical Series Publication List</h1>

                    </header>
                    <!-- Navigation -->
                    <nav id="menu" class="clearfix">
                        <ul>
                            <li>
                                <a href="http://kmm5.ipages.nist.gov/TechPubs2HTML/">Home</a>
                            </li>
                            <li>
                                <a href="./date.html">View All Reports</a>
                            </li>
                            <li>
                                <a href="#top">Back to Top</a>
                            </li>
                        </ul>
                    </nav>



                    <!-- Main content -->

                    <xsl:choose>
                        <xsl:when test="$report-type = ''">
                            <section id="content">


                                <h4 class="welcome">Quick Links</h4>
                                <ul>
                                    <li>
                                        <a
                                            href="https://inet.nist.gov/library/publishing-support-nist-publications/nist-technical-series-publications"
                                            >How to Publish a Report</a>
                                    </li>
                                    <li>
                                        <a
                                            href="https://www.nist.gov/nist-research-library/nist-series-publications"
                                            >Series Descriptions</a>
                                    </li>
                                   

                                    <li>
                                        <a href="./date.html">View All Reports</a>
                                    </li>

                                    <li>
                                        <a href="#filter">Filter Reports by Series</a>
                                    </li>
                                    <li>
                                        <a href="./NIST_Tech_Pubs_MASTER.xlsx">Download Full List of
                                            Reports</a>
                                    </li>

                                </ul>

                                <h4 class="welcome">
                                    <p>NIST Technical Series publications are written by or for NIST
                                        and published by the NIST Research Library. These
                                        publications consist of technical reports, recommendations,
                                        practice guides, industry handbooks, and other similar
                                        technical documents intended for external distribution. All
                                        NIST Technical Series publications are assigned <a
                                            href="https://csrc.nist.gov/Publications/DOI">Digital
                                            Object Identifiers (DOIs)</a> to ensure continuing
                                        public access and deposited with the <a
                                            href="https://www.govinfo.gov/collection/nist">United
                                            States Government Publishing Office (GPO)</a> to ensure
                                        digital preservation.</p>

                                    <p> Note: This website can only be accessed when connected to
                                        the NIST network.</p>
                                </h4>


                            </section>
                        </xsl:when>
                        <xsl:when test="$report-type = 'date'">
                            <section id="content">
                                <xsl:apply-templates select="query">
                                    <xsl:sort order="descending"
                                        select="doi_record/report-paper/report-paper_metadata/publication_date/year"/>
                                    <xsl:sort order="descending"
                                        select="doi_record/report-paper/report-paper_metadata/publication_date/month"/>
                                    <xsl:sort order="descending"
                                        select="doi_record/report-paper/report-paper_metadata/publication_date/date"
                                    />
                                </xsl:apply-templates>
                            </section>
                        </xsl:when>
                        <xsl:otherwise>
                            <section id="content">
                                <h3 class="type-head">
                                    <xsl:attribute name="id" select="current-grouping-key()"/>
                                    <xsl:value-of select="current-grouping-key()"/>
                                </h3>
                                <xsl:for-each select="current-group()">
                                    <xsl:sort
                                        select="doi_record/report-paper/report-paper_metadata/publication_date/year"
                                        order="descending"/>
                                    <xsl:sort
                                        select="doi_record/report-paper/report-paper_metadata/publication_date/month"
                                        order="descending"/>
                                    <xsl:sort
                                        select="doi_record/report-paper/report-paper_metadata/publication_date/date"
                                        order="descending"/>
                                    <xsl:apply-templates select="."/>
                                </xsl:for-each>
                            </section>
                        </xsl:otherwise>
                    </xsl:choose>


                    <!-- Sidebar -->
                    <a name="filter"/>
                    <aside id="sidebar">
                        <br/>
                        <h3 class="art-title"> Filter by Series </h3>
                        <p>
                            <a href="./AMS.html">Advanced Manufacturing Series</a>
                        </p>
                        <p>
                            <a href="./BH.html">Building and Housing Reports</a>
                        </p>
                        <p>
                            <a href="./BMS.html">Building Materials and Structures Reports</a>
                        </p>
                        <p>
                            <a href="./BSS.html">Building Science Series</a>
                        </p>
                        <p>
                            <a href="./CIRC.html">Circulars</a>
                        </p>
                        <p>
                            <a href="./CIS.html">Consumer Information Series</a>
                        </p>
                        <p>
                            <a href="./CS.html">Commercial Standards</a>
                        </p>
                        <p>
                            <a href="./CSM.html">Commercial Standards Monthly</a>
                        </p>
                        <p>
                            <a href="./CSWP.html">Cybersecurity White Papers</a>
                        </p>
                        <p>
                            <a href="./EAB.html">Economic Analysis Briefs</a>
                        </p>
                        <p>
                            <a href="./FIPS.html">Federal Information Processing Standards
                                Publications</a>
                        </p>
                        <p>
                            <a href="./GCR.html">Grant/Contractor Reports</a>
                        </p>
                        <p>
                            <a href="./HB.html">Handbooks</a>
                        </p>
                        <p>
                            <a href="./IR.html">Interagency/Internal Reports</a>
                        </p>
                        <p>
                            <a href="./LCIRC.html">Letter Circular</a>
                        </p>
                        <p>
                            <a href="./MONO.html">Monographs</a>
                        </p>
                        <p>
                            <a href="./MP.html">Miscellaneous Publications</a>
                        </p>
                        <p>
                            <a href="./NCSTAR.html">National Construction Safety Team Act
                                Reports</a>
                        </p>
                        <p>
                            <a href="./NSRDS.html">National Standard Reference Data Series</a>
                        </p>
                        <p>
                            <a href="./OWMWP.html">Office of Weights and Measures White Papers</a>
                        </p>
                        <p>
                            <a href="./PC.html">Photographic Circulars</a>
                        </p>
                        <p>
                            <a href="./RPT.html">NBS Reports</a>
                        </p>
                        <p>
                            <a href="./SIBS.html">Special Interior Ballistics Studies</a>
                        </p>
                        <p>
                            <a href="./SP.html">Special Publications</a>
                        </p>
                        <p>
                            <a href="./TIBM.html">Technical Information on Building Materials</a>
                        </p>
                        <p>
                            <a href="./TN.html">Technical Notes</a>
                        </p>
                        <p>
                            <a href="./TTB.html">Technology Transfer Brief</a>
                        </p>

                        <!-- Sidebar content -->
                    </aside>

                    <!-- Footer -->
                    <footer id="footer" class="clearfix"> NIST Research Library&#160;&#124;&#160;<a
                            href="mailto:library@nist.gov">library@nist.gov</a>&#160;&#124;&#160;<a
                            href="https://www.nist.gov/nist-research-library"
                        >www.nist.gov/nvl</a></footer>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="query">


        <div class="report-paper">
            <span class="titles"><label class="label">Title:&#160;</label><xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/titles/title"
                    />&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/titles/subtitle"/></span>
            <br/>
            <span class="publication_date">
                <label class="label">Date&#160;Published:&#160;</label>
                <xsl:call-template name="date"/>
            </span>
            <br/>
            <span class="authors">
                <label class="label">Authors:&#160;</label>
                <xsl:apply-templates
                    select="doi_record/report-paper/report-paper_metadata/contributors"/>
            </span>
            <br/>
            <span class="report-number">
                <label class="label">Report&#160;Number:&#160;</label>
                <xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publisher_item/item_number"
                />
            </span>
            <br/>
            <span class="doi_data"><label class="label"
                    >doi:</label><!--<xsl:call-template name="doi"/>--><xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/doi_data/doi"/></span>
            <br/>
            <xsl:call-template name="resource"/>&#160;&#124;&#160;<xsl:call-template name="cite"/>
            <br/>
        </div>
    </xsl:template>

    <xsl:template match="contributors">
        <xsl:for-each select="person_name">
            <xsl:value-of select="given_name"/>
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="surname"/>
            <xsl:if test="position() != last()">
                <xsl:text>&#44;&#160;</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="date">
        <xsl:choose>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '01'"
                    >January&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '02'"
                    >February&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '03'"
                    >March&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '04'"
                    >April&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '05'"
                    >May&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '06'"
                    >June&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '07'"
                    >July&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '08'"
                    >August&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '09'"
                    >September&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '10'"
                    >October&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '11'"
                    >November&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '12'"
                    >December&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date/year"
                /></xsl:when>


            <xsl:otherwise>
                <xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date/year"/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>
    <!-- <xsl:template name="doi">
        <a><xsl:attribute name="href"><xsl:text>https://doi.org/</xsl:text><xsl:value-of
            select="doi_record/report-paper/report-paper_metadata/doi_data/doi"
        /></xsl:attribute><xsl:value-of
            select="doi_record/report-paper/report-paper_metadata/doi_data/doi"
        /></a>
    </xsl:template>-->

    <xsl:template name="resource">
        <a><xsl:attribute name="href"><xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/doi_data/resource"
                /></xsl:attribute>Download PDF</a>
    </xsl:template>
    <xsl:template name="cite">
        <a><xsl:attribute name="href"><xsl:value-of
                    select="concat('./bib/', substring-after(doi_record/report-paper/report-paper_metadata/doi_data/doi, '/'), '.ris')"
                /></xsl:attribute>Download Citation</a>
    </xsl:template>

</xsl:stylesheet>
