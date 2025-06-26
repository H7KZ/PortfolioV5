---
date: '2025-06-30'
title: LŠVPH - Materiály
author: Jan Komínek
thumbnail: /images/posts/lsvph/thumbnail.webp
tags:
    - LŠVPH
    - SSPŠ
---

# Úvod do programování v C# a příprava na Unity

> Vítejte v kurzu programování! Během následujících 6 hodin se naučíme základy jazyka C# (vyslovuje se "sí šarp"). Tento jazyk je klíčový pro vývoj her v populárním enginu Unity, ale používá se i na tvorbu webových aplikací, softwaru pro Windows a mnoho dalšího

> Cíl: Naučit se myslet jako programátor, psát vlastní kód a pochopit principy, které nám otevřou dveře do světa herního vývoje

## Obsah

1. [Co je programování a co je C#?](#1-co-je-programovani-a-co-je-csharp)

<br />

<div id="1-co-je-programovani-a-co-je-csharp"></div>

## 1. Co je programování a co je C#?

- **Programování**: Je to proces, při kterém dáváme počítači přesné instrukce, co má dělat. Počítač je hloupý – udělá jen to, co mu řekneme. My se musíme naučit mluvit jeho jazykem
- **Programovací jazyk**: Je to soubor pravidel a příkazů (syntaxe), kterým počítač rozumí. My budeme používat C#
- **C#**: Moderní, všestranný a poměrně přehledný jazyk od společnosti Microsoft. Je ideální pro začátečníky, ale zároveň dostatečně silný pro profesionální projekty

**Nástroje, které budeme potřebovat:**

- **Visual Studio**: Editor kódu s funkcemi pro psaní, ladění a správu C# kódu
- **.NET SDK**: Balíček nástrojů, který nám umožní spouštět C# kód

<br />

<div id="2-nas-prvni-program-hello-world"></div>

## 2. Náš první program: "Hello, World!"

```csharp
// Toto je komentář, počítač ho ignoruje. Slouží pro poznámky.

using System; // Tímto říkáme, že chceme používat základní knihovnu System

// Vše v C# je organizováno do tříd
class Program
{
    // Metoda Main je hlavní vstupní bod programu. Zde vše začíná.
    static void Main()
    {
        Console.WriteLine("Hello, World!"); // Příkaz pro výpis textu na jeden řádek
    }
}
```

## 3. Stavební kameny kódu: Proměnné a datové typy

> Představte si proměnnou jako krabičku s popiskem, do které si můžeme uložit nějakou informaci. Každá krabička je určená pro jiný typ obsahu

- _int_ (_integer_) - **Celá čísla** (např. 10, -5, 120)

- _float_ - **Desetinná čísla** (např. 3.14f, -0.5f). V C# se za desetinná čísla typu float píše písmeno f. V Unity je to nejpoužívanější typ pro desetinná čísla

- _double_ - **Přesnější desetinná čísla**

- _string_ - **Text** (musí být v uvozovkách, např. "Ahoj")

- _bool_ (_boolean_) - **Logická hodnota**, může být pouze true (**pravda**) nebo false (**nepravda**)

**Příklad:**

```csharp
string jmenoHraca = "Karel";
int skore = 100;
float zivoty = 99.5f;
bool maKlic = true;

Console.WriteLine(jmenoHraca); // Vypíše "Karel"
Console.WriteLine(skore);      // Vypíše 100
```

<br />

<div id="4-logika-a-rozhodovani-podminky-if-else"></div>

## 4. Logika a rozhodování: Podmínky (if-else)

> Často potřebujeme, aby se program choval různě podle situace. K tomu slouží podmínky

**Syntaxe:**

```csharp
if (podminka)
{
    // Kód, který se provede, pokud je podmínka PRAVDIVÁ
}
else
{
    // Kód, který se provede, pokud je podmínka NEPRAVDIVÁ
}
```

**Příklad:**

```csharp
int vek = 18;

if (vek >= 18)
{
    Console.WriteLine("Vstup povolen.");
}
else
{
    Console.WriteLine("Vstup zakázán, jsi příliš mladý.");
}
```

**Operátory porovnání:**

- **==** (rovná se)

- **!=** (nerovná se)

- **\>** (větší než)

- **\<** (menší než)

- **\>=** (větší nebo rovno)

- **\<=** (menší nebo rovno)

<br />

<div id="5-opakovani-kodu-cykly-for-while"></div>

5. Opakování kódu: Cykly (for, while)

> Když potřebujeme nějakou část kódu provést vícekrát, použijeme cykly

- **for cyklus**: Používáme, když předem víme, kolikrát chceme něco zopakovat

```csharp
// Tento cyklus se provede 10krát (pro i od 0 do 9)
for (int i = 0; i < 10; i++)
{
    Console.WriteLine("Opakování číslo: " + i);
}
```

- **while cyklus**: Používáme, když chceme kód opakovat, dokud platí nějaká podmínka

```csharp
int zivoty = 3;
while (zivoty > 0)
{
    Console.WriteLine("Hráč má ještě " + zivoty + " životů.");
    zivoty = zivoty - 1; // Každým opakováním se životy sníží
}
Console.WriteLine("Game Over!");
```

<br />

<div id="6-organizace-kodu-metody-funkce"></div>

## 6. Organizace kódu: Metody (Funkce)

> Metoda je pojmenovaný blok kódu, který můžeme "zavolat" z jiných míst v programu. Pomáhá nám to udržovat kód přehledný a neopakovat se

```csharp
class Program
{
    static void Main()
    {
        // Zavoláme naši novou metodu
        PozdravHrace("Petr");
        PozdravHrace("Jana");

        int vysledek = Secti(5, 3);
        Console.WriteLine("Součet je: " + vysledek); // Vypíše 8
    }

    // Naše vlastní metoda, která nic nevrací (void)
    static void PozdravHrace(string jmeno)
    {
        Console.WriteLine("Ahoj, " + jmeno + "!");
    }

    // Metoda, která vrací výsledek typu int
    static int Secti(int a, int b)
    {
        return a + b;
    }
}
```

<br />

## 7. Objektově orientované programování (OOP): Třídy a objekty

> Toto je nejdůležitější koncept pro pochopení Unity

- **Třída** (_Class_): Je to šablona nebo plán na vytvoření něčeho. Například třída Auto by popisovala, jaké má každé auto vlastnosti (barva, značka) a co umí dělat (jet, troubit)

- **Objekt** (_Object_): Je to konkrétní instance vytvořená podle šablony (třídy). Například mojeCervenaSkodovka by byl objekt vytvořený podle třídy Auto

**Příklad:**

```csharp
// ŠABLONA (PLÁN)
class Hrac
{
    // Vlastnosti (proměnné)
    public string jmeno;
    public int zdravi = 100;

    // Schopnosti (metody)
    public void Utok()
    {
        Console.WriteLine(jmeno + " útočí!");
    }
}

class Program
{
    static void Main()
    {
        // Tvoříme konkrétní OBJEKTY podle šablony Hrac
        Hrac hrac1 = new Hrac();
        hrac1.jmeno = "Rytíř";

        Hrac hrac2 = new Hrac();
        hrac2.jmeno = "Kouzelník";
        hrac2.zdravi = 75;

        // Používáme jejich vlastnosti a schopnosti
        Console.WriteLine(hrac1.jmeno + " má " + hrac1.zdravi + " zdraví.");
        Console.WriteLine(hrac2.jmeno + " má " + hrac2.zdravi + " zdraví.");

        hrac1.Utok(); // Vypíše "Rytíř útočí!"
        hrac2.Utok(); // Vypíše "Kouzelník útočí!"
    }
}
```

<br />

<div id="8-dedicnost-vylepsovani-sablon"></div>

## 8. Dědičnost: Vylepšování šablon

> Dědičnost nám umožňuje vytvořit novou třídu, která převezme (zdědí) všechny vlastnosti a schopnosti z jiné, již existující třídy, a přidá k nim něco navíc

- Třída, ze které se dědí, se nazývá rodičovská nebo základní (base class)

- Nová třída, která dědí, se nazývá dceřiná nebo odvozená (derived class)

**Příklad (navazuje na předchozí):**

```csharp
// Rodičovská třída
class Nepritel
{
    public int zdravi = 100;

    public void Utok()
    {
        Console.WriteLine("Nepřítel útočí!");
    }
}

// Dceřiná třída, která DĚDÍ od třídy Nepritel
// a přidává něco navíc
class Skret : Nepritel
{
    public void Rvat()
    {
        Console.WriteLine("Skřet řve!");
    }
}

// Další dceřiná třída
class Drak : Nepritel
{
    // Drak má navíc schopnost chrlit oheň
    public void ChrlitOhen()
    {
        Console.WriteLine("Drak chrlí oheň!");
    }
}

class Program
{
    static void Main()
    {
        Skret skret1 = new Skret();
        skret1.zdravi = 50; // zdravi zdědil od třídy Nepritel
        skret1.Utok();      // Utok() také zdědil
        skret1.Rvat();      // Rvat() je jeho vlastní metoda

        Drak drak1 = new Drak();
        drak1.Utok();
        drak1.ChrlitOhen();
    }
}
```

**_!!!_** Proč je to důležité pro Unity? V Unity je každý objekt ve hře (postava, nepřítel, kamera, světlo) postaven na tomto principu. Vytváříte si vlastní "skripty" (což jsou C# třídy), které dědí od základních tříd Unity, a tím dáváte objektům chování **_!!!_**
