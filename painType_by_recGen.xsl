<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

    <!-- SET VARIABLE FOR ALL TRAGEDIES -->
    <xsl:variable name="all_tragedies" as="document-node()+"
        select="collection('tragedies?select=*.xml')"/>

    <!-- SET GENERAL VARIABLES FOR THE GRAPH -->
    <xsl:variable name="barWidth" as="xs:integer" select="75"/>
    <xsl:variable name="barSpaces" as="xs:float" select="$barWidth div 2"/>
    <xsl:variable name="typeCount" as="xs:integer"
        select="count(distinct-values($all_tragedies//painStart/@painType))"/>
    <xsl:variable name="xLength" as="xs:float" select="$typeCount * ($barWidth + $barSpaces)"/>
    <xsl:variable name="yScale" as="xs:integer" select="400"/>

    <xsl:template name="xsl:initial-template">
        <svg viewBox="100 0 1200 600" width="100%"/>
        <g transform="translate(200, 500)">
        <xsl:apply-templates select="$all_tragedies//painStart" mode="painType"/>

        <!-- AXES -->
      
            <text x="" y="">Distribution of Pain Type by Receiver Gender</text>
            <text x="" y="">Pain Type</text>
            <text x="" y="">Pain Instances (%)</text>

        <!-- LEGEND -->
      
        </g>
    </xsl:template>

    <!-- CONTENT OF GRAPH AND MORE VARIABLES -->
</xsl:stylesheet>