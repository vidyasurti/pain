<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
        <sch:pattern> 
            <sch:rule context="painStart"> 
                <assert test="normalize-space(.) and *">
                    Source contains an empty element painStart
                </assert> 
            </sch:rule> 
        </sch:pattern> 
    <sch:pattern> 
        <sch:rule context="painEnd"> 
            <assert test="normalize-space(.) and *">
                Source contains an empty element painEnd
            </assert> 
        </sch:rule> 
    </sch:pattern> 
    </sch:schema>
    
