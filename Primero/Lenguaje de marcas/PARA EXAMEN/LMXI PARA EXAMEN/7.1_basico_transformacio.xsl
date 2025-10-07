<?xml version ="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" /> 
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Tabla de artistas</title>
      </head>
      <body>
        <table border="0">
          <tr bgcolor="#9acd32">
            <th>Código</th>
            <th>Nombre</th>
            <th>Año de nacimiento</th>
            <th>Año de fallecimiento</th> 
            <th>País</th>
            <th>Página web</th>
          </tr>
          <xsl:for-each select="artistas/artista">
            <xsl:sort select="nacimiento" order ="ascending" />
            <xsl:if test="nacimiento &gt; 1000" >
              <tr>
                <td>
                  <xsl:value-of select="@cod"/>
                </td>
                <td>
                  <xsl:value-of select="nombreCompleto"/>
                </td>
                <td>
                  <xsl:value-of select="nacimiento"/>
                </td>
                <td>
                  <xsl:choose>
                    <xsl:when test="fallecimiento" >                                        <!--Introducir el año de fallecimiento del artista -->
                      <xsl:value-of select="fallecimiento"/>
                    </xsl:when>
                    <xsl:otherwise>Desconocido</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td>
                  <xsl:value-of select="pais"/>
                </td>
                <td>
                  <a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="fichaCompleta"/>
                    </xsl:attribute>
                    ..para saber más
                  </a>
                </td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

