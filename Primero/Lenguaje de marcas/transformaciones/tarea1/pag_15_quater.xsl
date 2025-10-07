<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" />
<xsl:template match="/módulo/profesor">
<Profesor />
</xsl:template>
<xsl:template match="/módulo">
<Módulo />
</xsl:template>
<xsl:template match="/">
    <xsl:text>Soy el nodo raíz</xsl:text>
    <xsl:apply-templates/>
</xsl:template>
</xsl:stylesheet>