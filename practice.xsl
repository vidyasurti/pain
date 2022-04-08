<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="all_tragedies" as="document-node()+"
        select="collection('tragedies?select=*.xml')"/>
    <xsl:variable name="all_painStart" as="element(painStart)+" select="$all_tragedies//painStart"/>
    <xsl:template name="xsl:initial-template">
        <practice>
            <!--   <xsl:apply-templates select="$all_tragedies//painStart"/> -->
            <xsl:for-each-group select="$all_painStart" group-by="@recGen">
                <group>
                    <key>
                        <xsl:value-of select="current-grouping-key()"/>
                    </key>
                    <count><xsl:value-of select="count(current-group())"/></count>
                </group>
            </xsl:for-each-group>
        </practice>
    </xsl:template>
    <xsl:template match="painStart">
        <pain>
            <xsl:value-of select="@recGen"/>
        </pain>
    </xsl:template>
</xsl:stylesheet>
