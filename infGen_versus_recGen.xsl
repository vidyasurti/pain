<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    
    <!-- SET VARIABLE FOR ALL TRAGEDIES -->
    <xsl:variable name="all_tragedies" as="document-node()+"
        select="collection('tragedies?select=*.xml')"/>
    
</xsl:stylesheet>