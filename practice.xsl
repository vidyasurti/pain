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
            <infNorm>
                <xsl:for-each-group select="$all_painStart" group-by="@infNorm">
                    <group>
                        <key>
                            <xsl:value-of select="current-grouping-key()"/>
                        </key>
                        <count>
                            <xsl:value-of select="count(current-group())"/>
                        </count>
                    </group>
                </xsl:for-each-group>
            </infNorm>
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
        
        <!-- Counts focused on female receivers of pain -->
            <count recGen="woman" painType="em" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'em'])}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
           <count painType="em"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'em'])"/></count>
        </count>
            <count recGen="woman" painType="phys" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'phys'])}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
            <count painType="phys"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'phys'])"/></count>
        </count>
            <count recGen="woman" painType="both" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'both'])}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
            <count painType="both"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'both'])"/></count>
        </count>
            <count recGen="woman" painType="em" recNorm="yes" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'em'][@recNorm eq 'yes'])}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
            <count painType="em"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'em'])"/></count>
            <count recNorm="yes"><xsl:value-of select="count($all_tragedies//painStart[@recNorm eq 'yes'])"/></count>
        </count>
            <count recGen="woman" painType="em" recNorm="no" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'em'][@recNorm eq 'no'])}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
            <count painType="em"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'em'])"/></count>
            <count recNorm="no"><xsl:value-of select="count($all_tragedies//painStart[@recNorm eq 'no'])"/></count>
        </count>
            <count recGen="woman" painType="phys" recNorm="yes" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'phys'][@recNorm eq 'yes'])}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
            <count painType="phys"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'phys'])"/></count>
            <count recNorm="yes"><xsl:value-of select="count($all_tragedies//painStart[@recNorm eq 'yes'])"/></count>
        </count>
            <count recGen="woman" painType="phys" recNorm="no" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'phys'][@recNorm eq 'no'])}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
            <count painType="phys"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'phys'])"/></count>
            <count recNorm="no"><xsl:value-of select="count($all_tragedies//painStart[@recNorm eq 'no'])"/></count>
        </count>
            <count recGen="woman" infGen="man" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@infGen eq 'man'])}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
            <count infGen="man"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'man'])"/></count>
        </count>
            <count recGen="woman" infGen="man" direct="yes" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@infGen eq 'man'][@direct eq 'yes'])}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
            <count infGen="man"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'man'])"/></count>
            <count direct="yes"><xsl:value-of select="count($all_tragedies//painStart[@direct eq 'yes'])"/></count>
        </count>
            <count recGen="woman" infGen="man" direct="no" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@infGen eq 'man'][@direct eq 'no'])}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
            <count infGen="man"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'man'])"/></count>
            <count direct="no"><xsl:value-of select="count($all_tragedies//painStart[@direct eq 'no'])"/></count>
        </count>
        <count recGen="woman" infGen="woman" value="{}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
            <count infGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></count>
            <recwoman_infwoman><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'][@infGen eq 'woman'])"/></recwoman_infwoman>
        </count>
            <count recGen="woman" infGen="mix" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@infGen eq 'mix'])}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
            <count infGen="mix"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'mix'])"/></count>
        </count>
            <count recGen="woman" direct="yes" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@direct eq 'yes'])}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
            <count direct="yes"><xsl:value-of select="count($all_tragedies//painStart[@direct eq 'yes'])"/></count>
        </count>
            <count recGen="woman" direct="no" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@direct eq 'no'])}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
            <indirect><xsl:value-of select="count($all_tragedies//painStart[@direct eq 'no'])"/></indirect>
        </count>
            <count recGen="woman" recNorm="yes" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@recNorm eq 'yes'])}">
            <count recGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></count>
            <count recGen="yes"><xsl:value-of select="count($all_tragedies//painStart[@recNorm eq 'yes'])"/></count>
        </count>
            <count recGen="woman" recNorm="no" value="{count($all_tragedies//painStart[@recGen eq 'woman'][@recNorm eq 'no'])}">
            <woman><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></woman>
            <normno><xsl:value-of select="count($all_tragedies//painStart[@recNorm eq 'no'])"/></normno>
        </count>
        
        <!-- Counts focused on female inflictors of pain -->
            <count infGen="woman" painType="em" value="{count($all_tragedies//painStart[@infGen eq 'woman'][@painType eq 'em'])}">
            <count infGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></count>
            <count painType="em"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'em'])"/></count>
        </count>
            <count infGen="woman" painType="phys" value="{count($all_tragedies//painStart[@infGen eq 'woman'][@painType eq 'phys'])}">
            <count infGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></count>
            <count painType="phys"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'phys'])"/></count>
        </count>
            <count infGen="woman" painType="both" value="{count($all_tragedies//painStart[@infGen eq 'woman'][@painType eq 'both'])}">
            <count infGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></count>
            <count painType="both"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'both'])"/></count>
        </count>
            <count infGen="woman" direct="yes" value="{count($all_tragedies//painStart[@infGen eq 'woman'][@direct eq 'yes'])}">
            <count infGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></count>
            <count direct="yes"><xsl:value-of select="count($all_tragedies//painStart[@direct eq 'yes'])"/></count>
        </count>
            <count infGen="woman" direct="no" value="{count($all_tragedies//painStart[@infGen eq 'woman'][@direct eq 'no'])}">
            <infwoman><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></infwoman>
            <indirect><xsl:value-of select="count($all_tragedies//painStart[@direct eq 'no'])"/></indirect>
        </count>
            <count infGen="woman" infNorm="yes" value="{count($all_tragedies//painStart[@infGen eq 'woman'][@infNorm eq 'yes'])}">
            <count infGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></count>
            <count infNorm="yes"><xsl:value-of select="count($all_tragedies//painStart[@infNorm eq 'yes'])"/></count>
        </count>
            <count infGen="woman" infNorm="no" value="{count($all_tragedies//painStart[@infGen eq 'woman'][@infNorm eq 'no'])}">
            <count infGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></count>
            <count infNorm="no"><xsl:value-of select="count($all_tragedies//painStart[@infNorm eq 'no'])"/></count>
        </count>
       
       <!-- Counts focused on male receivers of pain --> 
            <count recGen="man" painType="em" value="{count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'em'])}">
            <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
            <count painType="em"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'em'])"/></count>
        </count>
            <count recGen="man" painType="phys" value="{count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'phys'])}">
            <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
            <count painType="phys"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'phys'])"/></count>
        </count>
            <count recGen="man" painType="both" value="{count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'both'])}">
            <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
            <count painType="both"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'both'])"/></count>
        </count>
            <count recGen="man" painType="em" recNorm="yes" value="{count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'em'][@recNorm eq 'yes'])}">
                <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
                <count painType="em"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'em'])"/></count>
                <count recNorm="yes"><xsl:value-of select="count($all_tragedies//painStart[@recNorm eq 'yes'])"/></count>
            </count>
            <count recGen="man" painType="em" recNorm="no" value="{count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'em'][@recNorm eq 'no'])}">
                <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
                <count painType="em"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'em'])"/></count>
                <count recNorm="no"><xsl:value-of select="count($all_tragedies//painStart[@recNorm eq 'no'])"/></count>
            </count>
            <count recGen="man" painType="phys" recNorm="yes" value="{count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'phys'][@recNorm eq 'yes'])}">
                <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
                <count painType="phys"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'phys'])"/></count>
                <count recNorm="yes"><xsl:value-of select="count($all_tragedies//painStart[@recNorm eq 'yes'])"/></count>
            </count>
            <count recGen="man" painType="phys" recNorm="no" value="{count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'phys'][@recNorm eq 'no'])}">
                <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
                <count painType="phys"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'phys'])"/></count>
                <count recNorm="no"><xsl:value-of select="count($all_tragedies//painStart[@recNorm eq 'no'])"/></count>
            </count>
            <count recGen="man" painType="both" recNorm="yes" value="{count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'both'][@recNorm eq 'yes'])}">
                <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
                <count painType="both"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'both'])"/></count>
                <count recNorm="yes"><xsl:value-of select="count($all_tragedies//painStart[@recNorm eq 'yes'])"/></count>
            </count>
            <count recGen="man" painType="both" recNorm="no" value="{count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'both'][@recNorm eq 'no'])}">
                <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
                <count painType="both"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'both'])"/></count>
                <count recNorm="no"><xsl:value-of select="count($all_tragedies//painStart[@recNorm eq 'no'])"/></count>
            </count>
            <count recGen="man" infGen="woman" value="{count($all_tragedies//painStart[@recGen eq 'man'][@infGen eq 'woman'])}">
            <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
            <count infGen="woman"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></count>
        </count>
            <count recGen="man" infGen="man" value="{count($all_tragedies//painStart[@recGen eq 'man'][@infGen eq 'man'])}">
            <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
            <count infGen="man"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'man'])"/></count>
        </count>
            <count recGen="man" direct="yes" value="{count($all_tragedies//painStart[@recGen eq 'man'][@direct eq 'yes'])}">
            <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
            <count direct="yes"><xsl:value-of select="count($all_tragedies//painStart[@direct eq 'yes'])"/></count>
        </count>
            <count recGen="man" direct="no" value="{count($all_tragedies//painStart[@recGen eq 'man'][@direct eq 'no'])}">
                <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
                <count direct="no"><xsl:value-of select="count($all_tragedies//painStart[@direct eq 'no'])"/></count>
            </count>
            <count recGen="man" recNorm="yes" value="{count($all_tragedies//painStart[@recGen eq 'man'][@recNorm eq 'yes'])}">
            <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
            <count recNorm="yes"><xsl:value-of select="count($all_tragedies//painStart[@recNorm eq 'yes'])"/></count>
        </count>
            <count recGen="man" recNorm="no" value="{count($all_tragedies//painStart[@recGen eq 'man'][@recNorm eq 'no'])}">
            <count recGen="man"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'man'])"/></count>
            <count recNorm="no"><xsl:value-of select="count($all_tragedies//painStart[@recNorm eq 'no'])"/></count>
        </count>
        
        <!-- Counts focused on male inflictors of pain -->
            <count infGen="man" direct="yes" value="{count($all_tragedies//painStart[@infGen eq 'man'][@direct eq 'yes'])}">
            <count infGen="man"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'man'])"/></count>
            <count direct="yes"><xsl:value-of select="count($all_tragedies//painStart[@direct eq 'yes'])"/></count>
        </count>
            <count infGen="man" direct="no" value="{count($all_tragedies//painStart[@infGen eq 'man'][@direct eq 'no'])}">
                <count infGen="man"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'man'])"/></count>
                <count direct="no"><xsl:value-of select="count($all_tragedies//painStart[@direct eq 'no'])"/></count>
            </count>
            <count infGen="man" infNorm="yes" value="{count($all_tragedies//painStart[@infGen eq 'man'][@infNorm eq 'yes'])}">
            <count infGen="man"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'man'])"/></count>
            <count infNorm="yes"><xsl:value-of select="count($all_tragedies//painStart[@infNorm eq 'yes'])"/></count>
        </count>
            <count infGen="man" infNorm="no" value="{count($all_tragedies//painStart[@infGen eq 'man'][@infNorm eq 'no'])}">
            <count infGen="man"><xsl:value-of select="count($all_tragedies//painStart[@infGen eq 'man'])"/></count>
            <count infNorm="no"><xsl:value-of select="count($all_tragedies//painStart[@infNorm eq 'no'])"/></count>
        </count>
            
       <!-- Counts for mixed gender receivers of pain -->
            <count recGen="mix" painType="em" value="{count($all_tragedies//painStart[@recGen eq 'mix'][@painType eq 'em'])}">
            <recmix><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'mix'])"/></recmix>
            <em><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'em'])"/></em>
        </count>
            <count recGen="mix" painType="phys" value="{count($all_tragedies//painStart[@recGen eq 'mix'][@painType eq 'phys'])}">
            <count recGen="mix"><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'mix'])"/></count>
            <count painType="phys"><xsl:value-of select="count($all_tragedies//painStart[@painType eq 'phys'])"/></count>
        </count>
        </practice>
    </xsl:template>
</xsl:stylesheet>