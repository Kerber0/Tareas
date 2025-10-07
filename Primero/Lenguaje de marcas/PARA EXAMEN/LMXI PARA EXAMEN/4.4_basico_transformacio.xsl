<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
  <html>
  <body>
    <h2>Listado de Máquinas</h2>
    <table border="1">
      <tr>
        <th>Nombre</th>
        <th>Tipo</th>
        <th>Fabricante</th>
        <th>Sistema Operativo</th>
      </tr>
      <xsl:for-each select="equipos/máquina">
      <tr>
        <td><xsl:value-of select="@nome"/></td>
        <td><xsl:value-of select="hardware/tipo"/></td>
        <td><xsl:value-of select="hardware/fabricante"/></td>
        <td><xsl:value-of select="config/OS"/></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>