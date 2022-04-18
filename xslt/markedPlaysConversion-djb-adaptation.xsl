<?xml version="1.0" encoding="UTF-8"?>
<!-- This code is adapted from Dr. David J. Birnbaum's marked plays transformation found here: 
    https://github.com/EmilyMartin42/Shakespearean_Insults/blob/main/XSLT/standoffTesting/markedPlaysConversion-djb.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="#all" version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <!-- ===============================================================  -->
    <!-- Identity transformation                                          -->
    <!-- ===============================================================  -->
    <xsl:mode on-no-match="shallow-copy"/>
    <!-- ===============================================================  -->
    <!-- Stylesheet variables                                             -->
    <!--                                                                  -->
    <!-- $all_speech                                                      -->
    <!--    Flat sequence of all words, punctuation, pain delimiters    -->
    <!-- ===============================================================  -->
    <!-- RICHA - Assuming that painStart and painEnd are delimiters for the all_pain element -->
    <xsl:variable name="all_pain" as="node()+" select="//p/painStart | //p/painEnd | //p/text()"/>
    
    <xsl:variable name = "current_pain-event" as = "xs:integer" select = "0" />



    <!-- outputting root element, applying templates directly to body -->
    <xsl:template match="/">
        <xsl:variable name="doc-name" select="//titleStmt/title[1]"/>
        <xsl:if test="contains($doc-name, '(')"/>
        <xsl:variable name="doc-name" select="concat(substring-before($doc-name, ' ('), '')"/>

        <events_and_full-text>
            <allPainEvents doc-name="{$doc-name}">
                <xsl:apply-templates select="//body" mode="painEventText"/>
            </allPainEvents>

            <tragedyText>
                <xsl:apply-templates select="//body" mode="tragedyText"/>

            </tragedyText>
        </events_and_full-text>

    </xsl:template>

    <!-- RICHA - assuming that match = "body", originally was referring to front for cast list -->
    <xsl:template match="body" mode="painEventText">
        <!-- ============================================================ -->
        <!-- not necessarily for gendered pain project - Copy the cast list and create new <div> for insults          -->
        <!-- ============================================================ -->

        <!--<xsl:copy-of select="@* | node()"/>-->

        <!-- ==================================================== -->
        <!-- Tesselated groups demarcated by pain delimiters    -->
        <!-- ==================================================== -->
        <xsl:for-each-group select="$all_pain" group-starting-with="painStart">
            <xsl:variable name="base-group-number" as="xs:integer">
                <!-- ============================================ -->
                <!-- First group probably isn't a pain event, but    -->
                <!--   adjust baseline for count if it is         -->
                <!-- ============================================ -->
                <xsl:choose>
                    <!-- Make sure that baseline is probably 0, but if the first thing is a painStart, must adjust baseline to -1 instead 0-->
                    <xsl:when test="$all_pain[1][self::painStart]">0</xsl:when>
                    <xsl:otherwise>-1</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:if test=".[self::painStart]">
                <!-- ============================================ -->
                <!-- First and last groups may not be pain events; if -->
                <!-- the group starts as an pain events, it's okay     -->
                <!-- ============================================ -->
                <!--<pain
                            xml:id="pain_{format-number($base-group-number + position(), '0000')}"> -->
                <pain xml:id="pain_{$base-group-number + position()}">
                    <xsl:for-each-group select="current-group()" group-ending-with="painEnd">
                        <xsl:if test="position() eq 1">
                            <!-- ================================ -->
                            <!-- The first subgroup is our pain event -->
                            <xsl:sequence select="current-group()"/>
                            <!-- ================================ -->
                            <!-- Uncomment message for debugging  -->
                            <!--<xsl:message select="data(current-group())"/>-->
                        </xsl:if>
                    </xsl:for-each-group>
                </pain>
            </xsl:if>
        </xsl:for-each-group>


    </xsl:template>

    <xsl:template match="body" mode="tragedyText">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="painStart">
        <xsl:variable name = "current_pain-event" as = "xs:integer" select = ". + 1"/>            
        <mappedPain xml:id="tragedy_{$current_pain-event}"/>
        
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
