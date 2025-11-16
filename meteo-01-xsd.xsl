<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Meteo</title>
            </head>
            <body>
                <h1>Data Representation Pour Meteo:</h1>
                <!--filtrer la 1er et 3eme mesure -->
                <xsl:for-each select="meteo/mesure[@date=('2025-06-25','2006-01-01')]">
                    <ul>
                       <li>Date mesure : <xsl:value-of select="@date"/></li>
                   </ul> 
                    
                   <table border="1" width="90%">
                      <tr>
                          <th>Nom ville :</th>
                          <th>Temperature°C :</th>
                      </tr> 
                       <xsl:for-each select="ville">
                           <tr>
                               <td><xsl:value-of select="@nom"/></td>
                               <td><xsl:value-of select="@temperature"/></td>
                           </tr>
                       </xsl:for-each>
                       <tr>
                           <td>Nombre de villes :</td>
                           <td><xsl:value-of select="count(ville)"/></td>
                       </tr>
                       <tr>
                           <td>Temperature Moyenne:</td>
                           <td><xsl:value-of select="avg(ville/@temperature)"/></td>
                       </tr>
                       
                       <tr> <!-- filtrer les villes selon la temp -->
                           <td>Nombre de villes qui ont temp superieur a 30°C</td>
                           <td><xsl:value-of select="count(ville[@temperature >= 25])"/></td>
                       </tr>
                       
                   </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>