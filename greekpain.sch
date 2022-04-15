<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:pattern>
       
        <sch:rule context="p/painEnd">
            <sch:let name="preceding-sibling-painStart-count" value="count(preceding-sibling::painStart)"/>
            <sch:let name="preceding-sibling-painEnd-count" value="count(preceding-sibling::painEnd)"/>
            <sch:assert test= "$preceding-sibling-painEnd-count +1 eq $preceding-sibling-painStart-count">
                There are <sch:value-of select="$preceding-sibling-painEnd-count"/> preceding sibling painEnd elements and <sch:value-of select="$preceding-sibling-painStart-count"/> preceding painStart elements
            </sch:assert>
        </sch:rule>
        <sch:rule context="p/painStart">
            <sch:assert test="following-sibling::painEnd">
                This painStart tag does not have a matching painEnd tag
            </sch:assert>
            
        </sch:rule>
    </sch:pattern>
</sch:schema>