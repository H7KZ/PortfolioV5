---
date: '2025-06-30'
title: LŠVPH - Materiály
author: Jan Komínek
thumbnail: /images/posts/lsvph/thumbnail.webp
tags:
    - LŠVPH
    - SSPŠ
---

# Interní plán – Úvod do programování v C# a příprava na Unity

- [HackMD skripta](https://hackmd.io/30h9H3w5T0eY5wFULt50Pw)

## Blok 1: Naprosté základy (120 minut)

### Úvod a instalace (0 - 20 min)

- **Představení a motivace** (10 min)

- "Ahoj, dnes začneme cestu, na jejímž konci si budete moci naprogramovat vlastní hru v Unity. Ale nejdřív se musíme naučit jazyk, kterým Unity mluví – C#." Ukažte krátké video nebo pár screenshotů z her vytvořených v Unity, abyste je navnadili.

- **Instalace** (10 min)

- Toto je ideální udělat předem, ale pokud to nejde, tak teď.
    1. Nainstalovat .NET SDK: Jděte na dotnet.microsoft.com/download a stáhněte .NET (aktuální verzi).
    2. Nainstalovat Visual Studio Code: Jděte na code.visualstudio.com.
    3. Nainstalovat C# rozšíření do VS Code: V VS Code otevřete záložku "Extensions" (Ctrl+Shift+X) a vyhledejte a nainstalujte "C#".

### První program (20 - 60 min)

- **Hello, World!** (20 min)

- Společně krok za krokem vytvořte první program.
    1. Vytvořte novou složku, např. "CsharpKurz".
    2. Otevřete ji ve VS Code.
    3. Otevřete terminál (Ctrl+;) a napište dotnet new console. Tím se vygeneruje základní projekt.
    4. Otevřete soubor Program.cs. Vysvětlete strukturu (using, class, Main metoda) pomocí materiálů pro žáky.
    5. Změňte Console.WriteLine("Hello, World!"); na Console.WriteLine("Ahoj, světe!");.
    6. Spusťte pomocí dotnet run.

- **Proměnné a datové typy** (20 min)

- Pomocí materiálů vysvětlete int, string, float, bool. Kladete důraz na float a f na konci, protože to budou používat v Unity. Společně deklarujte pár proměnných a vypisujte je do konzole. Nechte je experimentovat.

### Logika a opakování (60 - 120 min)

- Cvičení 1: **Kalkulačka** (20 min)

- "Pojďme si zkusit načíst něco od uživatele." Ukažte Console.ReadLine();.
    - Zadání: Vytvořte program, který se zeptá na dvě čísla, sečte je a vypíše výsledek.
    - Řešení: string vstup = Console.ReadLine(); int cislo = int.Parse(vstup); - Zde je důležité vysvětlit převod z string na int.

- **Podmínky (if-else)** (15 min)

- Vysvětlete teorii na příkladu s věkem. Ukažte všechny operátory.

- Cvičení 2: **Kontrola věku** (15 min)
    - Zadání: Rozšiřte kalkulačku. Program se nejprve zeptá na věk. Pokud je uživatel mladší 15 let, program vypíše "Jsi moc mladý na počítání" a skončí. Jinak pokračuje k výpočtu.

<br />

## Blok 2: Struktura kódu a jednoduchá hra (120 minut)

### Cykly (0 - 40 min)

- **for a while cykly** (20 min)

- Vysvětlete rozdíl a syntaxi. U for cyklu zdůrazněte jeho použití pro opakování s jasným počtem (např. "vytvoř 10 nepřátel"). U while cyklu zdůrazněte použití pro opakování, dokud platí podmínka (např. "dokud má hráč životy").

- Cvičení 3: **Hádání čísla** (20 min)
    - Zadání: Vytvořte hru, kde si počítač "myslí" číslo od 1 do 100. Uživatel hádá, dokud se netrefí. Po každém pokusu mu program řekne, jestli je jeho číslo větší nebo menší.
    - Nápověda: Random rand = new Random(); int nahodneCislo = rand.Next(1, 101);

### Metody (Funkce) (40 - 80 min)

- **Vysvětlení a syntaxe** (20 min)

- Použijte materiály a ukažte, jak vytvořit metodu, která nic nevrací (void), a metodu, která vrací hodnotu (int, string, ...). Zdůrazněte výhody: přehlednost a znovupoužitelnost. "Proč psát stejný kód pětkrát, když ho můžeme napsat jednou a pětkrát ho zavolat?"

- **Refaktorizace cvičení 3** (20 min)
    - "Pojďme si vylepšit naši hru na hádání čísel." Společně přesuňte logiku hry do samostatné metody, např. static void SpustitHru(). Z Main metody ji pak jen zavolejte. Ukažte, jak je kód najednou čistší.

### Kombinace všeho (80 - 120 min)

- Cvičení 4: Miniprojekt - **Textová adventura** (30 min)
    - Zadání: Vytvořte jednoduchou textovou adventuru. Hráč začíná v místnosti. Má na výběr dvoje dveře (levé/pravé).
        - Za jedněmi je poklad (výhra).
        - Za druhými je past (prohra).
    - Použijte vše, co umíte: Console.WriteLine na popis situace, Console.ReadLine na vstup, if-else na rozhodování. Můžete přidat i while cyklus pro možnost hrát znovu.

<br />

## Blok 3: Objektově orientované programování (OOP) (120 minut)

### Třídy a objekty (0 - 45 min)

- **Teorie: Šablona vs. instance** (20 min)

- Toto je nejdůležitější blok. Použijte analogii s autem z materiálů. Pečlivě vysvětlete, že třída je jen plán a objekt je reálná věc. Kreslete na tabuli/sdílejte obrazovku.

- **Praktická ukázka: Třída Hrac** (25 min)

- Společně vytvořte třídu Hrac s vlastnostmi jmeno, zdravi a metodou Utok(). V Main metodě vytvořte dva různé objekty (hrac1, hrac2), nastavte jim odlišné vlastnosti a zavolejte jejich metody. Ať si žáci "osahají", že oba objekty existují v paměti současně, ale nezávisle na sobě.

### Dědičnost (45 - 80 min)

- **Teorie: Zlepšování šablon** (15 min)

- Vysvětlete koncept dědičnosti pomocí příkladu Nepritel -> Skret, Drak. Zdůrazněte, že dceřiná třída "umí všechno co rodič, a něco navíc". Toto je přímý most k Unity (všechny skripty dědí od MonoBehaviour).

- Cvičení 5: **Bojový systém** (20 min)
    - Zadání: Vytvořte rodičovskou třídu Bojovnik s vlastností zdravi a metodou UtocNa(Bojovnik cil). Vytvořte dceřiné třídy Hrac a Nepritel. V Main metodě vytvořte jednoho hráče a jednoho nepřítele. Simulujte boj tak, že na sebe budou střídavě útočit v while cyklu, dokud zdraví jednoho z nich neklesne na 0.

### Finální projekt a výhled (80 - 120min)

- Závěrečný projekt: Textové RPG (25 min)
    - Zadání: "Teď to všechno spojíme." Nechte žáky, aby si vybrali, zda rozšíří svou textovou adventuru nebo bojový systém. Mohou přidat více typů nepřátel (dědičnost), předměty (třída Predmet), inventář (seznam objektů) atd.
    - Cíl: Není dokončit hru, ale aplikovat OOP principy. Buďte k dispozici, raďte a pomáhejte.

- **Shrnutí a propojení s Unity** (5 min)

- Na závěr ukažte screenshot editoru Unity s nějakým C# skriptem. "Podívejte, public class PlayerController : MonoBehaviour. Vidíte? Je to přesně to, co jsme dělali. Naše třída PlayerController DĚDÍ od MonoBehaviour. Proměnné jako public float speed; se objeví přímo v editoru Unity. Teď už máte všechny základy, abyste tomu rozuměli." Zodpovězte zbylé dotazy.
