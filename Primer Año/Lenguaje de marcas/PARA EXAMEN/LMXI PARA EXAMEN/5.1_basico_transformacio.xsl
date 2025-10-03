<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html</xsl:text>
    <html lang="es" dir="ltr">
      <head>
        <meta charset="UTF-8"/>
        <title>
          <xsl:value-of  select="catalog/@nombre"/>
        </title>
      </head>
      <body>
        <h2>My CD Collection</h2>
        <caption>Lista de CDs</caption>
        <table border="1">
          <tr bgcolor="#9acd32">
            <th>Title</th>
            <th>Artist</th>
          </tr>
          <tr>
            <td><xsl:value-of select="catalog/cd/title"/></td>
            <td><xsl:value-of select="catalog/cd/artist"/></td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>