<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:k="https://jankominek.com/xml/4iz238/katalog-deskovych-her"
    xmlns:f="http://jankominek.com/xml/4iz238/funkce"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="k xs f">
    
    <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>

    <xsl:param name="pageTitle" select="'Katalog deskových her'"/>

    <xsl:decimal-format name="cz_format" grouping-separator=" "/>

    <xsl:function name="f:format-ceny">
        <xsl:param name="castka"/>
        <xsl:param name="mena"/>
        
        <xsl:value-of select="format-number($castka, '# ###', 'cz_format')"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="$mena"/>
    </xsl:function>

    <xsl:template match="/">
        <xsl:apply-templates select="." mode="generate-index"/>
        <xsl:apply-templates select="//k:hra" mode="detail-page"/>
    </xsl:template>

    <xsl:template match="/" mode="generate-index">
        <html lang="cs">
            <xsl:apply-templates select="." mode="html-head">
                <xsl:with-param name="title" select="$pageTitle"/>
            </xsl:apply-templates>

            <body class="bg-gray-100 font-sans text-gray-800 flex flex-col min-h-screen">
                <xsl:apply-templates select="." mode="main-menu"/>

                <main class="container mx-auto px-4 py-8 flex-grow">
                    <h1 class="text-4xl font-bold text-center text-indigo-700 mb-8">
                        <xsl:value-of select="$pageTitle"/>
                    </h1>

                    <xsl:for-each-group select="//k:hra" group-by="k:obtiznost">
                        <xsl:sort select="current-grouping-key()"/>
                        
                        <section class="mb-12">
                            <h2 class="text-2xl font-semibold text-gray-700 border-b-2 border-indigo-500 mb-6 pb-2">
                                Obtížnost: <xsl:value-of select="current-grouping-key()"/>
                            </h2>

                            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                                <xsl:apply-templates select="current-group()" mode="card">
                                    <xsl:sort select="k:nazvy/k:nazev"/>
                                </xsl:apply-templates>
                            </div>
                        </section>
                    </xsl:for-each-group>
                </main>

                <xsl:apply-templates select="." mode="footer"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="k:hra" mode="detail-page">
        <xsl:variable name="filename" select="concat('hra_', @id, '.html')"/>

        <xsl:result-document href="{$filename}">
            <html lang="cs">
                <xsl:apply-templates select="." mode="html-head">
                    <xsl:with-param name="title" select="k:nazvy/k:nazev"/>
                </xsl:apply-templates>

                <body class="bg-gray-50 font-sans text-gray-800 flex flex-col min-h-screen">
                    <xsl:apply-templates select="." mode="main-menu"/>

                    <main class="container mx-auto px-4 py-8 flex-grow">
                        <nav class="text-sm text-gray-500 mb-6">
                            <a href="index.html" class="hover:underline text-indigo-600">
                                Katalog
                            </a>
                            <span class="mx-2">/</span>
                            <span class="text-gray-700">
                                <xsl:value-of select="k:nazvy/k:nazev"/>
                            </span>
                        </nav>

                        <div class="bg-white rounded-lg shadow-xl overflow-hidden">
                            <div class="md:flex">
                                <div class="md:w-1/3 bg-gray-200 p-6 flex flex-col gap-6">
                                    
                                    <div class="bg-white p-2 rounded shadow-sm flex items-center justify-center">
                                        <xsl:choose>
                                            <xsl:when test="k:obrazky/k:obrazek[@hlavni = 'ano']">
                                                <img src="{k:obrazky/k:obrazek[@hlavni='ano']}" alt="{k:nazvy/k:nazev}" class="object-contain max-h-96 w-full rounded"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <div class="h-64 flex items-center justify-center text-gray-400 font-bold text-xl">
                                                    Bez obrázku
                                                </div>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </div>

                                    <xsl:if test="k:obrazky/k:obrazek[not(@hlavni = 'ano')]">
                                        <div>
                                            <h3 class="text-sm font-bold text-gray-500 uppercase tracking-wider mb-2">
                                                Další obrázky
                                            </h3>
                                            <div class="grid grid-cols-2 gap-2">
                                                <xsl:for-each select="k:obrazky/k:obrazek[not(@hlavni = 'ano')]">
                                                    <a href="{.}" target="_blank" class="block bg-white p-1 rounded shadow-sm hover:shadow-md transition">
                                                        <img src="{.}" class="h-24 w-full object-cover rounded"/>
                                                    </a>
                                                </xsl:for-each>
                                            </div>
                                        </div>
                                    </xsl:if>
                                </div>

                                <div class="md:w-2/3 p-8">
                                    <div class="flex justify-between items-start">
                                        <div>
                                            <h1 class="text-3xl font-bold text-gray-900">
                                                <xsl:value-of select="k:nazvy/k:nazev"/>
                                            </h1>
                                            <p class="text-lg text-gray-500 italic mb-4">
                                                <xsl:value-of select="k:nazvy/k:nazev_original"/>
                                            </p>
                                        </div>
                                        
                                        <div class="text-right">
                                            <span class="block text-2xl font-bold text-indigo-600">
                                                <xsl:value-of select="f:format-ceny(k:cena, k:cena/@mena)"/>
                                            </span>
                                            <span class="text-sm text-gray-500">
                                                Hodnocení: <xsl:value-of select="k:hodnoceni/k:body[@zdroj = 'Vlastní']"/>/10
                                            </span>
                                        </div>
                                    </div>

                                    <div class="prose max-w-none text-gray-700 mb-6">
                                        <p>
                                            <xsl:value-of select="k:popis"/>
                                        </p>
                                    </div>

                                    <div class="grid grid-cols-2 gap-4 mb-6 bg-indigo-50 p-4 rounded-lg">
                                        <div>
                                            <strong>Autor:</strong>
                                            <xsl:text> </xsl:text>
                                            
                                            <xsl:value-of select="string-join(k:autori/k:autor, ', ')"/>
                                        </div>
                                        
                                        <div>
                                            <strong>Vydavatel:</strong>
                                            <xsl:text> </xsl:text>
                                            
                                            <xsl:value-of select="k:vydavatelstvi/k:vydavatel[@zeme = 'CZ']"/>
                                        </div>
                                        
                                        <div>
                                            <strong>Rok vydání:</strong>
                                            <xsl:text> </xsl:text>
                                            
                                            <xsl:value-of select="k:rok_vydani"/>
                                        </div>
                                        
                                        <div>
                                            <strong>Věk:</strong>
                                            <xsl:text> </xsl:text>
                                            
                                            <xsl:value-of select="k:doporuceny_vek"/>+
                                        </div>
                                        
                                        <div>
                                            <strong>Hráči:</strong>
                                            <xsl:text> </xsl:text>
                                            
                                            <xsl:value-of select="k:hraci/k:min"/><xsl:if test="k:hraci/k:min != k:hraci/k:max">-<xsl:value-of select="k:hraci/k:max"/></xsl:if>
                                        </div>
                                        
                                        <div>
                                            <strong>Doba:</strong>
                                            <xsl:text> </xsl:text>
                                            
                                            <xsl:value-of select="k:herni_doba/k:min"/>-<xsl:value-of select="k:herni_doba/k:max"/>
                                            <xsl:value-of select="k:herni_doba/@jednotka"/>
                                        </div>
                                    </div>

                                    <div class="mb-6">
                                        <h3 class="font-bold mb-2">
                                            Kategorie:
                                        </h3>
                                        
                                        <div class="flex flex-wrap gap-2">
                                            <xsl:for-each select="k:kategorie_seznam/k:kategorie">
                                                <span class="bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded-full">
                                                    <xsl:value-of select="."/>
                                                </span>
                                            </xsl:for-each>
                                        </div>
                                    </div>

                                    <div>
                                        <h3 class="font-bold mb-2">Komponenty:</h3>
                                        <ul class="list-disc list-inside text-sm text-gray-600">
                                            <xsl:for-each select="k:komponenty_seznam/k:komponent">
                                                <li>
                                                    <xsl:value-of select="."/>
                                                    (<xsl:value-of select="@pocet"/> ks, <xsl:value-of select="@typ"/>)
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>

                    <xsl:apply-templates select="." mode="footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="k:hra" mode="card">
        <div class="bg-white rounded-lg shadow hover:shadow-lg transition duration-300 overflow-hidden border border-gray-200 flex flex-col h-full">
            <div class="p-5 flex-grow">
                <div class="flex justify-between items-start mb-2">
                    <h3 class="text-xl font-bold text-gray-900">
                        <a href="{concat('hra_', @id, '.html')}" class="hover:text-indigo-600 transition">
                            <xsl:value-of select="k:nazvy/k:nazev"/>
                        </a>
                    </h3>
                    
                    <span
                        class="bg-yellow-100 text-yellow-800 text-xs font-semibold px-2.5 py-0.5 rounded">
                        <xsl:value-of select="k:hodnoceni/k:body[@zdroj = 'Vlastní']"/>
                    </span>
                </div>
                
                <p class="text-sm text-gray-500 mb-3">
                    <xsl:value-of select="k:nazvy/k:nazev_original"/>
                </p>
                
                <p class="text-gray-700 text-sm line-clamp-3 mb-4">
                    <xsl:value-of select="substring(k:popis, 1, 150)"/>...
                </p>

                <div class="text-xs text-gray-500 mt-auto">
                    <span class="mr-3">
                        👥 <xsl:value-of select="k:hraci/k:min"/><xsl:if test="k:hraci/k:min != k:hraci/k:max">-<xsl:value-of select="k:hraci/k:max"/></xsl:if>
                    </span>
                    <span>
                        ⏱ <xsl:value-of select="k:herni_doba/k:min"/>-<xsl:value-of select="k:herni_doba/k:max"/>
                        <xsl:value-of select="k:herni_doba/@jednotka"/>
                    </span>
                </div>
            </div>
            <div class="bg-gray-50 px-5 py-3 border-t border-gray-200 text-right">
                <a href="{concat('hra_', @id, '.html')}" class="text-indigo-600 hover:text-indigo-900 font-medium text-sm">
                    Detail hry →
                </a>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="node()" mode="html-head">
        <xsl:param name="title"/>
        <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>
                <xsl:value-of select="$title"/>
            </title>
            <script src="https://cdn.tailwindcss.com"/>
        </head>
    </xsl:template>

    <xsl:template match="node()" mode="main-menu">
        <header class="bg-indigo-600 text-white shadow-md">
            <div class="container mx-auto px-4 py-4 flex justify-between items-center">
                <a href="index.html" class="text-2xl font-bold tracking-tight">
                    🎲 Deskovky
                </a>
                
                <nav>
                    <ul class="flex space-x-6">
                        <li>
                            <a href="index.html" class="hover:text-indigo-200 transition">
                                Domů
                            </a>
                        </li>
                        
                        <li>
                            <a href="https://validator.w3.org/" target="_blank" class="hover:text-indigo-200 transition text-sm opacity-80">
                                Validátor
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
    </xsl:template>

    <xsl:template match="node()" mode="footer">
        <footer class="bg-gray-800 text-gray-400 py-6 mt-8">
            <div class="container mx-auto px-4 text-center text-sm">
                <p>
                    © 2025 Katalog deskových her. Semestrální práce 4IZ238.
                </p>
                <p>
                    Počet her v katalogu: <xsl:value-of select="count(//k:hra)"/>
                </p>
            </div>
        </footer>
    </xsl:template>

</xsl:stylesheet>