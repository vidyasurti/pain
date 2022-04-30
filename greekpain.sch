<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:pattern>
       
        <sch:rule context="sp/painEnd">
            <sch:let name="preceding-painStart-count" value="count(preceding::painStart)"/>
            <sch:let name="preceding-painEnd-count" value="count(preceding::painEnd)"/>
            <sch:assert test= "$preceding-painEnd-count +1 eq $preceding-painStart-count">
                There are <sch:value-of select="$preceding-painEnd-count"/> preceding sibling painEnd elements and <sch:value-of select="$preceding-painStart-count"/> preceding painStart elements
            </sch:assert>
        </sch:rule>
        <sch:rule context="sp/painStart">
            <sch:assert test="following-sibling::painEnd">
                This painStart tag does not have a matching painEnd tag
            </sch:assert>
        </sch:rule>
        
        
    </sch:pattern>
</sch:schema>