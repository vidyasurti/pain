<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>


    <xsl:template match="/">
        <html>
            <head>

                <title>
                    <xsl:apply-templates select="/events_and_full-text/@doc-name"/> Reading View
                    <!--<xsl:apply-templates select="//titleStmt/title[1]"/> -->
                </title>
                <link rel="stylesheet" type="text/css" href="reading-view.css"/>
            </head>
            <body>
                <xsl:comment>#include virtual="menu.xhtml" </xsl:comment>
                <h2 class="page-title">Events of Pain in <xsl:apply-templates
                        select="/events_and_full-text/@doc-name"/>
                </h2>
                <div class="instructions">
                    <p> You may view <b>specific instances of pain using the pane on the left</b>,
                        and <b>read the full text for <xsl:apply-templates
                                select="/events_and_full-text/@doc-name"/> on the right</b>. Once
                        you <em>click on a specific pain event on the left</em>, the play on the
                        right scrolls to where that pain event is located in the play. </p>
                </div>


                <button type="button" class="collapsible">Open Collapsible</button>
                <p class="filtering-title">Filter based on: </p>
                <div>
                    <p class="subheader">Characteristics that appear in all events of pain</p>
                    <section>
                        <p>Gender of person experiencing pain:</p>
                        <input value="value" type="checkbox" id="male-rec" name="male-rec"/>
                        <label for="male-rec">Male</label>
                        <input value="value" type="checkbox" id="female-rec" name="female-rec"/>
                        <label for="female-rec">Female</label>
                        <input value="value" type="checkbox" id="mixed-rec" name="mixed-rec"/>
                        <label for="mixed-rec">Mixed</label>
                    </section>

                    <section>
                        <p>Type of pain being experienced:</p>
                        <input value="value" type="checkbox" id="em-pain" name="em-pain"/>
                        <label for="male-rec">Emotional</label>
                        <input value="value" type="checkbox" id="phys-pain" name="phys-pain"/>
                        <label for="female-rec">Physical</label>
                        <input value="value" type="checkbox" id="both-pain" name="both-pain"/>
                        <label for="mixed-rec">Both</label>
                    </section>
                </div>

                <div>
                    <p class="subheader">Optional characteristics that appear only in events of pain
                        with an inflictor</p>
                    <section>
                        <p>Gender of person inflicting pain pain:</p>
                        <input value="value" type="checkbox" id="male-inf" name="male-inf"/>
                        <label for="male-inf">Male</label>
                        <input value="value" type="checkbox" id="female-inf" name="female-inf"/>
                        <label for="female-inf">Female</label>
                        <input value="value" type="checkbox" id="mixed-inf" name="mixed-inf"/>
                        <label for="mixed-inf">Mixed</label>
                    </section>

                    <section>
                        <p>Whether pain is direct or indirect:</p>
                        <input value="value" type="radio" id="direct-pain" name="direct-pain"/>
                        <label for="direct-pain">Direct</label>
                        <input value="value" type="radio" id="indirect-pain" name="indirect-pain"/>
                        <label for="female-rec">Indirect</label>
                    </section>
                </div>



                <div class="both-texts">
                    <section class="painEvents">
                        <xsl:apply-templates select="//allPainEvents" mode="events-only"/>
                    </section>
                    <section class="fullPlay">
                        <xsl:apply-templates select="//tragedyText" mode="full-text"/>
                    </section>
                </div>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="allPainEvents" mode="events-only">
        <h3> Specific Pain Events in <xsl:apply-templates select="/events_and_full-text/@doc-name"/>
        </h3>
        <xsl:apply-templates select="pain" mode="events-only"/>
    </xsl:template>

    <xsl:template match="pain" mode="events-only">
        <p>
            <a class="pain-event tooltip" href="#tragedy-{@xml:id}" id="event-{@xml:id}">
                <q>
                    <xsl:apply-templates/>
                </q>
                <span class="tooltiptext">Rec: <xsl:apply-templates select="painStart/@rec"/>, Rec
                    Gen: <xsl:apply-templates select="painStart/@recGen"/>, Rec Norm:
                        <xsl:apply-templates select="painStart/@recNorm"/>, Pain type:
                        <xsl:apply-templates select="painStart/@painType"/>
                    <xsl:if test="string-length(painStart/@inf) gt 0"> , Inf: <xsl:apply-templates
                            select="painStart/@inf"/>, Inf Gen: <xsl:apply-templates
                            select="painStart/@infGen"/>, Inf Norm: <xsl:apply-templates
                            select="painStart/@infNorm"/>, Rec Rel: <xsl:apply-templates
                            select="painStart/@recRel"/>, Inf Rel: <xsl:apply-templates
                            select="painStart/@infRel"/>, Direct: <xsl:apply-templates
                            select="painStart/@direct"/></xsl:if></span>
            </a>

        </p>

    </xsl:template>

    <xsl:template match="tragedyText" mode="full-text">
        <h3><xsl:apply-templates select="/events_and_full-text/@doc-name"/> Full Text</h3>
        <xsl:apply-templates mode="full-text"/>

    </xsl:template>

    <xsl:template match="div1" mode="full-text">
        <div class="div1">
            <hr/>
            <xsl:apply-templates mode="full-text"/>
            <br/>
        </div>
    </xsl:template>

    <xsl:template match="div1/stage" mode="full-text">

        <p class="stage">
            <xsl:apply-templates mode="full-text"/>
        </p>
    </xsl:template>

    <xsl:template match="//sp/stage" mode="full-text">

        <p class="stage">
            <xsl:apply-templates mode="full-text"/>
        </p>
    </xsl:template>

    <xsl:template match="//sp/speaker" mode="full-text">

        <p class="speaker">
            <xsl:apply-templates mode="full-text"/>
        </p>
    </xsl:template>

    <xsl:template match="//sp/p" mode="full-text">

        <p class="p">
            <xsl:apply-templates mode="full-text"/>
        </p>
    </xsl:template>

    <xsl:template match="p/speaker" mode="full-text">
        <br/>
        <a class="speaker">
            <xsl:apply-templates mode="full-text"/>
        </a>
    </xsl:template>

    <xsl:template match="p/stage" mode="full-text">
        <br/>
        <a class="stage">
            <xsl:apply-templates mode="full-text"/>
        </a>
    </xsl:template>

    <!-- Tagging the links -->

    <!-- What I came up with 
    <xsl:template match = "painStart" mode = "full-text">
        
        <xsl:variable name = "tragedy-num" as = "xs:integer" select = "count(preceding::painStart) + 1 - (count(//painStart) div 2)"/>
        <a href = "#event-{$tragedy-num}" id = "tragedy-{$tragedy-num}">
            <xsl:apply-templates />
        </a>
    </xsl:template> -->

    <!-- djb suggestion -->
    <xsl:template match="painStart" mode="full-text">
        <xsl:variable name="tragedy-num" as="xs:integer"
            select="count(preceding::painStart[ancestor::tragedyText]) + 1"/>
        <a href="#event-pain_{$tragedy-num}" id="tragedy-pain_{$tragedy-num}">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
</xsl:stylesheet>
