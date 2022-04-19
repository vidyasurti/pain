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

                <title>
                    <xsl:apply-templates select = "/events_and_full-text/@doc-name" /> Reading View
                    <!--<xsl:apply-templates select="//titleStmt/title[1]"/> -->
                </title>
                <link rel="stylesheet" type="text/css" href="reading-view.css"/>
            </head>
            <body>
                <h2 class="page-title">Events of Pain in <xsl:apply-templates
                        select="/events_and_full-text/@doc-name"/>
                </h2>
                <section class="painEvents">
                    <xsl:apply-templates select="//allPainEvents"/>
                </section>
                <section class = "fullPlay">
                    <xsl:apply-templates select = "//tragedyText" />
                </section>


            </body>
        </html>
    </xsl:template>

    <xsl:template match="allPainEvents">
        <xsl:apply-templates select="pain"/>
    </xsl:template>

    <xsl:template match="pain"> 
        <p>
            <a href = "#tragedy-{@xml:id}" id = "event-{@xml:id}">
                <xsl:apply-templates/>
            </a>
            
        </p>
    
    </xsl:template>
    
    <xsl:template match = "tragedyText">
        <xsl:text>hello world!</xsl:text>
        <p><xsl:apply-templates /></p>
    </xsl:template>
    
    <!--<xsl:template match = "mappedPain">
        <a href = "#event-{@xml:id}" id = "tragedy-{@xml:id}">
            <xsl:apply-templates />
        </a>
    </xsl:template> -->
</xsl:stylesheet>
