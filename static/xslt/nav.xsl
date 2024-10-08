<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" />
	<xsl:template match="导航">
		<html lang="zh-cn">
			<head>
				<meta charset="UTF-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
				<title>导航</title>
				<link rel="stylesheet" type="text/css" href="static/css/style.css" />
				<link href="/favicon.ico" rel="icon"/>
				<base target="_blank"/>
			</head>

			<body>
				<div class="container">	
				<xsl:apply-templates select="组" />
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="组">
		<div class="category">
		<div class="category-title"><xsl:value-of select = "@组名"/></div>
		<div class="links">
			<xsl:apply-templates select="网址" />
		</div>
		</div>
	</xsl:template>

	<xsl:template match="网址">
		<div>
		<xsl:attribute name="class">
            <xsl:text>link</xsl:text>
            <xsl:if test="名称/@hot = 'true'">
                <xsl:text> hot</xsl:text>
            </xsl:if>
        </xsl:attribute>

		<a>
			<xsl:attribute name="href"><xsl:value-of select="地址"/></xsl:attribute>
			
			<xsl:if test="boolean(名称/@favicon)">
				<img class="favicon" src="{名称/@favicon}"/>
			</xsl:if>
			
			<xsl:value-of select = "名称"/>
		</a>
		</div>
	</xsl:template>
</xsl:stylesheet>