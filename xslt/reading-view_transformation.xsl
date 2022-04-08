<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                
                <title><xsl:apply-templates select = "//titleStmt/title[1]"/></title>
                <!-- If possible - remove the (English) in libation bearers, philoctetes, and women of trachis -->
                <link rel="stylesheet" type="text/css" href="reading-view.css"/>
            </head>
            <body>
                <h2 class = "page-title">Events of Pain in </h2>
                
                <section class = "textDisplay">
                    <xsl:apply-templates select = "allPainEvents" /> 
                </section>
                
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match = "pain">
        <p class = "painEvent"><xsl:apply-templates /></p>
    </xsl:template> 
</xsl:stylesheet>