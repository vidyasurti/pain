<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

    <!-- SET VARIABLE FOR ALL TRAGEDIES -->
    <xsl:variable name="all_tragedies" as="document-node()+"
        select="collection('tragedies?select=*.xml')"/>

    <!-- SET GENERAL VARIABLES FOR THE GRAPH -->
    <xsl:variable name="maxHeight" as="xs:integer" select="300"/>
    <xsl:variable name="spacing" as="xs:integer" select="100"/>
    <xsl:variable name="maxWidth" as="xs:integer" select="($spacing) * 3"/>

    <xsl:template match="/">
        <svg height="{$maxHeight + 200}" width="{$maxWidth + 250}"
            viewBox="-50 -{$maxHeight + 100} {$maxWidth + 200} {$maxHeight + 200}">

            <!-- TITLE AND AXIS LABELS -->
            <text text-anchor="middle" x="{$maxWidth div 2}" y="-{$maxHeight + 50}">Inflictor Gender
                versus Receiver Gender</text>
            <text text-anchor="middle" x="{$maxWidth div 2}" y="0">Pain Receivers</text>
            <text text-anchor="middle" writing-mode="tb" y="-{$maxWidth div 2}" x="-20">Pain
                Inflictors</text>

            <!-- Y AXIS LINES -->
            <xsl:for-each select="0 to 3">
                <xsl:variable name="lineHeight" as="xs:double" select=". div 3 * $maxHeight"/>
                <line x1="0" x2="{$maxWidth}" y1="-{$lineHeight}" y2="-{$lineHeight}" stroke="gray"
                    stroke-width="1"/>
            </xsl:for-each>
            
         <!-- Y AXIS LABELS -->
            <text x="-10" y="-100" text-anchor="end" dominant-baseline="middle" font-size="13"> Men</text>
            <text x="-10" y="-200" text-anchor="end" dominant-baseline="middle" font-size="13">
                Women</text>
            <text x="-10" y="-300" text-anchor="end" dominant-baseline="middle" font-size="13"> Mix</text>


        </svg>





    </xsl:template>



</xsl:stylesheet>
