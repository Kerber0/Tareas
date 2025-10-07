<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Personas con más de 64 años</title>
      </head>
      <body>
        <h2>Personas con más de 64 años</h2>
        <table border="1">
          <tr>
            <th>Código</th>
            <th>Nombre</th>
            <th>Edad</th>
          </tr>
          <xsl:for-each select="personas/persona[edad &gt; 64]">
            <xsl:sort select="edad" data-type="number" order="descending"/>
            <tr>
              <td><xsl:value-of select="@codPER"/></td>
              <td><xsl:value-of select="nombre"/></td>
              <td><xsl:value-of select="edad"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
