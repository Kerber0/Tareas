<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output encoding="UTF-8" indent="yes" method="xml"/>
  <xsl:template match="/">
    <xsl:element name="almacenamento">
      <xsl:element name="discos">
        <xsl:attribute name="num">
          <xsl:value-of select="count(//disco)"/>
        </xsl:attribute>
        <xsl:copy-of select="equipos/máquina/hardware/disco"/>
      </xsl:element>
      <xsl:element name="memorias">
        <xsl:attribute name="num">
          <xsl:value-of select="count(//memoria)"/>
        </xsl:attribute>
        <xsl:copy-of select="equipos/máquina/hardware/memoria"/>
      </xsl:element>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
