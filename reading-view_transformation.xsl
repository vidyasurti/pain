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
            </head>
            <body>
                <xsl:copy>
                    <xsl:apply-templates select = "following-sibling::node()[1]" />
                    <!--Looking at information from here: https://www.balisage.net/Proceedings/vol21/print/Birnbaum01/BalisageVol21-Birnbaum01.html#d480536e994
                    But I do think that making a function to select the text between the painStart and painENd elements would be the best way to go-->
                </xsl:copy>
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>