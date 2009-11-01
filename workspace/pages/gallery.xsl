<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="data">
	<h3><a href="{$root}/{$root-page}/" title="{$page-title}"><xsl:value-of select="$page-title" /></a></h3>
	<xsl:choose>
		<xsl:when test="simpleviewer-gallery-details/entry/@id = $simpleviewer-gallery-id">
			<xsl:apply-templates select="simpleviewer-gallery-details/entry" />
		</xsl:when>
		<xsl:when test="$simpleviewer-gallery-id = '' and count(simpleviewer-galleries/entry) = 1">
			<xsl:apply-templates select="simpleviewer-gallery-details/entry">
				<xsl:with-param name="gallery-id" select="$ds-simpleviewer-galleries" />
			</xsl:apply-templates>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="simpleviewer-galleries" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="simpleviewer-galleries">
	<h2>Pick one of the following:</h2>
	<ul>
		<xsl:apply-templates select="entry" />
	</ul>
</xsl:template>

<xsl:template match="simpleviewer-galleries/entry">
	<li>
		<a href="{$root}/{$root-page}/{@id}/" title=""><xsl:value-of select="title" /></a>
	</li>
</xsl:template>

<xsl:template match="simpleviewer-gallery-details/entry">
	<xsl:param name="gallery-id">
		<xsl:choose>
			<xsl:when test="$simpleviewer-gallery-id != ''"><xsl:value-of select="$simpleviewer-gallery-id" /></xsl:when>
			<xsl:when test="$gallery-id != ''"><xsl:value-of select="$gallery-id" /></xsl:when>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="width">
		<xsl:choose>
			<xsl:when test="flash-object-width != ''"><xsl:value-of select="flash-object-width" /></xsl:when>
			<xsl:otherwise>100%</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="height">
		<xsl:choose>
			<xsl:when test="flash-object-height != ''"><xsl:value-of select="flash-object-height" /></xsl:when>
			<xsl:otherwise>80%</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="langOpenImage">
		<xsl:choose>
			<xsl:when test="langopenimage != ''"><xsl:value-of select="langopenimage" /></xsl:when>
			<xsl:otherwise>Open Image in New Window</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="langAbout">
		<xsl:choose>
			<xsl:when test="langabout != ''"><xsl:value-of select="langabout" /></xsl:when>
			<xsl:otherwise>About</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="preloaderColor" select="concat('0x', substring-after(preloadercolor, '#'))" />
	<h2><xsl:value-of select="title" /></h2>
	<div id="flashcontent">SimpleViewer requires JavaScript and the Flash Player. <a href="http://www.macromedia.com/go/getflashplayer/">Get Flash.</a></div>
	<script type="text/javascript">
		<xsl:comment>
		var fo = new SWFObject("<xsl:value-of select="$workspace" />/simpleviewer/viewer.swf", "viewer", "<xsl:value-of select="$width" />", "<xsl:value-of select="$height" />", "8", "<xsl:value-of select="background-color" />");
		
		fo.addVariable("xmlDataPath", "<xsl:value-of select="$root" />/<xsl:value-of select="$root-page" />/xml/<xsl:value-of select="$gallery-id" />/");
		fo.addVariable("firstImageIndex", "<xsl:value-of select="firstimageindex" />");	
		fo.addVariable("langOpenImage", "<xsl:value-of select="$langOpenImage" />");
		fo.addVariable("langAbout", "<xsl:value-of select="$langAbout" />");	
		fo.addVariable("preloaderColor", "<xsl:value-of select="$preloaderColor" />");
		
		fo.write("flashcontent");
		</xsl:comment>
	</script>
</xsl:template>

</xsl:stylesheet>