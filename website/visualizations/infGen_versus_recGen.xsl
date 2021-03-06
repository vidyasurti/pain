<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>

    <!-- SET VARIABLE FOR ALL TRAGEDIES -->
    <xsl:variable name="all_tragedies" as="document-node()+"
        select="collection('../../tragedies?select=*.xml')"/>

    <!-- SET GENERAL VARIABLES FOR THE GRAPH -->
    <xsl:variable name="maxHeight" as="xs:integer" select="300"/>
    <xsl:variable name="spacing" as="xs:integer" select="100"/>
    <xsl:variable name="maxWidth" as="xs:integer" select="($spacing) * 3"/>

    <xsl:template name="xsl:initial-template">
        <svg height="{$maxHeight + 200}" width="100%"
            viewBox="-50 -{$maxHeight + 100} {$maxWidth + 100} {$maxHeight + 200}">
            <defs>
                <style type="text/css">
                    @import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&amp;family=Playfair+Display&amp;family=Trirong:wght@100&amp;display=swap');</style>
            </defs>
            
            <!-- TITLE AND AXIS LABELS -->
            <text text-anchor="middle" x="{$maxWidth div 2}" y="-{$maxHeight + 50}" stroke="#E0E0E0" fill="E0E0E0">Inflictor Gender
                versus Receiver Gender</text>
            <text text-anchor="middle" x="{$maxWidth div 2}" y="50" stroke="#E0E0E0" fill="E0E0E0">Pain Receivers</text>
            <text text-anchor="middle" writing-mode="tb" y="-{$maxWidth div 2}" x="-75" stroke="#E0E0E0" fill="E0E0E0">Pain
                Inflictors</text>

            <!-- X AXIS LINES (HORIZONTAL) -->
            <xsl:for-each select="0 to 3">
                <xsl:variable name="lineHeight" as="xs:double" select=". div 3 * $maxHeight"/>
                <line x1="0" x2="{$maxWidth}" y1="-{$lineHeight}" y2="-{$lineHeight}" stroke="#E0E0E0"
                    stroke-width="1"/>
            </xsl:for-each>
            
         <!-- Y AXIS LABELS -->
            <text x="-10" y="-100" text-anchor="end" dominant-baseline="middle" font-size="13" stroke="#E0E0E0" fill="#E0E0E0">Men</text>
            <text x="-10" y="-200" text-anchor="end" dominant-baseline="middle" font-size="13" stroke="#E0E0E0" fill="#E0E0E0">
                Women</text>
            <text x="-10" y="-300" text-anchor="end" dominant-baseline="middle" font-size="13" stroke="#E0E0E0" fill="#E0E0E0">Mix</text>
            
            <!-- Y AXIS LINES (VERTICAL) -->
            <xsl:for-each select="1 to 3">
                <xsl:variable name="xPos" as="xs:double" select="((. - 1) * $spacing) + ($spacing div 2)"/>
                <line y1="0" y2="-{$maxHeight + 25}" x1="{$xPos}" x2="{$xPos}" stroke="#E0E0E0" stroke-width="1"/>
            </xsl:for-each>
            
           <!-- X AXIS LABELS -->
            <text x="50" y="15" text-anchor="middle" dominant-baseline="middle" font-size="13" stroke="#E0E0E0" fill="#E0E0E0">Men</text>
            <text x="150" y="15" text-anchor="middle" dominant-baseline="middle" font-size="13" stroke="#E0E0E0" fill="#E0E0E0">Women</text>
            <text x="250" y="15" text-anchor="middle" dominant-baseline="middle" font-size="13" stroke="#E0E0E0" fill="#E0E0E0">Mix</text>
            
            <!-- CIRCLES -->
            <!-- ALL DATA VARIABLES -->
            <xsl:variable name="recMan_infMan" as="xs:integer" select="count($all_tragedies//painStart[@recGen eq 'man'][@infGen eq 'man'])"/>
            <xsl:variable name="recMan_infWoman" as="xs:integer" select="count($all_tragedies//painStart[@recGen eq 'man'][@infGen eq 'woman'])"/>
            <xsl:variable name="recMan_infMix" as="xs:integer" select="count($all_tragedies//painStart[@recGen eq 'man'][@infGen eq 'mix'])"/>   
            <xsl:variable name="recWoman_infMan" as="xs:integer" select="count($all_tragedies//painStart[@recGen eq 'woman'][@infGen eq 'man'])"/>
            <xsl:variable name="recWoman_infWoman" as="xs:integer" select="count($all_tragedies//painStart[@recGen eq 'woman'][@infGen eq 'woman'])"/>
            <xsl:variable name="recWoman_infMix" as="xs:integer" select="count($all_tragedies//painStart[@recGen eq 'woman'][@infGen eq 'mix'])"/>
            <xsl:variable name="recMix_infMan" as="xs:integer" select="count($all_tragedies//painStart[@recGen eq 'mix'][@infGen eq 'man'])"/>
            <xsl:variable name="recMix_infWoman" as="xs:integer" select="count($all_tragedies//painStart[@recGen eq 'mix'][@infGen eq 'woman'])"/>
            <xsl:variable name="recMix_infMix" as="xs:integer" select="count($all_tragedies//painStart[@recGen eq 'mix'][@infGen eq 'mix'])"/>
              
             
            <!-- MALE RECEIVERS -->
            <circle cx="50" cy="-100" r="{10 * math:sqrt($recMan_infMan div math:pi())}" fill="#BF9000" opacity=".50"/>
            <text x="50" y="-100" text-anchor="middle" stroke="#FFFFFF" fill="#FFFFFF" font-size="10">
                <xsl:value-of select="$recMan_infMan"/></text>
            <circle cx="50" cy="-200" r="{10 * math:sqrt($recMan_infWoman div math:pi())}" fill="#BF9000" opacity=".50"/>
            <text x="50" y="-200" text-anchor="middle" stroke="#FFFFFF" fill="#FFFFFF" font-size="10">
                <xsl:value-of select="$recMan_infWoman"/></text>
            <circle cx="50" cy="-300" r="{10 * math:sqrt($recMan_infMix div math:pi())}" fill="#BF9000" opacity=".50"/>
            
            
            <!-- FEMALE RECEIVERS -->
            <circle cx="150" cy="-100" r="{10 * math:sqrt($recWoman_infMan div math:pi())}" fill="#BF9000" opacity=".50"/> 
            <text x="150" y="-100" text-anchor="middle" stroke="#FFFFFF" fill="#FFFFFF" font-size="10">
                <xsl:value-of select="$recWoman_infMan"/></text> 
            <circle cx="150" cy="-200" r="{10 * math:sqrt($recWoman_infWoman div math:pi())}" fill="#BF9000" opacity=".50"/>
            <text x="150" y="-200" text-anchor="middle" stroke="#FFFFFF" fill="#FFFFFF" font-size="10">
                <xsl:value-of select="$recWoman_infWoman"/></text>
            <circle cx="150" cy="-300" r="{10 * math:sqrt($recWoman_infMix div math:pi())}" fill="#BF9000" opacity=".50"/>
            <text x="150" y="-300" text-anchor="middle" stroke="#FFFFFF" fill="#FFFFFF" font-size="10">
                <xsl:value-of select="$recWoman_infMix"/></text>
           
            <!-- MIX RECEIVERS -->
            <circle cx="250" cy="-100" r="{10 * math:sqrt($recMix_infMan div math:pi())}" fill="#BF9000" opacity=".50"/>
            <text x="250" y="-100" text-anchor="middle" stroke="#FFFFFF" fill="#FFFFFF" font-size="10">
                <xsl:value-of select="$recMix_infMan"/></text> 
            <circle cx="250" cy="-200" r="{10 * math:sqrt($recMix_infWoman div math:pi())}" fill="#BF9000" opacity=".50"/>
            <text x="250" y="-200" text-anchor="middle" stroke="#FFFFFF" fill="#FFFFFF" font-size="10">
                <xsl:value-of select="$recMix_infWoman"/></text> 
            <circle cx="250" cy="-300" r="{10 * math:sqrt($recMix_infMix div math:pi())}" fill="#BF9000" opacity=".50"/>
        </svg>
    </xsl:template>
</xsl:stylesheet>