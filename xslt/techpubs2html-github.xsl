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
        <xsl:result-document href="../index.html">
            <xsl:call-template name="html"> <xsl:with-param name="report-type">home</xsl:with-param></xsl:call-template>
        </xsl:result-document>
        
        <!-- creates the series page -->
        <xsl:result-document href="../series.html">
            <xsl:call-template name="html2"> <xsl:with-param name="report-type">series</xsl:with-param>
            
            </xsl:call-template>
        </xsl:result-document>

        <!-- creates pages for each article type -->

        <xsl:for-each-group select="query" group-by="@key">
            <xsl:result-document href="{concat('../', current-grouping-key(), '.html')}">
                <xsl:call-template name="html">
                    <xsl:with-param name="report-type" select="current-grouping-key()"/>
                </xsl:call-template>
            </xsl:result-document>
        </xsl:for-each-group>




        <!-- creates page sorted by date  -->
        <xsl:result-document href="../date.html">
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
          
                <link rel="stylesheet" type="text/css" href="./css/NISTPages.css"/>
              
                        
            </head>
            <body>

            
                <header class="nist-header">
                    
                                                    
                                                    <h1>
                                                        <a class="nist-logo" target="_blank" href="http://www.nist.gov/" title="Go to nist.gov">National Institute of Standards and Technology</a>
                                                    </h1>
                                                    <div class="nist-links">
                                                        <a class="nist-links-button" target="_blank" href="http://www.nist.gov">NIST Website</a>
                                                        <a class="nist-links-button mobile-hide" target="_blank" href="http://www.nist.gov/public_affairs/nandyou.cfm">About NIST</a>
                                                        <a class="nist-links-button mobile-hide" target="_blank" href="https://github.com/usnistgov">usnistgov on GitHub</a>
                                                    </div>
                                                    
                                                   </header>
                
                <div id="container">
                    <header id="header">
                        <h1 id="title">NIST Technical Series Publication List</h1>
                        
                    </header>

                    
                    <!-- Navigation -->
                    <nav id="menu" class="clearfix">
                        <ul>
                            <li>
                                <a href="./">Home</a>
                            </li>
                            <li>
                                <a href="./date.html">View All Reports</a>
                            </li>
                            <li>
                                <a href="./series.html">Filter by Series</a>
                            </li>
                            <li>
                                <a href="https://github.com/usnistgov/NIST-Tech-Pubs/tree/nist-pages/xml">Raw Data</a>
                            </li>
                            <li>
                                <a href="#top">Back to Top</a>
                            </li>
                        </ul>
                    </nav>



                    <!-- Main content -->

                    <xsl:choose>
                        <xsl:when test="$report-type = 'home'">
                            <section id="content">


                                <h2 class="links">Quick Links</h2>
                                <ul>
                                    <!--<li>
                                        <a
                                            href="https://inet.nist.gov/library/publishing-support-nist-publications/nist-technical-series-publications"
                                            >How to Publish a Report</a>
                                    </li>-->
                                    <li>
                                        <a
                                            href="https://www.nist.gov/nist-research-library/nist-series-publications"
                                            >Series Descriptions</a>
                                    </li>
                                   

                                    <li>
                                        <a href="./date.html">View All Reports</a>
                                    </li>

                                    <li>
                                        <a href="./series.html">Filter Reports by Series</a>
                                    </li>
                                    <li>
                                        <a href="./xml/NIST_Tech_Pubs_all.txt">Download Full List of
                                            Reports</a>
                                    </li>

                                </ul>

                                <h2 class="welcome">Welcome</h2>
                                    <p>NIST Technical Series publications are written by or for NIST
                                        and published by the <a href= "https://www.nist.gov/nist-research-library">NIST Research Library</a>. These
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

                                
                               <h2 class="contact">Contact</h2>
                                <p>NIST Research Library<br/><a
                                    href="mailto:techpubs@nist.gov">techpubs@nist.gov</a></p>
                                

                            </section>
                        </xsl:when>
                       
                        <xsl:when test="$report-type = 'date'">
                            <section id="content">
                                <xsl:apply-templates select="query">
                                    <xsl:sort order="descending"
                                        select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"/>
                                    <xsl:sort order="descending"
                                        select="doi_record/report-paper/report-paper_metadata/publication_date[1]/month"/>
                                    <xsl:sort order="descending"
                                        select="doi_record/report-paper/report-paper_metadata/publication_date[1]/date"
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
                                    <xsl:sort order="descending"
                                        select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"/>
                                    <xsl:sort order="descending"
                                        select="doi_record/report-paper/report-paper_metadata/publication_date[1]/month"/>
                                    <xsl:sort order="descending"
                                        select="doi_record/report-paper/report-paper_metadata/publication_date[1]/date"
                                    />
                                    <xsl:apply-templates select="."/>
                                </xsl:for-each>
                            </section>
                        </xsl:otherwise>
                    </xsl:choose>


                    <!-- Sidebar -->
                    <a name="filter"/>
                    <aside id="sidebar">
                        <br/>
                        <h2 class="filter"> Filter by Series </h2>
                        <p>
                            <a href="./AMS.html">Advanced Manufacturing Series</a>
                        </p>
                        <p>
                            <a href="./BRPD-CRPL-D.html">Basic Radio Propagation Predictions Series</a></p>
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
                            <a href="./CRPL.html">Central Radio Propagation Laboratory Reports</a></p>
                        <p>
                            <a href="./CRPL-F-A.html">CRPL Ionospheric Data</a></p>
                        <p>
                            <a href="./IP.html">CRPL Ionospheric Predictions</a></p>
                        <p>
                            <a href="./CRPL-F-B.html">CRPL Solar-Geophysical Data</a></p>
                        
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
                            <a href="./DCI.html">Data Collection Instruments and Best Practices</a>
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
                            <a href="./HR.html">Hydraulic Research in the United States</a>
                        </p>
                        <p>
                            <a href="./IRPL.html">Interservice Radio Propagation Laboratory</a>
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
                            <a href="./IR.html">NISTIRs (Interagency/Internal Reports)</a>
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
                            <a href="./SP.html">Special Publications (General)</a>
                        </p>
                        <p>
                            <a href="./SP250.html">SP 250: Calibration Services</a>
                        </p>
                        <p>
                            <a href="./SP260.html">SP 260: Standard Reference Materials</a>
                        </p>
                        <p>
                            <a href="./SP300.html">SP 300: Precision Measurement and Calibration</a>
                        </p>
                        <p>
                            <a href="./SP400.html">SP 400: Semiconductor Measurement Technology</a>
                        </p>
                        <p>
                            <a href="./SP480.html">SP 480: Law Enforcement Technology</a>
                        </p>
                        <p>
                            <a href="./SP500.html">SP 500: Computer Systems Technology</a>
                        </p>
                        <p>
                            <a href="./SP700.html">SP 700: Industrial Measurement Series</a>
                        </p>
                        <p>
                            <a href="./SP800.html">SP 800: Computer Security Series</a>
                        </p>
                        <p>
                            <a href="./SP823.html">SP 823: Integrated Services Digital Network Series</a>
                        </p>
                        <p>
                            <a href="./SP960.html">SP 960: NIST Recommended Practice Guides</a>
                        </p>
                        <p>
                            <a href="./SP1200.html">SP 1200: Protocols</a>
                        </p>
                        <p>
                            <a href="./SP1500.html">SP 1500: Working Group Papers</a>
                        </p>
                        <p>
                            <a href="./SP1800.html">SP 1800: NIST Cybersecurity Practice Guides</a>
                        </p>
                        <p>
                            <a href="./SP1900.html">SP 1900: Cyber-Physical Systems</a>
                        </p>
                        <p>
                            <a href="./SP2000.html">SP 2000: Standards Coordination</a>
                        </p>
                        <p>
                            <a href="./SP2100.html">SP 2100: Conference Proceedings</a>
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
                   
                   <!-- <footer role="contentInfo" class="site-footer">
                        <div class="section-container">
                            <div class="section-content">     
                            </div>
                        </div>
                    </footer>-->
                    <footer id="footer" class="clearfix"> 
                        <a target="_blank" href="https://www.nist.gov/privacy-policy">Privacy Policy</a> | <a target="_blank" href="https://www.nist.gov/privacy-policy#secnot">Security Notice</a> | <a href="https://www.nist.gov/oism/accessibility">Accessibility Statement</a>
                    </footer>
                        
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="html2">
        <xsl:param name="report-type"/>
        <html>
            <head>
                
                <title>NIST Technical Publications List</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" type="text/css" href="./css/reset.css"/>
                <link rel="stylesheet" type="text/css" href="./css/techpubs-html2.css"/>
                <link rel="stylesheet" type="text/css" href="./css/accordian.css"/>
          
                <link rel="stylesheet" type="text/css" href="./css/NISTPages.css"/>
              
                        
            </head>
            <body>

            
                <header class="nist-header">
                    
                                                    
                                                    <h1>
                                                        <a class="nist-logo" target="_blank" href="http://www.nist.gov/" title="Go to nist.gov">National Institute of Standards and Technology</a>
                                                    </h1>
                                                    <div class="nist-links">
                                                        <a class="nist-links-button" target="_blank" href="http://www.nist.gov">NIST Website</a>
                                                        <a class="nist-links-button mobile-hide" target="_blank" href="http://www.nist.gov/public_affairs/nandyou.cfm">About NIST</a>
                                                        <a class="nist-links-button mobile-hide" target="_blank" href="https://github.com/usnistgov">usnistgov on GitHub</a>
                                                    </div>
                                                    
                                                   </header>
                
                <div id="container">
                    <header id="header">
                        <h1 id="title">NIST Technical Series Publication List</h1>
                        
                    </header>

                    
                    <!-- Navigation -->
                    <nav id="menu" class="clearfix">
                        <ul>
                            <li>
                                <a href="./">Home</a>
                            </li>
                            <li>
                                <a href="./date.html">View All Reports</a>
                            </li>
                            <li>
                                <a href="./series.html">Filter by Series</a>
                            </li>
                            <li>
                                <a href="https://github.com/usnistgov/NIST-Tech-Pubs/tree/nist-pages/xml">Raw Data</a>
                            </li>
                            <li>
                                <a href="#top">Back to Top</a>
                            </li>
                        </ul>
                    </nav>



                    <!-- Series content -->

                    <xsl:choose>
                        <xsl:when test="$report-type = 'series'">
                            <section id="content">

                               
                                    <h2 class="filter"> Filter by Series </h2>
                                    <p>
                                        <a href="./AMS.html">Advanced Manufacturing Series</a>
                                    </p>
                                    <p>
                                        <a href="./BRPD-CRPL-D.html">Basic Radio Propagation Predictions Series</a></p>
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
                                        <a href="./CRPL.html">Central Radio Propagation Laboratory Reports</a></p>
                                    <p>
                                        <a href="./CRPL-F-A.html">CRPL Ionospheric Data</a></p>
                                    <p>
                                        <a href="./IP.html">CRPL Ionospheric Predictions</a></p>
                                    <p>
                                        <a href="./CRPL-F-B.html">CRPL Solar-Geophysical Data</a></p>
                                    
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
                                    <a href="./DCI.html">Data Collection Instruments and Best Practices</a>
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
                                        <a href="./HR.html">Hydraulic Research in the United States</a>
                                    </p>
                                    <p>
                                        <a href="./IRPL.html">Interservice Radio Propagation Laboratory</a>
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
                                        <a href="./IR.html">NISTIRs (Interagency/Internal Reports)</a>
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
                                        <a href="./SP.html">Special Publications (General)</a>
                                    </p>
                                    <p>
                                        <a href="./SP250.html">SP 250: Calibration Services</a>
                                    </p>
                                    <p>
                                        <a href="./SP260.html">SP 260: Standard Reference Materials</a>
                                    </p>
                                    <p>
                                        <a href="./SP300.html">SP 300: Precision Measurement and Calibration</a>
                                    </p>
                                    <p>
                                        <a href="./SP400.html">SP 400: Semiconductor Measurement Technology</a>
                                    </p>
                                    <p>
                                        <a href="./SP480.html">SP 480: Law Enforcement Technology</a>
                                    </p>
                                    <p>
                                        <a href="./SP500.html">SP 500: Computer Systems Technology</a>
                                    </p>
                                    <p>
                                        <a href="./SP700.html">SP 700: Industrial Measurement Series</a>
                                    </p>
                                    <p>
                                        <a href="./SP800.html">SP 800: Computer Security Series</a>
                                    </p>
                                    <p>
                                        <a href="./SP823.html">SP 823: Integrated Services Digital Network Series</a>
                                    </p>
                                    <p>
                                        <a href="./SP960.html">SP 960: NIST Recommended Practice Guides</a>
                                    </p>
                                    <p>
                                        <a href="./SP1200.html">SP 1200: Protocols</a>
                                    </p>
                                    <p>
                                        <a href="./SP1500.html">SP 1500: Working Group Papers</a>
                                    </p>
                                    <p>
                                        <a href="./SP1800.html">SP 1800: NIST Cybersecurity Practice Guides</a>
                                    </p>
                                    <p>
                                        <a href="./SP1900.html">SP 1900: Cyber-Physical Systems</a>
                                    </p>
                                    <p>
                                        <a href="./SP2000.html">SP 2000: Standards Coordination</a>
                                    </p>
                                    <p>
                                        <a href="./SP2100.html">SP 2100: Conference Proceedings</a>
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
                                </section>
                        </xsl:when>
                       
                       
                        <xsl:otherwise/>
                    </xsl:choose>


                    
                    <!-- Footer -->
                   
                   <!-- <footer role="contentInfo" class="site-footer">
                        <div class="section-container">
                            <div class="section-content">     
                            </div>
                        </div>
                    </footer>-->
                     <footer id="footer" class="clearfix"> 
                        <a target="_blank" href="https://www.nist.gov/privacy-policy">Privacy Policy</a> | <a target="_blank" href="https://www.nist.gov/privacy-policy#secnot">Security Notice</a> | <a href="https://www.nist.gov/oism/accessibility">Accessibility Statement</a>
                    </footer>
                        
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
                <xsl:choose>
                    <xsl:when test="doi_record/report-paper/report-paper_metadata/publisher_item/item_number">
                        <xsl:value-of
                        select="doi_record/report-paper/report-paper_metadata/publisher_item/item_number"/>
                    </xsl:when>
                    <xsl:otherwise><xsl:value-of
                        select="doi_record/report-paper/report-paper_metadata/publisher_item/identifier"/>
                    </xsl:otherwise>
                </xsl:choose>
                
         
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
                    select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '02'"
                    >February&#160;<xsl:value-of
                        select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '03'"
                    >March&#160;<xsl:value-of
                        select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '04'"
                    >April&#160;<xsl:value-of
                        select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '05'"
                    >May&#160;<xsl:value-of
                        select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '06'"
                    >June&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '07'"
                    >July&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '08'"
                    >August&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '09'"
                    >September&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '10'"
                    >October&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '11'"
                    >November&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"
                /></xsl:when>
            <xsl:when
                test="doi_record/report-paper/report-paper_metadata/publication_date/month = '12'"
                    >December&#160;<xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"
                /></xsl:when>


            <xsl:otherwise>
                <xsl:value-of
                    select="doi_record/report-paper/report-paper_metadata/publication_date[1]/year"/>
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
        /></xsl:attribute><xsl:attribute name="download"/>Download Citation</a>
    </xsl:template>

</xsl:stylesheet>