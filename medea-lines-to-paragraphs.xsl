<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.tei-c.org/ns/1.0"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="3.0">
  <!-- ================================================================== -->
  <!-- Setup                                                              -->
  <!-- ================================================================== -->
  <xsl:output method="xml" indent="yes"/>
  <!-- ================================================================== -->
  <!-- <teiHeader> to insert into output                                  -->
  <!-- ================================================================== -->
  <xsl:variable name="teiHeader" as="element(tei:teiHeader)">
    <tei:teiHeader>
      <fileDesc>
        <titleStmt>
          <title>Medea</title>
        </titleStmt>
        <publicationStmt>
          <p>Available in <ptr target="https://github.com/vidyasurti/pain"/></p>
        </publicationStmt>
        <sourceDesc>
          <p>Based on materials published at the <ref
              target="https://scaife.perseus.org/reader/urn:cts:greekLit:tlg0006.tlg003.perseus-eng2:0-10000"
              >Perseus Project</ref>.</p>
        </sourceDesc>
      </fileDesc>
      <revisionDesc>
        <change>2022-03-02, David J. Birnbaum. Lines in source merged into paragraphs.</change>
        <change>2022-03-02, David J. Birnbaum. TEI header added.</change>
      </revisionDesc>
    </tei:teiHeader>
  </xsl:variable>
  <!-- ================================================================== -->
  <!-- Identity transformation                                            -->
  <!-- ================================================================== -->
  <xsl:mode on-no-match="shallow-copy"/>
  <xsl:mode on-no-match="shallow-copy" name="second-pass"/>
  <!-- ================================================================== -->
  <!-- Remove unused attribute in foreign namespace                       -->
  <!-- ================================================================== -->
  <xsl:template match="TEI">
    <xsl:copy>
      <xsl:sequence select="$teiHeader"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  <!-- ================================================================== -->
  <!-- Main                                                               -->
  <!-- First pass forms lines into paragraphs, but still need to merge    -->
  <!--   quotes that were split over lines (4 instances)                  -->
  <!-- ================================================================== -->
  <xsl:template match="sp">
    <xsl:copy>
      <xsl:copy-of select="speaker"/>
      <xsl:variable name="first-pass" as="element(tei:p)">
        <!-- ============================================================ -->
        <!-- Save merged paragraph in variable and send to second pass    -->
        <!--   to combine split quotes                                    -->
        <!-- Remove milestone, pb, and note elements entirely                  -->
        <!-- ============================================================ -->
        <p>
          <xsl:apply-templates select="* except speaker"/>
        </p>
      </xsl:variable>
      <xsl:apply-templates select="$first-pass" mode="second-pass"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="note | milestone | pb"/>
  <xsl:template match="l">
    <xsl:apply-templates/>
  </xsl:template>
  <!-- ================================================================== -->
  <!-- Mode second-pass                                                   -->
  <!--                                                                    -->
  <!-- Merge adjacent <q> elements, along with possible intervening       -->
  <!--   whitespace-only text nodes                                       -->
  <!-- Thanks to Norm Walsh on xsl-list 2022-03-03                        -->
  <!-- ================================================================== -->
  <xsl:template match="p" mode="second-pass">
    <p>
      <xsl:for-each-group select="node()"
        group-adjacent="self::q or self::text()[normalize-space(.) = '']">
        <xsl:choose>
          <xsl:when
            test="current-grouping-key() and (. instance of element(tei:q) or count(current-group()) gt 1)">
            <q>
              <xsl:for-each select="current-group()">
                <xsl:if test="position() gt 1">
                  <xsl:text> </xsl:text>
                </xsl:if>
                <xsl:sequence select="node()"/>
              </xsl:for-each>
            </q>
          </xsl:when>
          <xsl:otherwise>
            <xsl:sequence select="current-group()"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each-group>
    </p>
  </xsl:template>
</xsl:stylesheet>
