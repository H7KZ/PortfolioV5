---
date: '2025-06-30'
title: LŠVPH - Materiály
author: Jan Komínek
thumbnail: /images/posts/lsvph/thumbnail.webp
tags:
    - LŠVPH
    - SSPŠ
---

# Vstup do herního světa: Tvoříme v Unity

> Vítejte v Unity! V předchozím kurzu jste se naučili jazyk C#. Teď je čas tento jazyk použít k tomu, abychom rozpohybovali objekty a vytvořili naši první jednoduchou 3D hru

> Cíl: Pochopit, jak funguje Unity editor, naučit se základní stavební kameny každé hry a na konci si vytvořit a spustit vlastní funkční hru

## Obsah

1. [Velká myšlenka Unity: Vše je GameObject s komponentami](#1-velka-myslenka-unity-vse-je-gameobject-s-komponentami)

<br />

<div id="1-velka-myslenka-unity-vse-je-gameobject-s-komponentami"></div>

## 1. Velká myšlenka Unity: Vše je GameObject s komponentami

**Toto je nejdůležitější princip, který musíte pochopit:**

- **GameObject**: Představte si to jako prázdný kontejner, "věc" ve vaší hře. Může to být hráč, nepřítel, zeď, světlo, kamera... cokoliv. Sám o sobě ale nic neumí

- **Komponenta** (Component): Jsou to "stavební bloky", které dáváte na GameObjects, aby získaly vlastnosti a schopnosti
    - Chcete, aby objekt měl pozici v prostoru? Dejte mu komponentu Transform. (Tuto má každý GameObject automaticky)
    - Chcete, aby byl vidět? Dejte mu komponenty Mesh Filter (tvar) a Mesh Renderer (materiál/barva)
    - Chcete, aby reagoval na fyziku (gravitaci, kolize)? Dejte mu komponentu Rigidbody
    - Chcete, aby měl tvar pro kolize? Dejte mu Collider (např. Box Collider, Sphere Collider)
    - Chcete, aby měl vlastní chování? Dejte mu váš C# skript!

- **Analogie**: GameObject je auto. Jeho komponenty jsou motor, kola, karoserie a volant. Každá komponenta má svůj specifický úkol

<br />

<div id="2-pruzkum-unity-editoru"></div>

## 2. Průzkum Unity Editoru

**Když otevřete Unity, uvidíte několik klíčových oken:**

- **Scene View** (Scéna): Vaše dílna. Zde skládáte a pohybujete s objekty ve 3D prostoru

- **Game View** (Hra): Pohled z herní kamery. Takto uvidí hru finální hráč. Spouští se tlačítkem ► (Play)

- **Hierarchy** (Hierarchie): Seznam všech GameObjects, které máte aktuálně ve scéně

- **Project** (Projekt): Všechny soubory vaší hry – skripty, modely, textury, zvuky. Je to vaše "knihovna" všech dílů

- **Inspector** (Inspektor): Nejdůležitější okno! Když kliknete na jakýkoliv GameObject (v Hierarchy nebo ve Scene), Inspector vám ukáže všechny jeho komponenty a umožní vám měnit jejich nastavení (např. pozici, barvu, rychlost ve vašem skriptu...)

<br />

<div id="3-c-skripty-v-unity-monobehaviour"></div>

## 3. C# skripty v Unity: MonoBehaviour

> Váš C# skript je jen další komponenta. Aby Unity rozumělo vašemu kódu, musí vaše třída dědit od speciální Unity třídy MonoBehaviour

```csharp
using UnityEngine; // Musíme používat knihovnu Unity

// Naše třída PlayerController DĚDÍ od MonoBehaviour.
// Díky tomu ji můžeme přetáhnout na GameObject v editoru.
public class PlayerController : MonoBehaviour
{
    // Cokoliv, co zde označíte jako 'public', se objeví v Inspektoru!
    public float speed = 10.0f;

    // Metoda Start() se zavolá JEDNOU na začátku, když je objekt aktivován.
    // Ideální pro nastavení počátečních hodnot.
    void Start()
    {
        Debug.Log("Hráč byl vytvořen!");
    }

    // Metoda Update() se volá KAŽDÝ SNÍMEK (frame).
    // Zde se odehrává veškerá herní logika v reálném čase (pohyb, střelba...).
    void Update()
    {
        // Příklad pohybu - toto budeme psát v hodině
    }
}
```

**Klíčové metody MonoBehaviour:**

- **Start()**: Volá se jednou při startu.

- **Update()**: Volá se každý snímek.

- **OnCollisionEnter(Collision collision)**: Volá se, když se dva objekty s Rigidbody a Collider fyzicky srazí

- **OnTriggerEnter(Collider other)**: Volá se, když jeden objekt vstoupí do "spouštěcí zóny" (Trigger) jiného objektu. Kolize není fyzická, objekty projdou skrz sebe

<br />

<div id="4-prefaby-vase-osobni-sablony"></div>

## 4. Prefaby: Vaše osobní šablony

> Prefab je uložený GameObject se všemi jeho komponentami. Můžete si vytvořit perfektního nepřítele nebo minci, uložit si ho jako Prefab a pak ho ve hře vytvářet (instanciovat) kolikrát chcete. Když změníte Prefab, změní se všechny jeho kopie ve hře. Je to extrémně mocný nástroj

<br />

<div id="5-jak-cist-vstup-od-hrace"></div>

## 5. Jak číst vstup od hráče?

- V metodě Update() můžeme snadno zjistit, jestli hráč mačká nějakou klávesu

```csharp
void Update()
{
    if (Input.GetKey(KeyCode.W))
    {
        // Pohyb dopředu
        // transform je odkaz na Transform komponentu objektu, na kterém je tento skript
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
    }
}
```

- **Vector3.forward**: Vektor směřující dopředu (0, 0, 1)

- **Time.deltaTime**: Čas, který uplynul od posledního snímku. Je extrémně důležité násobit pohyb touto hodnotou! Zajišťuje, že pohyb bude stejně rychlý na pomalých i rychlých počítačích

<br />

<div id="6-export-hotove-hry-build"></div>

## 6. Export hotové hry (Build)

1. Až bude hra hotová, můžeme ji "zabalit" do spustitelného souboru (.exe pro Windows)

2. Jděte do File -> Build Settings

3. Přidejte otevřenou scénu (Add Open Scenes)

4. Zvolte platformu (PC, Mac & Linux Standalone)

5. Klikněte na Build a vyberte složku, kam se má hra uložit
