<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:pattern>
       
        <sch:rule context="painEnd">
            
            <sch:assert test=". = preceding-sibling::painStart">
               The number of painStart elements is equal to the number of painEnd elements 
            </sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>