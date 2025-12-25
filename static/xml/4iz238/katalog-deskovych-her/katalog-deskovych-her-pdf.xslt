<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:k="https://jankominek.com/xml/4iz238/katalog-deskovych-her">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:decimal-format name="cz_format" grouping-separator=" "/>

    <xsl:template match="/">
        <fo:root font-family="Arial, 'Segoe UI Emoji', Helvetica, sans-serif" language="cs">
            <fo:layout-master-set>
                <fo:simple-page-master
                        master-name="A4"
                        page-height="29.7cm"
                        page-width="21cm"
                        margin-top="2cm"
                        margin-bottom="2cm"
                        margin-left="1.5cm"
                        margin-right="1.5cm"
                >
                    <fo:region-body margin-top="2cm" margin-bottom="2cm"/>
                    <fo:region-before extent="1.5cm"/>
                    <fo:region-after extent="1.5cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="A4">

                <fo:static-content flow-name="xsl-region-before">
                    <fo:block
                            text-align="right"
                            font-size="9pt"
                            color="gray"
                            border-bottom="1pt solid gray"
                            padding-bottom="2pt"
                    >
                        Katalog deskových her - Semestrální práce 4IZ238
                    </fo:block>
                </fo:static-content>

                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center" font-size="9pt" border-top="1pt solid gray" padding-top="2pt">
                        Strana <fo:page-number/>
                    </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="24pt" font-weight="bold" text-align="center" space-after="20pt" color="#4F46E5">
                        Inventární seznam her
                    </fo:block>

                    <fo:block font-size="10pt" space-after="20pt" text-align="justify">
                        Tento dokument obsahuje přehled všech deskových her ve sbírce. Kliknutím na název hry přejdete na detailní kartu hry níže.
                    </fo:block>

                    <fo:table table-layout="fixed" width="100%" border-collapse="collapse" font-size="10pt">
                        <fo:table-column column-width="10%"/>
                        <fo:table-column column-width="35%"/>
                        <fo:table-column column-width="20%"/>
                        <fo:table-column column-width="15%"/>
                        <fo:table-column column-width="12%"/>
                        <fo:table-column column-width="8%"/>

                        <fo:table-header>
                            <fo:table-row background-color="#4F46E5" color="white" font-weight="bold">
                                <fo:table-cell padding="5pt" border="1pt solid black">
                                    <fo:block>
                                        📸
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="5pt" border="1pt solid black">
                                    <fo:block>
                                        Název hry
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="5pt" border="1pt solid black">
                                    <fo:block>
                                        Autor
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="5pt" border="1pt solid black">
                                    <fo:block>
                                        Info
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="5pt" border="1pt solid black">
                                    <fo:block>
                                        Cena
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell padding="5pt" border="1pt solid black">
                                    <fo:block>
                                        ⭐⭐
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>

                        <fo:table-body>
                            <xsl:apply-templates select="/k:katalog/k:hra" mode="table-row">
                                <xsl:sort select="k:nazvy/k:nazev"/>
                            </xsl:apply-templates>
                        </fo:table-body>
                    </fo:table>

                    <fo:block margin-top="10pt" font-size="9pt" font-style="italic" text-align="right">
                        Celkem her v katalogu: <xsl:value-of select="count(/k:katalog/k:hra)"/>
                    </fo:block>

                    <fo:block
                            break-before="page"
                            font-size="18pt"
                            font-weight="bold"
                            space-after="20pt"
                            color="#4F46E5"
                            id="details-section"
                    >
                        Detailní karty her
                    </fo:block>

                    <xsl:apply-templates select="/k:katalog/k:hra" mode="detail-card">
                        <xsl:sort select="k:nazvy/k:nazev"/>
                    </xsl:apply-templates>

                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="k:hra" mode="table-row">
        <fo:table-row border-bottom="1pt solid #ccc">
            <xsl:if test="position() mod 2 = 0">
                <xsl:attribute name="background-color">
                    #F3F4F6
                </xsl:attribute>
            </xsl:if>

            <fo:table-cell padding="3pt" border="1pt solid #ccc" display-align="center">
                <fo:block text-align="center">
                    <fo:external-graphic
                            src="{k:obrazky/k:obrazek[@hlavni='ano']}"
                            content-width="scale-to-fit"
                            content-height="100%"
                            width="1.2cm"
                            scaling="uniform"
                    />
                </fo:block>
            </fo:table-cell>

            <fo:table-cell padding="5pt" border="1pt solid #ccc">
                <fo:block font-weight="bold" color="#2563EB">
                    <fo:basic-link internal-destination="{concat('game-', @id)}">
                        <xsl:value-of select="k:nazvy/k:nazev"/>
                    </fo:basic-link>
                </fo:block>

                <fo:block font-size="8pt" color="gray" font-style="italic">
                    <xsl:value-of select="k:nazvy/k:nazev_original"/>
                </fo:block>
            </fo:table-cell>

            <fo:table-cell padding="5pt" border="1pt solid #ccc">
                <fo:block font-size="9pt">
                    <xsl:value-of select="k:autori/k:autor[1]"/>
                    <xsl:if test="count(k:autori/k:autor) > 1">, ...</xsl:if>
                </fo:block>
            </fo:table-cell>

            <fo:table-cell padding="5pt" border="1pt solid #ccc" font-size="8pt">
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="k:hraci/k:min != k:hraci/k:max">
                            👥 <xsl:value-of select="k:hraci/k:min"/>-<xsl:value-of select="k:hraci/k:max"/>
                        </xsl:when>

                        <xsl:otherwise>
                            👥 <xsl:value-of select="k:hraci/k:min"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
                <fo:block>
                    ⏱ <xsl:value-of select="k:herni_doba/k:min"/>-<xsl:value-of select="k:herni_doba/k:max"/>
                    <xsl:value-of select="k:herni_doba/@jednotka"/>
                </fo:block>
            </fo:table-cell>

            <fo:table-cell padding="5pt" border="1pt solid #ccc" text-align="right">
                <fo:block>
                    <xsl:value-of select="format-number(k:cena, '# ###', 'cz_format')"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="k:cena/@mena"/>
                </fo:block>
            </fo:table-cell>

            <fo:table-cell padding="5pt" border="1pt solid #ccc" text-align="center" font-weight="bold">
                <fo:block>
                    <xsl:value-of select="k:hodnoceni/k:body[@zdroj = 'Vlastní']"/>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="k:hra" mode="detail-card">
        <fo:block
                id="{concat('game-', @id)}"
                border="1pt solid #ccc"
                background-color="#F9FAFB"
                padding="10pt"
                margin-bottom="15pt"
                keep-together.within-page="always"
        >
            <fo:table width="100%" table-layout="fixed">
                <fo:table-column column-width="30%"/>
                <fo:table-column column-width="70%"/>

                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell padding-right="10pt">
                            <fo:block>
                                <fo:external-graphic src="{k:obrazky/k:obrazek[@hlavni='ano']}" content-width="scale-to-fit" width="4cm"/>
                            </fo:block>
                        </fo:table-cell>

                        <fo:table-cell>
                            <fo:block font-size="14pt" font-weight="bold" color="#111827">
                                <xsl:value-of select="k:nazvy/k:nazev"/>
                            </fo:block>

                            <fo:block font-size="10pt" color="gray" margin-bottom="5pt">
                                (<xsl:value-of select="k:nazvy/k:nazev_original"/>)
                            </fo:block>

                            <fo:block font-size="10pt" margin-bottom="5pt">
                                <fo:inline>Autoři: </fo:inline>
                                <xsl:for-each select="k:autori/k:autor">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </fo:block>

                            <fo:block font-size="12pt" font-weight="bold" color="#4F46E5" margin-bottom="8pt">
                                <xsl:value-of select="format-number(k:cena, '# ###', 'cz_format')"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="k:cena/@mena"/>
                                <xsl:text> </xsl:text>
                                <xsl:for-each select="k:hodnoceni/k:body">
                                    <xsl:sort select="@zdroj = 'Vlastní'" data-type="number" order="descending"/>
                                    <fo:inline margin-left="10pt" font-size="10pt" font-weight="normal" color="black">
                                        <xsl:if test="position() = 1">(Hodnocení: </xsl:if>
                                        <xsl:if test="position() > 1">, </xsl:if>
                                        <xsl:if test="@zdroj != 'Vlastní'"><xsl:value-of select="@zdroj"/>: </xsl:if>
                                        <xsl:value-of select="."/>/10
                                        <xsl:if test="position() = last()">)</xsl:if>
                                    </fo:inline>
                                </xsl:for-each>
                            </fo:block>

                            <fo:block font-size="10pt" text-align="justify">
                                <xsl:value-of select="k:popis"/>
                            </fo:block>

                            <fo:block font-size="9pt" margin-top="8pt">
                                <fo:inline font-weight="bold">Doporučený věk: </fo:inline>

                                <xsl:value-of select="k:doporuceny_vek"/>+
                            </fo:block>

                            <fo:block font-size="9pt" margin-top="3pt">
                                <fo:inline font-weight="bold">Počet hráčů: </fo:inline>

                                <xsl:choose>
                                    <xsl:when test="k:hraci/k:min != k:hraci/k:max">
                                        <xsl:value-of select="k:hraci/k:min"/>-<xsl:value-of select="k:hraci/k:max"/>
                                    </xsl:when>

                                    <xsl:otherwise>
                                        <xsl:value-of select="k:hraci/k:min"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </fo:block>

                            <fo:block font-size="9pt" margin-top="3pt">
                                <fo:inline font-weight="bold">Doba hraní: </fo:inline>

                                <xsl:value-of select="k:herni_doba/k:min"/>-<xsl:value-of select="k:herni_doba/k:max"/>
                                <xsl:value-of select="k:herni_doba/@jednotka"/>
                            </fo:block>

                            <fo:block font-size="9pt" margin-top="3pt">
                                <fo:inline font-weight="bold">Kategorie: </fo:inline>

                                <xsl:for-each select="k:kategorie_seznam/k:kategorie">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </fo:block>

                            <fo:block font-size="9pt" margin-top="3pt">
                                <fo:inline font-weight="bold">Mechaniky: </fo:inline>

                                <xsl:for-each select="k:mechaniky_seznam/k:mechanika">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </fo:block>

                            <fo:block font-size="9pt" margin-top="3pt">
                                <fo:inline font-weight="bold">Komponenty: </fo:inline>

                                <xsl:for-each select="k:komponenty_seznam/k:komponent">
                                    <xsl:value-of select="@pocet"/>
                                    <xsl:text>x </xsl:text>
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

</xsl:stylesheet>
