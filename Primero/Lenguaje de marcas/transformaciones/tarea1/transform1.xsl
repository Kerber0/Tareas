<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text"></xsl:output>
    <xsl:template match="produto">
    <xsl:value-of select="@cod"></xsl:value-of>
    </xsl:template>
</xsl:stylesheet>