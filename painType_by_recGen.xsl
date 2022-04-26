<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    
    
    <!-- SET GENERAL VARIABLES FOR THE GRAPH -->
    <xsl:variable name="barWidth" as="xs:integer" select="75"/>
    <xsl:variable name="barSpaces" as="xs:float" select="$barWidth div 2"/>
    <xsl:variable name="typeCount" as="xs:integer" select="count(distinct-values(//@painType))"/>
    <xsl:variable name="xLength" as="xs:float" select="$typeCount * ($barWidth + $barSpaces)"/>
    <xsl:variable name="yScale" as="xs:integer" select="400"/>
    <!-- AXES -->
    
    <!-- LEGEND -->
    
    <!-- CONTENT OF GRAPH AND MORE VARIABLES -->
</xsl:stylesheet>