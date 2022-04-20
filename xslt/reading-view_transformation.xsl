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
                    <xsl:apply-templates select="/events_and_full-text/@doc-name"/> Reading View
                    <!--<xsl:apply-templates select="//titleStmt/title[1]"/> -->
                </title>
                <link rel="stylesheet" type="text/css" href="reading-view.css"/>
            </head>
            <body>
                <xsl:comment>#include virtual="menu.xhtml" </xsl:comment>
                <h2 class="page-title">Events of Pain in <xsl:apply-templates
                        select="/events_and_full-text/@doc-name"/>
                </h2>
                <div class="both-texts">
                    <section class="painEvents">
                        <xsl:apply-templates select="//allPainEvents" mode = "events-only"/>
                    </section>
                    <section class="fullPlay">
                        <xsl:apply-templates select="//tragedyText" mode = "full-text"/>
                    </section>
                </div>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="allPainEvents" mode = "events-only">
        <h3>
            Specific Pain Events in <xsl:apply-templates select = "/events_and_full-text/@doc-name"/>
        </h3>
        <xsl:apply-templates select="pain" mode = "events-only"/>
    </xsl:template>

    <xsl:template match="pain" mode = "events-only">
        <p>
            <a class = "pain-event" href="#tragedy-{@xml:id}" id="event-{@xml:id}">
                <xsl:apply-templates/>
            </a>

        </p>

    </xsl:template>

    <xsl:template match="tragedyText" mode = "full-text">
        <h3><xsl:apply-templates select = "/events_and_full-text/@doc-name"/> Full Text</h3>
        <xsl:apply-templates mode = "full-text"/>
        
    </xsl:template>

    <xsl:template match="div1" mode = "full-text">
        <div class="div1">
            <hr/>
            <xsl:apply-templates mode = "full-text"/>
            <br/>
        </div>
    </xsl:template>

    <xsl:template match="div1/stage" mode = "full-text">

        <p class="stage">
            <xsl:apply-templates mode = "full-text"/>
        </p>
    </xsl:template>

    <xsl:template match="//sp/stage" mode = "full-text">

        <p class="stage">
            <xsl:apply-templates mode = "full-text"/>
        </p>
    </xsl:template>

    <xsl:template match="//sp/speaker" mode = "full-text">

        <p class="speaker">
            <xsl:apply-templates mode = "full-text"/>
        </p>
    </xsl:template>

    <xsl:template match="//sp/p" mode = "full-text">

        <p class="p">
            <xsl:apply-templates mode = "full-text"/>
        </p>
    </xsl:template>

    <xsl:template match="p/speaker" mode = "full-text">
        <br/>
        <a class="speaker">
            <xsl:apply-templates mode = "full-text"/>
        </a>
    </xsl:template>

    <xsl:template match="p/stage" mode = "full-text">
        <br/>
        <a class="stage">
            <xsl:apply-templates mode = "full-text"/>
        </a>
    </xsl:template>
    
    <!-- Tagging the links -->
    
    <!-- What I came up with 
    <xsl:template match = "painStart" mode = "full-text">
        
        <xsl:variable name = "tragedy-num" as = "xs:integer" select = "count(preceding::painStart) + 1 - (count(//painStart) div 2)"/>
        <a href = "#event-{$tragedy-num}" id = "tragedy-{$tragedy-num}">
            <xsl:apply-templates />
        </a>
    </xsl:template> -->
    
    <!-- djb suggestion -->
    <xsl:template match="painStart" mode = "full-text">
        <xsl:variable name="tragedy-num" as="xs:integer" select="count(preceding::painStart[ancestor::tragedyText]) + 1"/>
        <!-- $preceding-painStarts is a sequence of <painStart> elements, which you can count with count() -->
        <a href = "#event-pain_{$tragedy-num}" id = "tragedy-pain_{$tragedy-num}">
            <xsl:apply-templates />
        </a>
    </xsl:template>
</xsl:stylesheet>
