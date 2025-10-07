<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h2>Valor Total Inventario de CDs con precio > 10 </h2>
        <table border="1">
          <tr bgcolor="#9acd32">
            <th>Title</th>
            <th>Artist</th>
            <th>Price</th>
          </tr>
          <xsl:variable name="coste" select ="10.00"/>
          <xsl:variable name="Acumulado_mayor10">
            <xsl:value-of select="sum(catalog/cd[price &gt; 10.00]/price)"/>
          </xsl:variable>
          <xsl:if test="//cd[price &gt; 10.00]">
            <tr>
              <th colspan="2" align = "center" >Acumulado</th>
              <td>
                <xsl:value-of select="format-number($Acumulado_mayor10,'#.00')"/>
              </td>
            </tr>
          </xsl:if>
          <xsl:for-each select="catalog/cd">
            <xsl:variable name="suma_precios" select="sum(price)"/>
            <xsl:variable name="suma_precios_menor_10" select="sum(//cd[prize &gt; 10])"/>
            <tr>
              <td><xsl:value-of select="title"/></td>
              <xsl:choose>
                <xsl:when test="price > 10">
                  <td bgcolor="#ff00ff">
                    <xsl:value-of select="artist"/>
                  </td>
                  <td bgcolor="#ff00ff">
                    <xsl:value-of select="sum(preceding-sibling::cd[price &gt; 10.00]/price) + price" />
                  </td>
                  <xsl:if test="price &gt; $coste ">
                    <tr>
                      <xsl:variable name="suma_precios_mayor10" select="sum(preceding-sibling::cd[price &gt; $coste]/price)"/>
                      <td> 
                        <xsl:text>Valor Actual y Acumulado:</xsl:text>
                      </td>
                      <td> 
                        <xsl:value-of select = "price"/> 
                        <xsl:text> - </xsl:text> 
                        <xsl:value-of select = "$suma_precios_mayor10"/> 
                      </td>
                      <td text-align="left"> 
                        <xsl:value-of select="format-number(($suma_precios_mayor10 + price),'#.00')"/>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                  <td><xsl:value-of select="artist"/></td>
                  <td><xsl:text> 0 </xsl:text></td>
                </xsl:otherwise>
              </xsl:choose>
            </tr>
          </xsl:for-each>
          <tr>
            <td colspan="2" class="total">TOTAL valor CDs</td>
            <td>
              <xsl:value-of select="format-number(sum(catalog/cd/price),'#.00')"/>
            </td>
          </tr>
          <tr>
            <th colspan="2" align = "right">Total de precios mayores a 10.00</th>
            <td >
              <xsl:value-of select="$Acumulado_mayor10"/>
            </td>   
            
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>