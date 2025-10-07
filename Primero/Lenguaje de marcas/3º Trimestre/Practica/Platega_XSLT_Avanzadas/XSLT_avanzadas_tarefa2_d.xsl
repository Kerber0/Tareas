<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" method="html"/>
<xsl:variable name="cor_windows">yellow</xsl:variable>
<xsl:variable name="encabezado_taboa">
<tr>
<th>Máquina</th>
<th>Tipo</th>
<th>OS</th>
<th>Capacidade HD</th>
</tr>
</xsl:variable>
<xsl:template match="/">
<html>
<head>
<title>Táboa de ordenadores con OS</title>
</head>
<body>
<h1>Táboa de ordenadores con OS</h1>
<table border="1">
<xsl:copy-of select="$encabezado_taboa" />
<xsl:for-each select="equipos/máquina[config/OS]" >
<xsl:sort select="sum(hardware/disco/@capacidade)" order="descending" data-type="number" />
<xsl:variable name="capacidade" se-lect="sum(hardware/disco/@capacidade)" />
<tr>
<xsl:if test="starts-with(config/OS, 'Windows')">
<xsl:attribute name="style">background:<xsl:value-of se-lect="$cor_windows" /></xsl:attribute>
</xsl:if>
<td><xsl:value-of select="@nome" /></td>
<td><xsl:value-of select="hardware/tipo" /></td>
<td><xsl:value-of select="config/OS" /></td>
<td>
<xsl:variable name="cor_capacidade">
<xsl:choose>
<xsl:when test="$capacidade &gt;= 1000">red</xsl:when>
<xsl:when test="$capacidade &gt;= 500">#FF4500</xsl:when>
<xsl:otherwise>orange</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:attribute name="style">color:<xsl:value-of se-lect="$cor_capacidade" /></xsl:attribute>
<xsl:value-of select="$capacidade" /> GB
</td>
</tr>
</xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>