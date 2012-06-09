<?xml version="1.0" encoding="UTF-8"?>
<?altova_samplexml EverythingResults.xml?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:geo="http://aims.fao.org/aos/geopolitical.owl#" xmlns:afn="http://jena.hpl.hp.com/ARQ/function#" xmlns:prns="http://profiles.catalyst.harvard.edu/ontology/prns#" xmlns:obo="http://purl.obolibrary.org/obo/" xmlns:dcelem="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:event="http://purl.org/NET/c4dm/event.owl#" xmlns:bibo="http://purl.org/ontology/bibo/" xmlns:vann="http://purl.org/vocab/vann/" xmlns:vitro07="http://vitro.mannlib.cornell.edu/ns/vitro/0.7#" xmlns:vitro="http://vitro.mannlib.cornell.edu/ns/vitro/public#" xmlns:vivo="http://vivoweb.org/ontology/core#" xmlns:pvs="http://vivoweb.org/ontology/provenance-support#" xmlns:scirr="http://vivoweb.org/ontology/scientific-research-resource#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:xsd="http://www.w3.org/2001/XMLSchema#" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:swvs="http://www.w3.org/2003/06/sw-vocab-status/ns#" xmlns:skco="http://www.w3.org/2004/02/skos/core#" xmlns:owl2="http://www.w3.org/2006/12/owl2-xml#" xmlns:skos="http://www.w3.org/2008/05/skos#" xmlns:foaf="http://xmlns.com/foaf/0.1/">
  <xsl:output method="html"/>

  <xsl:template match="/">

    <xsl:choose>
      <xsl:when test="number(rdf:RDF/rdf:Description/prns:numberOfConnections)">
        <xsl:variable name="document" select="rdf:RDF"></xsl:variable>                            
          <xsl:for-each select="/rdf:RDF/rdf:Description/prns:hasConnection">
          <xsl:variable name="nodeID" select="@rdf:nodeID"/>
          <xsl:for-each select="/rdf:RDF/rdf:Description[@rdf:nodeID=$nodeID]">
            <xsl:variable name="nodeURI" select="rdf:object/@rdf:resource"/>
              <xsl:for-each select="/rdf:RDF/rdf:Description[@rdf:about=$nodeURI]">
                {$nodeURI}
              </xsl:for-each>
          </xsl:for-each>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>No matching results.</xsl:text>
      </xsl:otherwise>
    </xsl:choose>



  </xsl:template>
  
</xsl:stylesheet>
