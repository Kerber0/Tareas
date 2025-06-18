<?xml version ="1.0" encoding="UTF-8"?>
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" /> 
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Tabla de personas</title>
            </head>
            <body>
                <h1>Personas mayores de 65</h1>
                <table border="1">
                    
                    <tr bgcolor="#9acd32">
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Edad</th>
                    </tr>
                    
                    <xsl:for-each select="//persona">
                        <xsl:sort select="edad" data-type="number" order ="ascending" />
                        <xsl:if test="@sex = 'V'">
                            <xsl:if test="edad &gt; 064" >
                                <tr>
                                    <td>
                                        <xsl:value-of select="@codPER"/>
                                    </td>
                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="peso &gt; 75">
                                                <font color="blue"><xsl:value-of select="nombre"/></font>
                                            </xsl:when>
                                            <xsl:when test="peso &lt; 60">
                                                <font color="red"><xsl:value-of select="nombre"/></font>
                                            </xsl:when>  
                                            <xsl:otherwise>
                                                <xsl:value-of select="peso"/>
                                            </xsl:otherwise>                
                                        </xsl:choose>
                                    </td>
                                    <td>
                                        <xsl:value-of select="edad"/>
                                    </td>
                                </tr>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>