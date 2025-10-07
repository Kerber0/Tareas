<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:key name="os-group" match="máquina" use="config/OS"/>

<xsl:template match="/">
  <html>
  <body>
    <h2>Máquinas por Sistema Operativo</h2>
    <xsl:for-each select="equipos/máquina[generate-id() = generate-id(key('os-group', config/OS)[1])]">
      <xsl:sort select="config/OS"/>
      <h3><xsl:value-of select="config/OS"/></h3>
      <ul>
        <xsl:for-each select="key('os-group', config/OS)">
          <li><xsl:value-of select="@nome"/> (<xsl:value-of select="hardware/tipo"/>)</li>
        </xsl:for-each>
      </ul>
    </xsl:for-each>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>