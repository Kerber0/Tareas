<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl : output method = "xml" indent = "yes"/>

  <xsl:template match="/">
  <estadisticas><universidad>

<xsl : template match = "/">
<estadisticas>
<universidad 
numTitulos = "{count(//carreras)"

numCreditos = "{sum (//carrera/creditos)}"

numAlumnos =  "{count (//alumno)}"


numeroAsignaturas =  "{count (//alumno)}"/>


<observacionesEstadistica>

<alumnos>

<xsl: apply-templates select = "//alumno"/>

</alumnos>
</observacionesEstadistica>
</estadisticas>
</xsl : template>

<xsl : template match = "alumno">
<alumno>
  <xsl : atribute name = "codigo">

<xsl : value-of select = "@id"/>

</xsl : attribute>

</alumno>
</xsl : template>
  </xsl:template>
</xsl:stylesheet>
