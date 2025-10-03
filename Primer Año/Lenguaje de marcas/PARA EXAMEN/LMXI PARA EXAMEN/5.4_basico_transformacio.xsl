<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html</xsl:text>
    <html lang="es" dir="ltr">
      <head>
        <meta charset="UTF-8"/>
        <style>
          table {
          border-collapse: collapse;
          width: 40%;
          }
          caption {
          text-align: center;
          font-size: 1.5em;
          margin: 10px;
          }
          th, td {
          text-align: left;
          padding: 8px;
          }
          tr:nth-child(even) {
          background-color: #8d8d8d;
          }                           
          tr:nth-child(odd) {
          background-color: #d7d4d4;
          }
          th {
          background-color: #4CAF50;
          color: white;
          }
        </style>
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
            <th>Year</th>
            <th>Price</th>
          </tr>
          <tr>
            <xsl:apply-templates select="catalog/cd[year>1990]">
              <xsl:sort order="ascending" select="year"/>
            </xsl:apply-templates>
            <xsl:for-each select="catalog/cd">
              <xsl:variable name="num_artistas">
                <td>
                  <xsl:value-of select="count(//cd[year &gt; 1990 and price &gt; 10.00])"/>
                </td>
              </xsl:variable>
              <xsl:if test="year &gt; 1990">
                <xsl:variable name="precio_cd" select="9.00"/>
                <xsl:variable name="anno_cd" select="1995"/>
                <xsl:variable name="suma_precios" select="sum(price)"/>
                <xsl:choose>
                  <xsl:when test="price > $precio_cd and year &gt; $anno_cd">
                    <xsl:apply-templates select="price">
                    </xsl:apply-templates>
                  </xsl:when>
                  <xsl:otherwise>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
              <tr>
                <xsl:apply-templates select="catalog/cd[year>1990]">
                  <xsl:sort order="descending" select="year"/>
                </xsl:apply-templates>
              </tr>
            </xsl:for-each>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="cd">
    <tr>
      <td><xsl:value-of select="title"/></td>
      <td><xsl:value-of select="artist"/></td>
      <td><xsl:value-of select="year"/></td>
      <td><xsl:value-of select="price"/></td>
    </tr>
  </xsl:template>
  <xsl:template match="price">
    <tr>
      <td colspan = "1" bgcolor="#ff00ff"><xsl:value-of select="../title"/></td>
      <td colspan = "1" bgcolor="#ff00ff"><xsl:value-of select="../artist"/></td>
      <td><xsl:value-of select="../year"/></td>
      <td><xsl:value-of select="."/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>