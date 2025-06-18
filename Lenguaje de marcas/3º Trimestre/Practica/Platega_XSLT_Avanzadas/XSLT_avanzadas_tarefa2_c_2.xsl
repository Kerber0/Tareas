<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" method="html"/>
<xsl:template match="/">
<html>
<head>
<title>Táboa de ordenadores con OS</title>
</head>
<body>
<h1>Táboa de ordenadores con OS</h1>
<table border="1">
<tr>
<th>Máquina</th>
<th>Tipo</th>
<th>OS</th>
<th>Capacidade HD</th>
</tr>
<xsl:apply-templates select="equipos/máquina[config/OS]">
<xsl:sort select="sum(hardware/disco/@capacidade)" order="descending" data-type="number" />
</xsl:apply-templates>
</table>
</body>
</html>
</xsl:template>
<xsl:template match="máquina">
<xsl:element name="tr">
<xsl:if test="starts-with(config/OS, 'Windows')">
<xsl:attribute name="style">background:yellow</xsl:attribute>
</xsl:if>
<td><xsl:value-of select="@nome" /></td>
<td><xsl:value-of select="hardware/tipo" /></td>
<td><xsl:value-of select="config/OS" /></td>
<td>
<xsl:choose>
<xsl:when test="sum(hardware/disco/@capacidade) &gt;= 1000">
<xsl:attribute name="style">color:red</xsl:attribute>
</xsl:when>
<xsl:when test="sum(hardware/disco/@capacidade) &gt;= 500">
<xsl:attribute name="style">color:#FF4500</xsl:attribute>
</xsl:when>
<xsl:otherwise>
<xsl:attribute name="style">color:orange</xsl:attribute>
</xsl:otherwise>
</xsl:choose>
<xsl:value-of select="sum(hardware/disco/@capacidade)" /> GB
</td>
</xsl:element>
</xsl:template>
</xsl:stylesheet>