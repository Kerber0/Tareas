<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:template match="/">
  <html>
  <head>
    <title>Informe de Equipos por Antigüedad</title>
    <style>
      .antiguo { background-color: #ffdddd; }
      .moderno { background-color: #ddffdd; }
      .servidor { font-weight: bold; }
    </style>
  </head>
  <body>
    <h1>Equipos Clasificados por Antigüedad</h1>
    
    <h2>Equipos Antiguos (Windows XP o anterior)</h2>
    <table border="1">
      <tr><th>ID</th><th>Nombre</th><th>Sistema</th><th>Memoria</th></tr>
      <xsl:for-each select="equipos/máquina[contains(config/OS, 'XP') or contains(config/OS, '2000')]">
        <xsl:sort select="hardware/memoria" data-type="number" order="ascending"/>
        <tr class="antiguo">
          <td><xsl:value-of select="generate-id()"/></td>
          <td><xsl:value-of select="@nome"/></td>
          <td><xsl:value-of select="config/OS"/></td>
          <td><xsl:value-of select="hardware/memoria"/> GB</td>
        </tr>
      </xsl:for-each>
    </table>
    
    <h2>Equipos Modernos</h2>
    <table border="1">
      <tr><th>ID</th><th>Nombre</th><th>Sistema</th><th>Memoria</th></tr>
      <xsl:for-each select="equipos/máquina[not(contains(config/OS, 'XP') or contains(config/OS, '2000'))]">
        <xsl:sort select="hardware/memoria" data-type="number" order="descending"/>
        <tr class="{if(config/role) then 'servidor' else 'moderno'}">
          <td><xsl:value-of select="generate-id()"/></td>
          <td><xsl:value-of select="@nome"/></td>
          <td><xsl:value-of select="config/OS"/></td>
          <td><xsl:value-of select="hardware/memoria"/> GB</td>
        </tr>
      </xsl:for-each>
    </table>
    
    <h2>Estadísticas</h2>
    <p>Total equipos: <xsl:value-of select="count(equipos/máquina)"/></p>
    <p>Equipos con menos de 1GB RAM: 
      <xsl:value-of select="count(equipos/máquina[hardware/memoria &lt; 1])"/>
    </p>
    <p>Servidores: 
      <xsl:value-of select="count(equipos/máquina[config/role])"/>
    </p>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>