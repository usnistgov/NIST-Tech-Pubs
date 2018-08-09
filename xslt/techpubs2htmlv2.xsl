<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
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
        
        <!-- <xsl:for-each-group select="article" group-by="@type"> 
            <xsl:result-document href="{concat('../public/', current-grouping-key(), '.html')}"> 
                <xsl:call-template name="html">
                    <xsl:with-param name="article-type" select="current-grouping-key()"/>
                </xsl:call-template>
            </xsl:result-document>
        </xsl:for-each-group>-->
        
        <!-- creates page sorted by date  -->
        <xsl:result-document href="../public/date.html"> 
            <xsl:call-template name="html">
                <xsl:with-param name="report-type">date</xsl:with-param>
            </xsl:call-template>
        </xsl:result-document>
        
        <!-- creates page for keywords-->
        
        
     
       
        
    </xsl:template>
    
    <xsl:template name="html">
        <xsl:param name="report-type"/>
        <html>
            <head>
                <title>NIST Technical Publications Index</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
   <link rel="stylesheet" type="text/css" href="./css/reset.css"/>
                <link rel="stylesheet" type="text/css" href="./css/techpubs-html2.css"/>
                <link rel="stylesheet" type="text/css" href="./css/accordian.css"/>
            </head>
            <body>
                <img src="nistident_fleft_300ppi.png" alt="NIST ISO Logo" width="200" height="103"/>
                <img src="iso_logo_yellow-dark-blue_sm.png" alt="NIST ISO Logo" width="120" height="103"/>
                <div id="container">
                    <header id="header">
                        <h1 id="title">NIST Technical Series Publication Index</h1>
                        <h3><a href="https://www.nist.gov/nist-research-library/nist-series-publications">Series Descriptions</a></h3>
                    </header>
                   
                
                <!-- Main content -->
                <xsl:choose>       
                        <xsl:when test="$report-type = 'date'">
                            <section id="content">
                            <xsl:apply-templates select="query">
                                <xsl:sort order="descending" select="doi_record/report-paper/report-paper_metadata/publication_date/year"/>
                                <xsl:sort order="descending" select="doi_record/report-paper/report-paper_metadata/publication_date/month"/>
                                <xsl:sort order="descending" select="doi_record/report-paper/report-paper_metadata/publication_date/day"/>
                                
                            </xsl:apply-templates>
                            </section>
                        </xsl:when>
  <xsl:otherwise>
      <section id="content">
          <xsl:for-each-group select="query" group-by="@key">
              <xsl:sort select="current-grouping-key()"/>
              <h3 class="type-head">
                  <xsl:attribute name="id" select="current-grouping-key()"/>
                  <xsl:value-of select="current-grouping-key()"/>
              </h3>
              <xsl:for-each select="current-group()">
                  <xsl:apply-templates select="."/>
              </xsl:for-each>
          </xsl:for-each-group>
          
      </section>
   
  </xsl:otherwise>
                </xsl:choose>
                    
                    <!-- Sidebar -->
                    <aside  id="sidebar">
                        <h3 class="art-title"><a href="./date.html">Sort by Date</a></h3>
                        <br/>
                        <h3 class="art-title"><a href="">Series</a></h3>
                        <p><a href="./index.html#NSRDS">National Standard Reference Data Series</a></p>
                        <p><a href="./index.html#CIRC">Circulars</a></p>
                        <p><a href="./index.html#SP">Special Publications</a></p>
                        <p><a href="./index.html#BSS">Building Science Series</a></p>
                        <p><a href="./index.html#BH">Building and Housing</a></p>
                        <p><a href="./index.html#BMS">Building Materials and Structures Reports</a></p>
                        <p><a href="./index.html#NCSTAR">National Construction Safety Team Act Reports</a></p>
                        <p><a href="./index.html#MONO">Monographs</a></p>
                        <p><a href="./index.html#IR">Interagency/Internal Reports</a></p>
                        <p><a href="./index.html#TN">Technical Notes</a></p>
                        <p><a href="./index.html#CS">Commercial Standards</a></p>
                        <p><a href="./index.html#TIBM">Technical Information on Building Materials</a></p>
                        <p><a href="./index.html#GCR">Grant/Contractor Reports</a></p>
                        <p><a href="./index.html#FIPS">Federal Information Processing Standards Pubpcations</a></p>
                        <p><a href="./index.html#AMS">Advanced Manufacturing Series</a></p>
                        <p><a href="./index.html#HB">Handbooks</a></p>
                        <p><a href="./index.html#CIS">Consumer Information Series</a></p>
                            <p><a href="./index.html#MP">Miscellaneous Publications</a></p>
                        
                        <!--<ul>
                            
                            <li><a href="./index.html#NSRDS">National Standard Reference Data Series</a></li>
                            <li><a href="./index.html#CIRC">Circulars</a></li>
                            <li><a href="./index.html#SP">Special Publications</a></li>
                            <li><a href="./index.html#BSS">Building Science Series</a></li>
                            <li><a href="./index.html#BH">Building and Housing</a></li>
                            <li><a href="./index.html#BMS">Building Materials and Structures Reports</a></li>
                            <li><a href="./index.html#NCSTAR">National Construction Safety Team Act Reports</a></li>
                            <li><a href="./index.html#MONO">Monographs</a></li>
                            <li><a href="./index.html#IR">Interagency/Internal Reports</a></li>
                            <li><a href="./index.html#TN">Technical Notes</a></li>
                            <li><a href="./index.html#CS">Commercial Standards</a></li>
                            <li><a href="./index.html#TIBM">Technical Information on Building Materials</a></li>
                            <li><a href="./index.html#GCR">Grant/Contractor Reports</a></li>
                            <li><a href="./index.html#FIPS">Federal Information Processing Standards Publications</a></li>
                            <li><a href="./index.html#AMS">Advanced Manufacturing Series</a></li>
                            <li><a href="./index.html#HB">Handbooks</a></li>
                            <li><a href="./index.html#CIS">Consumer Information Series</a></li>
                            <li><a href="./index.html#MP">Miscellaneous Publications</a></li>
                            
                            
                        </ul>-->
                        
                        
                        <!-- Sidebar content -->
                    </aside>
                    
                    <!-- Footer -->
                    <footer id="footer" class="clearfix">
                        NIST Research Library&#160;&#124;&#160;<a href="mailto:library@nist.gov">library@nist.gov</a>&#160;&#124;&#160;<a href="https://www.nist.gov/nist-research-library">www.nist.gov/nvl</a></footer>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="query">
        
        
        <div class="report-paper">
            <span class="titles"><label class="label">Title:&#160;</label><xsl:value-of select="doi_record/report-paper/report-paper_metadata/titles/title"/>&#160;<xsl:value-of select="doi_record/report-paper/report-paper_metadata/titles/subtitle"/></span><br/>
            <span class="publication_date"><label class="label">Date&#160;Published:&#160;</label> <xsl:call-template name="date"/></span><br/>
            <span class="authors"><label class="label">Authors:&#160;</label><xsl:apply-templates select="doi_record/report-paper/report-paper_metadata/contributors"/></span><br/>
            <span class="report-number"><label class="label">Report&#160;Number:&#160;</label> <xsl:value-of select="doi_record/report-paper/report-paper_metadata/publisher_item/item_number"/></span><br/>
            <span class="doi_data"><label class="label">doi:</label><xsl:value-of select="doi_record/report-paper/report-paper_metadata/doi_data/doi"/>&#160;&#124;&#160;<xsl:call-template name="resource"/></span><br/>
        </div>
    </xsl:template>
    
    <xsl:template match="contributors">
        <xsl:for-each select="person_name">
            <xsl:value-of select="given_name"/><xsl:text>&#160;</xsl:text><xsl:value-of select="surname"/>
            <xsl:if test="position() !=  last()"><xsl:text>&#44;&#160;</xsl:text></xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="date">
       <xsl:choose>
           <xsl:when test="doi_record/report-paper/report-paper_metadata/publication_date/month = '01'">January&#160;<xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/></xsl:when>
           <xsl:when test="doi_record/report-paper/report-paper_metadata/publication_date/month = '02'">February&#160;<xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/></xsl:when>
           <xsl:when test="doi_record/report-paper/report-paper_metadata/publication_date/month = '03'">March&#160;<xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/></xsl:when>
           <xsl:when test="doi_record/report-paper/report-paper_metadata/publication_date/month = '04'">April&#160;<xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/></xsl:when>
           <xsl:when test="doi_record/report-paper/report-paper_metadata/publication_date/month = '05'">May&#160;<xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/></xsl:when>
           <xsl:when test="doi_record/report-paper/report-paper_metadata/publication_date/month = '06'">June&#160;<xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/></xsl:when>
           <xsl:when test="doi_record/report-paper/report-paper_metadata/publication_date/month = '07'">July&#160;<xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/></xsl:when>
           <xsl:when test="doi_record/report-paper/report-paper_metadata/publication_date/month = '08'">August&#160;<xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/></xsl:when>
           <xsl:when test="doi_record/report-paper/report-paper_metadata/publication_date/month = '09'">September&#160;<xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/></xsl:when>
           <xsl:when test="doi_record/report-paper/report-paper_metadata/publication_date/month = '10'">October&#160;<xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/></xsl:when>
           <xsl:when test="doi_record/report-paper/report-paper_metadata/publication_date/month = '11'">November&#160;<xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/></xsl:when>
           <xsl:when test="doi_record/report-paper/report-paper_metadata/publication_date/month = '12'">December&#160;<xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/></xsl:when>
           
          
           <xsl:otherwise><xsl:value-of select="doi_record/report-paper/report-paper_metadata/publication_date/year"/></xsl:otherwise>
        </xsl:choose>

    </xsl:template>
    
    <xsl:template name="resource">
        <a><xsl:attribute name="href"><xsl:value-of select="doi_record/report-paper/report-paper_metadata/doi_data/resource"/></xsl:attribute>PDF</a>
    </xsl:template>
</xsl:stylesheet>