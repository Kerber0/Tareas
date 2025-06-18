<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output encoding="UTF-8" method="html"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Lista das máquinas</title>
      </head>
      <body>
        <h1>Máquinas</h1>
        <xsl:apply-templates select="/equipos/máquina" mode="enlaces"/>
        <xsl:apply-templates select="equipos/máquina" mode="detalle"/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="/equipos/máquina" mode="enlaces">
    <a href="#{@nome}">
      <xsl:value-of select="@nome"/>
    </a>
    <br/>
  </xsl:template>
  <xsl:template match="equipos/máquina" mode="detalle">
    <a name="{@nome}">
      <h2>
        <xsl:value-of select="@nome"/>
      </h2>
    </a>
    <ul>
      <xsl:apply-templates select="hardware/*"/>
    </ul>
  </xsl:template>
  <xsl:template match="memoria">
    <li>Memoria: <xsl:value-of select="text()"/>GB</li>
  </xsl:template>
  <xsl:template match="disco">
    <li>Disco: <xsl:value-of select="@capacidade"/>GB</li>
  </xsl:template>
  <xsl:template match="lectora|gravadora">
    <li><xsl:value-of select="name()"/> de <xsl:value-of select="@tipo"/></li>
  </xsl:template>
  <xsl:template match="*">
    <li>
      <xsl:value-of select="text()"/>
    </li>
  </xsl:template>
</xsl:stylesheet>
