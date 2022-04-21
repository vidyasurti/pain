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
        
        <!-- Counts focused on female receivers of pain -->
        <recwoman-em>
            <recwoman><xsl:value-of select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <em><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'em'])"/></em>
            <recwoman_em><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'em'])"/></recwoman_em>
        </recwoman-em>
        <recwoman-phys>
            <recwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <phys><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'phys'])"/></phys>
            <recwoman_phys><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'phys'])"/></recwoman_phys>
        </recwoman-phys>
        <recwoman-both>
            <recwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <both><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'both'])"/></both>
            <recwoman_both><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'both'])"/></recwoman_both>
        </recwoman-both>
        <recwoman-em-normyes>
            <recwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <em><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'em'])"/></em>
            <normyes><xsl:apply-templates select="count($all_tragedies//painStart[@recNorm eq 'yes'])"/></normyes>
            <recwoman_em_normyes><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'em'][@recNorm eq 'yes'])"/></recwoman_em_normyes>
        </recwoman-em-normyes>
        <recwoman-em-normno>
            <recwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <em><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'em'])"/></em>
            <normno><xsl:apply-templates select="count($all_tragedies//painStart[@recNorm eq 'no'])"/></normno>
            <recwoman_em_normno><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'em'][@recNorm eq 'no'])"/></recwoman_em_normno>
        </recwoman-em-normno>
        <recwoman-phys-normyes>
            <recwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <phys><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'phys'])"/></phys>
            <normyes><xsl:apply-templates select="count($all_tragedies//painStart[@recNorm eq 'yes'])"/></normyes>
            <recwoman_phys_normyes><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'phys'][@recNorm eq 'yes'])"/></recwoman_phys_normyes>
        </recwoman-phys-normyes>
        <recwoman-phys-normno>
            <recwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <phys><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'phys'])"/></phys>
            <normyes><xsl:apply-templates select="count($all_tragedies//painStart[@recNorm eq 'no'])"/></normyes>
            <recwoman_phys_normno><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@painType eq 'phys'][@recNorm eq 'no'])"/></recwoman_phys_normno>
        </recwoman-phys-normno>
        <recwoman-infman>
            <recwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <infman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'man'])"/></infman>
            <recwoman_infman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@infGen eq 'man'])"/></recwoman_infman>
        </recwoman-infman>
        <recwoman-infman-direct>
            <recwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <infman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'man'])"/></infman>
            <direct><xsl:apply-templates select="count($all_tragedies//painStart[@direct eq 'yes'])"/></direct>
            <recwoman_infman_direct><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@infGen eq 'man'][@direct eq 'yes'])"/></recwoman_infman_direct>
        </recwoman-infman-direct>
        <recwoman-infman-indirect>
            <recwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <infman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'man'])"/></infman>
            <indirect><xsl:apply-templates select="count($all_tragedies//painStart[@direct eq 'no'])"/></indirect>
            <recwoman_infman_indirect><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@infGen eq 'man'][@direct eq 'no'])"/></recwoman_infman_indirect>
        </recwoman-infman-indirect>
        <recwoman-infwoman>
            <recwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <infwoman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></infwoman>
            <recwoman_infwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@infGen eq 'woman'])"/></recwoman_infwoman>
        </recwoman-infwoman>
        <recwoman-infmix>
            <recwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <infmix><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'mix'])"/></infmix>
            <recwoman_infmix><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@infGen eq 'mix'])"/></recwoman_infmix>
        </recwoman-infmix>
        <recwoman-direct>
            <recwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <direct><xsl:apply-templates select="count($all_tragedies//painStart[@direct eq 'yes'])"/></direct>
            <recwoman_direct><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@direct eq 'yes'])"/></recwoman_direct>
        </recwoman-direct>
        <recwoman-indirect>
            <recwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <indirect><xsl:apply-templates select="count($all_tragedies//painStart[@direct eq 'no'])"/></indirect>
            <recwoman_indirect><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@direct eq 'no'])"/></recwoman_indirect>
        </recwoman-indirect>
        <recwoman-normyes>
            <recwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></recwoman>
            <normyes><xsl:apply-templates select="count($all_tragedies//painStart[@recNorm eq 'yes'])"/></normyes>
            <recwoman_normyes><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@recNorm eq 'yes'])"/></recwoman_normyes>
        </recwoman-normyes>
        <recwoman-normno>
            <woman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'])"/></woman>
            <normno><xsl:apply-templates select="count($all_tragedies//painStart[@recNorm eq 'no'])"/></normno>
            <woman_normno><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'woman'][@recNorm eq 'no'])"/></woman_normno>
        </recwoman-normno>
        
        <!-- Counts focused on female inflictors of pain -->
        <infwoman-em>
            <infwoman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></infwoman>
            <em><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'em'])"/></em>
            <infwoman_em><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'][@painType eq 'em'])"/></infwoman_em>
        </infwoman-em>
        <infwoman-phys>
            <infwoman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></infwoman>
            <phys><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'phys'])"/></phys>
            <infwoman_phys><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'][@painType eq 'phys'])"/></infwoman_phys>
        </infwoman-phys>
        <infwoman-both>
            <infwoman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></infwoman>
            <both><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'both'])"/></both>
            <infwoman_both><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'][@painType eq 'both'])"/></infwoman_both>
        </infwoman-both>
        <infwoman-direct>
            <infwoman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></infwoman>
            <direct><xsl:apply-templates select="count($all_tragedies//painStart[@direct eq 'yes'])"/></direct>
            <infwoman_direct><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'][@direct eq 'yes'])"/></infwoman_direct>
        </infwoman-direct>
        <infwoman-indirect>
            <infwoman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></infwoman>
            <indirect><xsl:apply-templates select="count($all_tragedies//painStart[@direct eq 'no'])"/></indirect>
            <infwoman_indirect><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'][@direct eq 'no'])"/></infwoman_indirect>
        </infwoman-indirect>
        <infwoman-normyes>
            <infwoman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></infwoman>
            <normyes><xsl:apply-templates select="count($all_tragedies//painStart[@infNorm eq 'yes'])"/></normyes>
            <infwoman_normyes><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'][@infNorm eq 'yes'])"/></infwoman_normyes>
        </infwoman-normyes>
        <infwoman-normno>
            <infwoman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></infwoman>
            <normno><xsl:apply-templates select="count($all_tragedies//painStart[@infNorm eq 'no'])"/></normno>
            <infwoman_normno><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'][@infNorm eq 'no'])"/></infwoman_normno>
        </infwoman-normno>
       
       <!-- Counts focused on male receivers of pain --> 
        <recman-em>
            <recman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'])"/></recman>
            <em><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'em'])"/></em>
            <recman_em><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'em'])"/></recman_em>
        </recman-em>
        <recman-phys>
            <recman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'])"/></recman>
            <phys><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'phys'])"/></phys>
            <recman_phys><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'phys'])"/></recman_phys>
        </recman-phys>
        <recman-both>
            <recman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'])"/></recman>
            <both><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'both'])"/></both>
            <recman_both><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'][@painType eq 'both'])"/></recman_both>
        </recman-both>
        <recman-infwoman>
            <recman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'])"/></recman>
            <infwoman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'woman'])"/></infwoman>
            <recman_infwoman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'][@infGen eq 'woman'])"/></recman_infwoman>
        </recman-infwoman>
        <recman-infman>
            <recman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'])"/></recman>
            <infman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'man'])"/></infman>
            <recman_infman><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'][@infGen eq 'man'])"/></recman_infman>
        </recman-infman>
        <recman-direct>
            <man><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'])"/></man>
            <direct><xsl:apply-templates select="count($all_tragedies//painStart[@direct eq 'yes'])"/></direct>
            <man_direct><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'][@direct eq 'yes'])"/></man_direct>
        </recman-direct>
        <recman-normyes>
            <man><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'])"/></man>
            <normyes><xsl:apply-templates select="count($all_tragedies//painStart[@recNorm eq 'yes'])"/></normyes>
            <man_normyes><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'][@recNorm eq 'yes'])"/></man_normyes>
        </recman-normyes>
        <recman-normno>
            <man><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'])"/></man>
            <normno><xsl:apply-templates select="count($all_tragedies//painStart[@recNorm eq 'no'])"/></normno>
            <man_normno><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'man'][@recNorm eq 'no'])"/></man_normno>
        </recman-normno>
        
        <!-- Counts focused on male inflictors of pain -->
        <infman-direct>
            <man><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'man'])"/></man>
            <direct><xsl:apply-templates select="count($all_tragedies//painStart[@direct eq 'yes'])"/></direct>
            <man_direct><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'man'][@direct eq 'yes'])"/></man_direct>
        </infman-direct>
        <infman-normyes>
            <infman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'man'])"/></infman>
            <normyes><xsl:apply-templates select="count($all_tragedies//painStart[@infNorm eq 'yes'])"/></normyes>
            <infman_normyes><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'man'][@infNorm eq 'yes'])"/></infman_normyes>
        </infman-normyes>
        <infman-normno>
            <infman><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'man'])"/></infman>
            <normno><xsl:apply-templates select="count($all_tragedies//painStart[@infNorm eq 'no'])"/></normno>
            <infman_normno><xsl:apply-templates select="count($all_tragedies//painStart[@infGen eq 'man'][@infNorm eq 'no'])"/></infman_normno>
        </infman-normno>
        <recmix-em>
            <recmix><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'mix'])"/></recmix>
            <em><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'em'])"/></em>
            <recmix_em><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'mix'][@painType eq 'em'])"/></recmix_em>
        </recmix-em>
        <recmix-phys>
            <recmix><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'mix'])"/></recmix>
            <phys><xsl:apply-templates select="count($all_tragedies//painStart[@painType eq 'phys'])"/></phys>
            <recmix_phys><xsl:apply-templates select="count($all_tragedies//painStart[@recGen eq 'mix'][@painType eq 'phys'])"/></recmix_phys>
        </recmix-phys>
        </practice>
    </xsl:template>
    

    <!--  <xsl:template match="painStart">
        <pain>
            <xsl:value-of select="@recGen"/>
        </pain> 
    </xsl:template> -->
</xsl:stylesheet>
