---
date: '2025-06-30'
title: LŠVPH - Materiály
author: Jan Komínek
thumbnail: /images/posts/lsvph/thumbnail.webp
tags:
    - LŠVPH
    - SSPŠ
---

# Interní plán – Vstup do herního světa: Tvoříme v Unity

## Blok 1: Seznámení s Unity a první skript (120 minut)

### Úvod a instalace (0 - 20 min)

- **Motivace a příprava** (20 min)

- "Vítejte zpět! Vaše znalosti C# teď dostanou vizuální podobu." Krátce shrňte cíl dnešního dne.

- Příprava: Ujistěte se, že všichni mají nainstalovaný Unity Hub a staženou aktuální LTS verzi Unity. Společně vytvořte nový projekt: New Project -> 3D Core.

### Prohlídka editoru (20 - 60 min)

- **Interaktivní průzkum** (40 min)

- Důkladně projděte 5 hlavních oken editoru. U každého okna ukažte praktický příklad:
    - Hierarchy: Vytvořte 3D Object -> Cube. Ukažte, že se objevila v seznamu. Přejmenujte ji na "Hrac".
    - Scene: Ukažte, jak se v něm pohybovat (pravé tlačítko myši + WASD, kolečko pro zoom, prostřední tlačítko pro posun).
    - Inspector: S vybranou kostkou "Hrac" projděte její komponenty. Změňte její pozici a rotaci v komponentě Transform.
    - Game: Ukažte, že se zde nic nehýbe. Zmáčkněte Play a ukažte, že se stále nic neděje. "Hra běží, ale nedali jsme jí žádné instrukce."
    - Project: Ukažte, kde se ukládají scény a kde budeme vytvářet složky pro skripty a prefaby. Nezapomeňte scénu uložit (Ctrl+S)!

### První skript (60 - 120 min)

- **GameObject-Component** (15 min)

- Znovu zopakujte klíčovou myšlenku. "Naše kostka 'Hrac' je GameObject. Teď jí přidáme komponentu, která jí dá mozek - náš C# skript."

- **Vytvoření a připojení skriptu** (15 min)

- V okně Project vytvořte složku Scripts. V ní klikněte pravým tlačítkem Create -> C# Script a pojmenujte ho PlayerController. Důležité: Zdůrazněte, že název souboru se musí přesně shodovat s názvem třídy v kódu. Přetáhněte skript z okna Project na objekt "Hrac" v Hierarchy nebo v Inspector. Ukažte, že se skript objevil jako nová komponenta.

- **Kódování pohybu** (20 min)

- Otevřete skript. Vysvětlete Start a Update pomocí Debug.Log(). Poté společně napište kód pro pohyb.
    1. Vytvořte public float speed = 5f;. Ukažte, jak se proměnná objevila v Inspektoru a jak ji lze měnit bez úpravy kódu.
    2. Do Update napište kód pro pohyb všemi čtyřmi směry pomocí Input.GetKey a transform.Translate. Nezapomeňte na Time.deltaTime a vysvětlete proč.
    3. Spusťte hru a otestujte pohyb.

<br />

## Blok 2: Tvorba hry "Sběrač" (180 minut)

### Sběratelské předměty (0 - 40 min)

- **Vytvoření a Prefab** (20 min)

- Vytvořte novou kostku Collectible. Dejte jí jinou barvu (vytvořte nový materiál v okně Project). Napište jí jednoduchý skript Rotator.cs, který ji v Update bude otáčet pomocí transform.Rotate().
- Až bude perfektní, vytvořte z ní Prefab přetažením z Hierarchy do Project okna. Ukažte, jak můžete nyní vytvořit více kopií.

- **Fyzika a Triggery** (20 min)

- Přidejte hráči komponentu Rigidbody. Vysvětlete, že teď na něj působí fyzika. Zakažte gravitaci (Use Gravity odškrtnout).
- Na Prefab Collectible přidejte komponentu Rigidbody (s vypnutou gravitací) a u jeho Box Collider zaškrtněte políčko Is Trigger. Vysvětlete rozdíl mezi pevnou kolizí a triggerem.

### Interakce a UI (40 - 85 min)

- **Sběr pomocí Triggeru** (20 min)

- V PlayerController.cs přidejte metodu private void OnTriggerEnter(Collider other).
- Uvnitř použijte if (other.CompareTag("Collectible")). Ukažte, jak se vytváří a přiřazuje Tag ("Collectible") v Inspektoru.
- Uvnitř if bloku napište Destroy(other.gameObject);. Otestujte, že při dotyku sběratelský předmět zmizí.

- **UI pro skóre** (25 min)

- Vytvořte UI Text: Hierarchy -> UI -> Text - TextMeshPro. Importujte TMP Essentials. Vysvětlete, že se vytvořil Canvas a EventSystem. Umístěte text do rohu obrazovky.
- V PlayerController přidejte using TMPro; na začátek. Vytvořte public TextMeshProUGUI scoreText; a private int score;.
- V editoru přetáhněte UI Text objekt do prázdného políčka Score Text v Inspektoru hráče.
- V Start() nastavte score = 0; a aktualizujte text. V OnTriggerEnter zvyšte skóre a znovu aktualizujte text.

### Dokončení hry (85 - 150 min)

- **Nepřítel** (25 min)

- Vytvořte "nepřítele" (např. červenou kouli). Dejte mu Rigidbody a Collider. Napište mu jednoduchý skript, který ho bude posouvat sem a tam (např. pomocí Mathf.PingPong).

- **Kolize s nepřítelem** (20 min)

- Do PlayerController.cs přidejte metodu private void OnCollisionEnter(Collision collision). Pomocí tagu "Enemy" detekujte srážku.
- Při srážce můžete buď resetovat skóre na 0, nebo restartovat celou hru. Ukažte restart: přidejte using UnityEngine.SceneManagement; a v metodě zavolejte SceneManager.LoadScene(SceneManager.GetActiveScene().name);.

- **Vylepšení scény** (10 min)

- Vytvořte jednoduchou "arénu" pomocí zvětšené kostky jako podlahy a čtyř dalších jako stěn, aby hráč a nepřítel nemohli spadnout.

### Build hry (150 - 170 min)

- **Export do .EXE** (20 min)

- Projděte s nimi proces File -> Build Settings. Ujistěte se, že je jejich scéna v seznamu. Ukažte Player Settings, kde mohou nastavit název hry. Spusťte Build. Až se hra vygeneruje, spusťte ji mimo Unity. Toto je klíčový moment, kdy uvidí výsledek své práce jako reálnou aplikaci.

### Závěr (170 - 180 min)

- Rekapitulace a kam dál (10 min)

- Shrňte, co všechno se naučili: Editor, GameObject, Component, Skriptování, Fyzika, UI, Prefaby, Build.
- Ukažte jim, kde hledat další informace: Unity Learn (oficiální tutoriály), Unity Documentation (manuál), a doporučte starší, ale stále zlaté, kanály na YouTube jako Brackeys. Odpovězte na dotazy.
