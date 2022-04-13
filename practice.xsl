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
            <rec>
                <xsl:for-each-group select="$all_painStart" group-by="@rec">
                    <group>
                        <key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </key>
                        <count>
                            <xsl:value-of select="count(current-group())"/>
                        </count>
                    </group>
                </xsl:for-each-group>
            </rec>
            <recGen>
                <xsl:for-each-group select="$all_painStart" group-by="@recGen">
                    <group>
                        <key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </key>
                        <count>
                            <xsl:value-of select="count(current-group())"/>
                        </count>
                    </group>
                </xsl:for-each-group>
            </recGen>
            <painType>
                <xsl:for-each-group select="$all_painStart" group-by="@painType">
                    <group>
                        <key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </key>
                        <count>
                            <xsl:value-of select="count(current-group())"/>
                        </count>
                    </group>
                </xsl:for-each-group>
            </painType>
            
            <inf>
                <xsl:for-each-group select="$all_painStart" group-by="@inf">
                    <group>
                        <key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </key>
                        <count>
                            <xsl:value-of select="count(current-group())"/>
                        </count>
                    </group>
                </xsl:for-each-group>
            </inf>
            <infGen>
                <xsl:for-each-group select="$all_painStart" group-by="@infGen">
                    <group>
                        <key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </key>
                        <count>
                            <xsl:value-of select="count(current-group())"/>
                        </count>
                    </group>
                </xsl:for-each-group>
            </infGen>
            <recRel>
                <xsl:for-each-group select="$all_painStart" group-by="@recRel">
                    <group>
                        <key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </key>
                        <count>
                            <xsl:value-of select="count(current-group())"/>
                        </count>
                    </group>
                </xsl:for-each-group>
            </recRel>
            
            <infRel>
                <xsl:for-each-group select="$all_painStart" group-by="@infRel">
                    <group>
                        <key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </key>
                        <count>
                            <xsl:value-of select="count(current-group())"/>
                        </count>
                    </group>
                </xsl:for-each-group>
            </infRel>
            <direct>
                <xsl:for-each-group select="$all_painStart" group-by="@direct">
                    <group>
                        <key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </key>
                        <count>
                            <xsl:value-of select="count(current-group())"/>
                        </count>
                    </group>
                </xsl:for-each-group>
            </direct>
        </practice>
        <woman-em>
            <woman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></woman>
            <em><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'em'])"/></em>
            <woman_em><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'em'])"/></woman_em>
        </woman-em>
        <woman-phys>
            <woman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></woman>
            <phys><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'phys'])"/></phys>
            <woman_phys><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'phys'])"/></woman_phys>
        </woman-phys>
        <woman-both>
            <woman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></woman>
            <both><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'both'])"/></both>
            <woman_both><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'both'])"/></woman_both>
        </woman-both>
        <woman-direct>
            <woman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></woman>
            <direct><xsl:apply-templates select="count($all_tragedies//painStart[@direct eq 'yes'])"/></direct>
            <woman_direct><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@direct eq 'yes'])"/></woman_direct>
        </woman-direct>
        <woman-indirect>
            <woman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></woman>
            <indirect><xsl:apply-templates select="count($all_tragedies//painStart[@direct eq 'no'])"/></indirect>
            <woman_indirect><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@direct eq 'no'])"/></woman_indirect>
        </woman-indirect>
        <man-em>
            <man><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'])"/></man>
            <em><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'em'])"/></em>
            <man_em><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'em'])"/></man_em>
        </man-em>
        <man-phys>
            <man><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'])"/></man>
            <phys><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'phys'])"/></phys>
            <man_phys><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'phys'])"/></man_phys>
        </man-phys>
        <man-both>
            <man><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'])"/></man>
            <both><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'both'])"/></both>
            <man_both><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'both'])"/></man_both>
        </man-both>
        <man-direct>
            <man><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'])"/></man>
            <direct><xsl:apply-templates select="count($all_tragedies//painStart[@direct eq 'yes'])"/></direct>
            <man_direct><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'][@direct eq 'yes'])"/></man_direct>
        </man-direct>
        <mix-em>
            <mix><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'mix'])"/></mix>
            <em><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'em'])"/></em>
            <mix_em><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'mix'][@painType eq 'em'])"/></mix_em>
        </mix-em>
        <mix-phys>
            <mix><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'mix'])"/></mix>
            <phys><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'phys'])"/></phys>
            <mix_phys><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'mix'][@painType eq 'phys'])"/></mix_phys>
        </mix-phys>
    </xsl:template>



    <!--  <xsl:template match="painStart">
        <pain>
            <xsl:value-of select="@recGen"/>
        </pain> 
    </xsl:template> -->
</xsl:stylesheet>
