<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" encoding="UTF-8" indent="yes" />

<xsl:template match="data">
	<xsl:apply-templates select="simpleviewer-gallery-details" />
</xsl:template>

<xsl:template match="simpleviewer-gallery-details">
	<xsl:apply-templates select="entry" />
</xsl:template>

<xsl:template match="simpleviewer-gallery-details/entry">
	<xsl:param name="frameColor" select="concat('0x', substring-after(framecolor, '#'))" />
	<xsl:param name="textColor" select="concat('0x', substring-after(textcolor, '#'))" />
	<simpleviewergallery maxImageWidth="{maximagewidth }" maxImageHeight="{maximageheight}" textColor="{$textColor}" frameColor="{$frameColor}" frameWidth="{framewidth}" stagePadding="{stagepadding}" navPadding="{navpadding}" thumbnailColumns="{thumbnailcolumns}" thumbnailRows="{thumbnailrows}" navPosition="{navposition/item}" vAlign="{valign/item}" hAlign="{halign/item}" title="{title}" enableRightClickOpen="{enablerightclickopen/item}" backgroundImagePath="{$workspace}{background-image/@path}/{background-image/filename}" imagePath="{$workspace}{/data/simpleviewer-images/entry/image-file/@path}/" thumbPath="{$root}/image/2/90/90/5{/data/simpleviewer-images/entry/image-file/@path}/">
		<xsl:apply-templates select="/data/simpleviewer-images" />
	</simpleviewergallery>
</xsl:template>

<xsl:template match="simpleviewer-images">
	<xsl:apply-templates select="entry" />
</xsl:template>

<xsl:template match="simpleviewer-images/entry">
		<image>
			<filename><xsl:value-of select="image-file/filename" /></filename>
			<caption><xsl:value-of select="title" /></caption>
		</image>
</xsl:template>

</xsl:stylesheet>