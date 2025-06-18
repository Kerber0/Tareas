<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/módulo">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="profesor">
    <patrón num="1"/>
  </xsl:template>
  <xsl:template match="*">
    <patrón num="2"/>
  </xsl:template>
</xsl:stylesheet>
