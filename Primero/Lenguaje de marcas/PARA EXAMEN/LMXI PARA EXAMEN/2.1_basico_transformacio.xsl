<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output encoding="UTF-8" indent="yes" method="html"/>
  <xsl:template match="/">
    <html>
      <head/>
      <body>
        <table border="1">
          <tr bgcolor="gray">
            <th>Alumno</th>
            <th>Nota</th>
          </tr>
          <xsl:apply-templates select="alumnos/alumno"/>
        </table>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="alumno">
    <xsl:element name="tr">
      <xsl:if test="nota &lt; 5">
        <xsl:attribute name="bgcolor">red</xsl:attribute>
      </xsl:if>
      <td>
        <xsl:value-of select="nome"/>
      </td>
      <td>
        <xsl:value-of select="nota"/>
      </td>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
