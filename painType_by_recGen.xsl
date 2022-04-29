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
    <xsl:variable name="menColor" as="xs:string" select="'#7272AB'"/>
    <xsl:variable name="womenColor" as="xs:string" select="'#7899D4'"/>
    <xsl:variable name="mixColor" as="xs:string" select="'#F8AFA6'"/>


    <xsl:template name="xsl:initial-template">
        <svg viewBox="-100 -500 1200 600" width="100%">
            <defs>
                <style type="text/css">
                    @import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&amp;family=Playfair+Display&amp;family=Trirong:wght@100&amp;display=swap');</style>
            </defs>
            <g>
                <xsl:apply-templates select="$all_tragedies//painStart" mode="painType"/>

                <!-- AXES (LINES AND LABELS) -->
                <text text-anchor="middle" x="{$xLength div 2}" y="-{$yScale + 25}"
                    font-weight="bold" stroke="#BF9000" fill="#FFFFFF"
                    font-family="'Playfair Display', 'Comic Sans MS'">Distribution of Pain Type by
                    Receiver Gender</text>
                <text text-anchor="middle" x="{$xLength div 2}" y="{60}" font-weight="bold"
                    stroke="#BF9000" fill="#FFFFFF">Pain Type</text>
                <text text-anchor="middle" x="{$yScale div 2}" y="-55" transform="rotate(-90)"
                    font-weight="bold" stroke="#BF9000" fill="#FFFFFF">Pain Instances (%)</text>
                <line x1="0" y1="0" x2="{$xLength}" y2="0" stroke="#000000"/>
                <!-- set as black for now -->
                <line x1="0" y1="0" x2="0" y2="-{$yScale}" stroke="#000000"/>
                <xsl:for-each select="(1 to 4)">
                    <line x1="0" y1="-{. * 100}" x2="{$xLength}" y2="-{. * 100}" stroke="#000000"
                        stroke-dasharray="3"/>
                    <text x="-45" y="-{. * 100 - 5}" stroke="#000000" fill="#000000"><xsl:value-of
                            select=". * 25"/>%</text>
                </xsl:for-each>

                <!-- LEGEND -->
                <rect x="{$xLength + 30}" y="-{$yScale div 4}" height="20" width="20"
                    fill="{$womenColor}"/>
                <!-- #7272AB purple probably make these more muted -->
                <rect x="{$xLength + 30}" y="-{$yScale div 4*2}" height="20" width="20"
                    fill="{$mixColor}"/>
                <!-- #7899D4 blue -->
                <rect x="{$xLength + 30}" y="-{$yScale div 4*3}" height="20" width="20"
                    fill="{$menColor}"/>
                <!-- #F8AFA6 dusty rose -->
                <text text-anchor="start" x="{$xLength + 55}" y="-{$yScale div 4 - 15}"
                    stroke="#000000" fill="#000000">Women</text>
                <text text-anchor="start" x="{$xLength + 55}" y="-{$yScale div 4*2 - 15}"
                    stroke="#000000" fill="#000000">Mix</text>
                <text text-anchor="start" x="{$xLength + 55}" y="-{$yScale div 4*3 -15}"
                    stroke="#000000" fill="#000000">Men</text>

                <!-- GRAPH BARS AND X AXIS LABELS -->
                <xsl:variable name="barOrder" as="xs:string+" select="'em', 'phys', 'both'"/>
                <xsl:variable name="barLabels" as="xs:string+"
                    select="'emotional', 'physical', 'both'"/>
                <xsl:for-each-group select="$all_tragedies//painStart" group-by="@painType">
                    <xsl:variable name="nameOrder" as="xs:integer"
                        select="index-of($barOrder, current-grouping-key())"/>
                    <xsl:variable name="xPosition" as="xs:double"
                        select="$xLength div 3 * $nameOrder - 50"/>
                    <xsl:variable name="painType_count" as="xs:integer"
                        select="count(current-group())"/>
                    <xsl:variable name="women_yPos" as="xs:double"
                        select="count(current-group()[@recGen eq 'woman']) div $painType_count * $yScale"/>
                    <xsl:variable name="men_yPos" as="xs:double"
                        select="count(current-group()[@recGen eq 'man']) div $painType_count * $yScale"/>
                    <text text-anchor="middle" x="{$xPosition}" y="30">
                        <xsl:value-of select="$barLabels[$nameOrder]"/>
                    </text>
                    <rect x="{$xPosition - $barWidth div 2}" y="-{$yScale}" height="{$yScale}"
                        width="{$barWidth}" fill="{$mixColor}"/>
                    <rect x="{$xPosition - $barWidth div 2}" y="-{$women_yPos}"
                        height="{$women_yPos}" width="{$barWidth}" fill="{$womenColor}"/>
                    <rect x="{$xPosition - $barWidth div 2}" y="-{$yScale}" height="{$men_yPos}" width="{$barWidth}" fill="{$menColor}"/>
                </xsl:for-each-group>
            </g>
        </svg>
    </xsl:template>

    <!-- CONTENT OF GRAPH AND MORE VARIABLES -->

    <!-- <xsl:template match="$all_tragedies//painStart" mode="painType">
        <g transform="translate({$barSpaces}, 0)">
            <xsl:for-each select="1 to $typeCount">
                <xsl:variable name="i" as="xs:integer" select="."/>
                <xsl:variable name="painType" as="xs:string" select="distinct-values($all_tragedies//painStart/@painType)[$i]"/>
                <xsl:variable name="painTotal" as="xs:integer" select="count($all_tragedies//painStart[@painType = $painType])"/> 
                <xsl:variable name="womanTotal" as="xs:integer" select="count($all_tragedies//painStart[@recGen = 'woman' and @painType = $painType])"/>
                <xsl:variable name="womanHeight" as="xs:float" select="($womanTotal div $painTotal * $yScale)"/>   
                
               
                <xsl:for-each select=".">
                    <rect x="{($i - 1) * ($barWidth + $barSpaces)}" y="-{$womanHeight}" height="{$womanHeight}" width="{$barWidth}" fill="#000000"/>
                    <rect x="" y="" height="" width="$barWidth" fill=""/>
                    <rect x="" y="" height="" width="$barWidth" fill=""/>
                </xsl:for-each>
            </xsl:for-each> 
            
        </g> 
    </xsl:template> -->

</xsl:stylesheet>
