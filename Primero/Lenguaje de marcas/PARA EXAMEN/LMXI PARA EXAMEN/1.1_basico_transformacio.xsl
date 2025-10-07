<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
   <html>
      <head/>
      <body>
		  <xsl:apply-templates mode="encabezados"/>
         <ul>
   		<xsl:apply-templates mode="lista"/>
         </ul>
      </body>
   </html>
</xsl:template>
<xsl:template match="módulo" mode="encabezados">
      <h2><xsl:value-of select="text()"/></h2>
</xsl:template>
<xsl:template match="módulo" mode="lista">
      <li><xsl:value-of select="text()"/></li>
</xsl:template>
</xsl:stylesheet>
