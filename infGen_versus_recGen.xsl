<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    
    <!-- SET VARIABLE FOR ALL TRAGEDIES -->
    <xsl:variable name="all_tragedies" as="document-node()+"
        select="collection('tragedies?select=*.xml')"/>
    
    <!-- SET GENERAL VARIABLES FOR THE GRAPH -->
    <xsl:variable name="maxHeight" as="xs:integer" select="400"/>
    <xsl:variable name="spacing" as="xs:integer" select="100"/>
    <xsl:variable name="maxWidth" as="xs:integer" select="$spacing * count(distinct-values(//@recGen))"/>
    
    <xsl:template match="/">
        <svg height="{$maxHeight + 200}" width="{$maxWidth + 200}" 
            viewBox="-50 -{$maxHeight + 100} {$maxWidth + 200} {$maxHeight + 200}">
            
     <!-- TITLE AND AXIS LABELS -->       
            <text text-anchor="middle" x="$maxWidth div 2" y="-{$maxHeight + 40}">Inflictor Gender versus Receiver Gender</text>
            <text>Pain Receivers</text>
            <text>Pain Inflictors</text>
            
     <!-- LEGEND -->       
            
            
        </svg>
        
        
        
        
        
    </xsl:template>
    
    
    
</xsl:stylesheet>