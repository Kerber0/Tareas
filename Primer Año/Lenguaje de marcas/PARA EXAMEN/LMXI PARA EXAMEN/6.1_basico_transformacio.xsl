<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:Bolsa="http://www.labolsa.com" version="1.0">
  <xsl:template match="Bolsa:Bolsa">
    <html>
      <head>
        <title>La bolsa: dia <xsl:value-of select="@dia"/> a las
          <xsl:value-of select="@hora"/></title>
      </head>
      <body>
        <table border="2" align="center">
          <tr>
            <th>Simbolo</th>
            <th>Nombre</th>
            <th>Precio</th>
          </tr>
          <xsl:for-each select="Bolsa:Empresa">
            <xsl:sort select="Bolsa:Precio" order="descending"/>
            <tr>
              <td>
                <xsl:value-of select="Bolsa:Simbolo"/>
              </td>
              <td>
                <xsl:value-of select="Bolsa:Nombre"/>
                <xsl:if test="@indice='general'"> (*)</xsl:if>
              </td>
              <td>
                <xsl:choose>
                  <xsl:when test="Bolsa:Precio &gt; 75">
                    <font color="blue"><xsl:value-of select="Bolsa:Precio"/></font>
                  </xsl:when>
                  <xsl:when test="Bolsa:Precio &lt; 25">
                    <font color="red"><xsl:value-of select="Bolsa:Precio"/></font>
                  </xsl:when>  
                  <xsl:otherwise>
                    <xsl:value-of select="Bolsa:Precio"/>
                  </xsl:otherwise>                
                </xsl:choose>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        <p align="center">(*) Estas empresas son del indice general</p>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
