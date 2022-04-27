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
      
            <text text-anchor="middle" x="{$xLength div 2}" y="-{$yScale + 25}" font-weight="bold" stroke="#BF9000" fill="#FFFFFF">Distribution of Pain Type by Receiver Gender</text>
            <text text-anchor="middle" x="{$xLength div 2}" y="{60}" font-weight="bold" stroke="#BF9000" fill="#FFFFFF">Pain Type</text>
            <text text-anchor="middle" x="{$yScale div 2}" y="-55" transform="rotate(-90)" font-weight="bold" stroke="#BF9000" fill="#FFFFFF">Pain Instances (%)</text>
            <text>emotional</text>
            <text>physical</text>
            <text>both</text>
            <line x1="0" y1="0" x2="{$xLength}" y2="0" stroke="#000000"/> <!-- set as black for now -->
            <line x1="0" y1="0" x2="0" y2="-{$yScale}" stroke="#000000"/>
            <xsl:for-each select="(1 to 4)">
                <line x1="0" y1="-{. * 100}" x2="{$xLength}" y2="-{. * 100}"
                stroke="#000000" stroke-dasharray="3"/>
                <text x="-45" y="-{. * 100 - 5}" stroke="#000000" fill="#000000"><xsl:value-of select=". * 25"/>%</text></xsl:for-each>
            
        <!-- LEGEND -->
            <rect x="{$xLength + 30}" y="-{$yScale div 4}" height="20" width="20" fill="#7272AB"/> <!-- #7272AB purple probably make these more muted -->
            <rect x="{$xLength + 30}" y="-{$yScale div 4*2}" height="20" width="20" fill="#7899D4"/> <!-- #7899D4 blue -->
            <rect x="{$xLength + 30}" y="-{$yScale div 4*3}" height="20" width="20" fill="#F8AFA6"/> <!-- #F8AFA6 dusty rose -->
            <text text-anchor="start" x="{$xLength + 55}" y="-{$yScale div 4 - 15}" stroke="#000000" fill="#000000">Men</text>
            <text text-anchor="start" x="{$xLength + 55}" y="-{$yScale div 4*2 - 15}" stroke="#000000" fill="#000000">Women</text>
            <text text-anchor="start" x="{$xLength + 55}" y="-{$yScale div 4*3 -15}" stroke="#000000" fill="#000000">Mix</text>
        </g>
    </xsl:template>

    <!-- CONTENT OF GRAPH AND MORE VARIABLES -->
</xsl:stylesheet>