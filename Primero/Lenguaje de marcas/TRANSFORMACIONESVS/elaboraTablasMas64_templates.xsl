<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"

  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">

    <html>

      <head>

        <title>Personas mayores de 64</title>

      </head>

      <body>
        <h2>Personas mayores de 64 años</h2>

        <table border="1">

          <tr>

            <th>Código</th>

            <th>Nombre</th>
            <th>Edad</th>

          </tr>

          <xsl:apply-templates select="personas/persona"/>

        </table>

      </body>

    </html>

  </xsl:template>
  <xsl:template match="persona[edad &gt; 64]">
    

    <tr>

      <td><xsl:value-of select="@codPER"/></td>
      <td><xsl:value-of select="nombre"/></td>
      <td><xsl:value-of select= "edad"/></td>
    </tr>

  </xsl:template>




  <xsl:template match="persona[not(edad &gt; 64)]"/>



</xsl:stylesheet>