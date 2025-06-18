<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
   <html>
      <head></head>
      <body>
		  <xsl:apply-templates mode="encabezados"/>
         <ul>
         <xsl:apply-templates  mode="lista"/>
         </ul>
      </body>
   </html>
</xsl:template>
<xsl:template match="módulo" mode="encabezados" >
      <h2><xsl:value-of select="text()" /></h2>
</xsl:template>
<xsl:template match="módulo" mode="lista">
      <li><xsl:value-of select="text()" /></li>
</xsl:template>
</xsl:stylesheet>
