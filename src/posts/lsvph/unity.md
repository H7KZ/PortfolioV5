---
date: '2025-06-30'
title: LŠVPH - Materiály
author: Jan Komínek
thumbnail: /images/posts/lsvph/thumbnail.webp
tags:
    - LŠVPH
    - SSPŠ
---

# Vstup do herního světa: Tvoříme v Unity 🚀

> Vítejte v Unity! V předchozím kurzu jste se naučili jazyk C#. Teď je čas tento jazyk použít k tomu, abychom
> rozpohybovali objekty a vytvořili naši první jednoduchou 3D hru. Unity je jako obrovské digitální hřiště a C# je jazyk,
> kterým dáváte hračkám pravidla

> **Cíl:** Pochopit, jak funguje Unity editor, naučit se základní stavební kameny každé hry a na konci si vytvořit a
> spustit vlastní funkční hru

---

## Základní myšlenka Unity: GameObject a Komponenty 🧱

Toto je nejdůležitější princip v celém Unity. Jakmile ho pochopíte, vše ostatní do sebe zapadne

- **GameObject**: Představte si to jako prázdný kontejner, "věc" ve vaší hře. Může to být hráč, nepřítel, zeď, světlo,
  kamera... cokoliv. Sám o sobě ale **nic neumí a není vidět**. Je to jen prázdná schránka s názvem a pozicí

- **Komponenta (Component)**: Jsou to "stavební bloky" chování a vlastností, které dáváte na GameObjects. Chcete, aby
  prázdná schránka něco dělala? Dejte jí komponentu!
    - **Transform**: Tuto komponentu má každý GameObject automaticky a nejde ji odebrat. Určuje jeho **pozici, rotaci a
      velikost** (scale) ve světě
    - **Mesh Renderer & Mesh Filter**: Chcete, aby byl objekt vidět? `Mesh Filter` mu dává tvar (např. kostka, koule) a
      `Mesh Renderer` mu dává materiál (barvu, texturu)
    - **Rigidbody**: Chcete, aby reagoval na **fyziku** (gravitaci, síly, kolize)? Dejte mu komponentu `Rigidbody`
    - **Collider**: Chcete, aby měl fyzický tvar pro detekci srážek? Dejte mu `Collider` (např. `Box Collider`,
      `Sphere Collider`, `Capsule Collider`)
    - **Audio Source**: Chcete, aby vydával zvuk? Dejte mu `Audio Source`
    - **Váš C\# Skript**: Chcete, aby měl **vlastní logiku** (pohyboval se podle hráče, ztrácel životy)? Napište skript
      a přidejte ho jako komponentu!

**Analogie:** GameObject je nahý člověk. Komponenty jsou jeho oblečení, nástroje a mozek. `Mesh Renderer` jsou jeho
šaty, `Rigidbody` mu dává kostru a svaly pro interakci se světem a váš C\# skript je jeho mozek, který řídí, co má dělat

---

## Průzkum Unity Editoru: Vaše dílna 🔧

Když otevřete Unity, uvidíte několik klíčových oken, mezi kterými budete neustále přepínat

- **Scene View (Scéna)**: Vaše 3D dílna. Zde vizuálně skládáte herní svět, pohybujete s objekty, kamerou a světly
- **Game View (Hra)**: Pohled z herní kamery. Přesně takto uvidí hru finální hráč. Spouští se tlačítkem **► (Play)**.
  Během běhu hry můžete stále měnit hodnoty, ale pozor – **všechny změny provedené v Play módu se po jeho vypnutí vrátí
  zpět\!**
- **Hierarchy (Hierarchie)**: Textový seznam všech GameObjects, které máte aktuálně ve scéně. Můžete zde objekty
  vnořovat do sebe a vytvářet tak vztahy rodič-dítě (např. zbraň je dítětem postavy hráče)
- **Project (Projekt)**: Vaše knihovna. Zde jsou uloženy **všechny soubory** vaší hry – 3D modely, textury, materiály,
  zvuky a hlavně vaše C\# skripty. Cokoliv chcete ve hře použít, musíte to nejdříve mít v tomto okně
- **Inspector (Inspektor)**: Nejdůležitější okno\! Když kliknete na jakýkoliv GameObject (v Hierarchy nebo ve Scene),
  Inspector vám ukáže **všechny jeho komponenty** a umožní vám měnit jejich nastavení (např. pozici v `Transform`, barvu
  v `Mesh Renderer`, rychlost ve vašem skriptu...)

---

## C# skripty v Unity: Srdce vaší hry ❤️

Váš C# skript je jen další komponenta. Aby Unity rozumělo vašemu kódu a mohlo ho spouštět, musí vaše třída "dědit" (
přebírat vlastnosti) od speciální Unity třídy `MonoBehaviour`

```csharp
using UnityEngine; // Musíme používat knihovnu Unity pro přístup k třídám jako MonoBehaviour

// Naše třída PlayerController DĚDÍ od MonoBehaviour.
// Díky tomu ji můžeme přetáhnout na GameObject v editoru.
public class PlayerController : MonoBehaviour
{
    // Cokoliv, co zde označíte jako 'public', se objeví v Inspektoru jako políčko!
    // Můžete tak měnit hodnoty bez nutnosti přepisovat kód.
    public float speed = 10.0f;

    // Pro-tip: Pokud chcete proměnnou vidět v Inspektoru, ale nechcete,
    // aby k ní mohly přistupovat jiné skripty, použijte [SerializeField]
    [SerializeField]
    private int health = 100;


    // --- Unity "Lifecycle" Metody ---

    // Metoda Awake() se volá úplně jako první (i před Startem).
    // Používá se pro inicializaci, která musí proběhnout před vším ostatním.
    void Awake()
    {
        // Příklad: Najdi si hlavní kameru a ulož si ji do proměnné.
    }

    // Metoda Start() se zavolá JEDNOU na začátku, když je objekt aktivován.
    // Ideální pro nastavení počátečních hodnot.
    void Start()
    {
        Debug.Log("Hráč byl vytvořen!");
        // Nastav pozici na začátek
        transform.position = new Vector3(0, 1, 0);
    }

    // Metoda Update() se volá KAŽDÝ SNÍMEK (frame).
    // Zde se odehrává většina herní logiky (čtení vstupu, jednoduchý pohyb...).
    // Rychlost volání závisí na výkonu počítače.
    void Update()
    {
        // Příklad čtení vstupu - viz dále
    }

    // Metoda FixedUpdate() se volá ve fixních časových intervalech, nezávisle na snímcích.
    // ZDE by se měla odehrávat veškerá FYZIKÁLNÍ logika (přidávání sil k Rigidbody).
    // Zajišťuje stabilitu fyzikální simulace.
    void FixedUpdate()
    {
        // Příklad: GetComponent<Rigidbody>().AddForce(...)
    }
}
```

---

## Fyzika v Unity: Jak dát světu pravidla 🌍

Unity má robustní fyzikální engine, který za vás řeší spoustu složitých věcí. Stačí ho správně používat

- **Rigidbody**: Jakmile objektu dáte tuto komponentu, přebírá nad ním kontrolu fyzikální engine. Začne na něj působit
  gravitace a můžete na něj aplikovat síly
- **Collider**: Definuje fyzický tvar objektu pro detekci kolizí. **Musí být na objektu, aby Rigidbody vědělo, s čím se
  má srazit.** Tvar collideru by měl co nejlépe (ale jednoduše) odpovídat viditelnému tvaru objektu
- **Kolize vs. Trigger (Spouštěč)**: Toto je klíčový rozdíl!
    - **Kolize (Collision)**: Standardní chování. Dva objekty s `Rigidbody` a `Collider` do sebe narazí a odrazí se jako
      v reálném světě. K detekci slouží metoda `void OnCollisionEnter(Collision col) { ... }`
    - **Trigger**: Pokud na `Collideru` zaškrtnete políčko **`Is Trigger`**, objekt ztratí svou "hmotnost" a ostatní
      objekty jím mohou procházet. Stále ale dokáže detekovat, že jím něco prošlo. Ideální pro sbírání mincí,
      checkpointy, nebo detekční zóny. K detekci slouží metoda `void OnTriggerEnter(Collider other) { ... }`

| Událost     | Typ       | Metoda v C\#                      | Příklad použití                     |
| :---------- | :-------- | :-------------------------------- | :---------------------------------- |
| **Srážka**  | Fyzická   | `OnCollisionEnter(Collision col)` | Kulečníková koule narazí do jiné.   |
| **Průchod** | Nefyzická | `OnTriggerEnter(Collider other)`  | Hráč projde skrz minci a sebere ji. |

---

## Prefaby: Vaše osobní šablony 📦

Prefab je uložený GameObject se všemi jeho komponentami a nastaveními. Je to extrémně mocný nástroj

**Jak to funguje:**

1. Ve scéně si vytvoříte a dokonale nastavíte nějaký objekt (např. nepřítele s modelem, skriptem pro AI, životy,
   colliderem...)
2. Tento objekt přetáhnete z okna `Hierarchy` do okna `Project`. Tím se vytvoří **Prefab**
3. Teď můžete tento Prefab "naklonovat" do scény kolikrát chcete
4. **Kouzlo:** Když změníte původní Prefab (např. zvýšíte nepříteli životy), **změní se všechny jeho kopie** (instance)
   ve hře!

**K čemu se to hodí?** K vytváření nepřátel, střel, mincí, překážek – čehokoliv, co se ve hře opakuje. Ve skriptu pak
můžete tyto prefaby vytvářet za běhu hry pomocí funkce `Instantiate(mujPrefab);`

---

## Klíčové koncepty a třídy, které musíte znát

- **Input**: Statická třída pro čtení vstupu od hráče.
    - `Input.GetKey(KeyCode.W)`: Vrací `true`, dokud je klávesa W držena
    - `Input.GetKeyDown(KeyCode.Space)`: Vrací `true` jen v tom snímku, kdy byla mezerník stisknuta
    - `Input.GetAxis("Horizontal")`: Lepší způsob pro pohyb. Vrací hodnotu od -1 do 1 podle stisku kláves A/D nebo
      šipek. Hodnoty jsou definovány v `Edit -> Project Settings -> Input Manager`

- **Vector3 / Vector2**: Struktury reprezentující bod nebo směr ve 3D/2D prostoru (složky x, y, z)
    - `Vector3.forward` je zkratka pro `new Vector3(0, 0, 1)`
    - `Vector3.up` je `new Vector3(0, 1, 0)`
    - `transform.position` je typu `Vector3`

- **Time**: Statická třída pro práci s časem
    - `Time.deltaTime`: Čas, který uplynul od posledního snímku. **Je extrémně důležité násobit jakýkoliv pohyb
      v `Update` touto hodnotou!** Zajišťuje, že pohyb bude stejně rychlý na pomalých i rychlých počítačích (pohyb za
      sekundu, ne pohyb za snímek)
    - `Time.time`: Celkový čas v sekundách od spuštění hry

- **GetComponent\<T\>()**: Metoda, kterou získáte odkaz na jinou komponentu na **stejném** GameObjectu
    - `Rigidbody rb = GetComponent<Rigidbody>();`
    - `rb.AddForce(Vector3.up * 10);`

---

## Export hotové hry (Build) 🎮

Až bude hra hotová, můžete ji "zabalit" do spustitelného souboru (.exe pro Windows), který můžete poslat kamarádům

1. Jděte do menu **File -> Build Settings**
2. Klikněte na **Add Open Scenes**, aby se do buildu přidala vaše aktuální scéna
3. Zvolte cílovou platformu (např. **PC, Mac & Linux Standalone**)
4. Klikněte na **Build** a vyberte složku, kam se má hra uložit
5. Unity hru zkompiluje a vytvoří spustitelný soubor. Hotovo!

---

## Kam dál? Zdroje pro další studium 📚

Svět Unity je obrovský. Zde je pár míst, kde se můžete učit dál:

- **[Unity Learn](https://learn.unity.com/)**: Oficiální výuková platforma od Unity. Najdete zde spoustu kurzů od
  začátečníků po experty, často i s hotovými projekty
- **[Unity Documentation](https://docs.unity3d.com/Manual/index.html)**: Oficiální manuál a dokumentace. Kdykoliv si
  nebudete vědět rady s nějakou komponentou nebo funkcí, zde najdete odpověď
- **[Brackeys (YouTube)](https://www.youtube.com/c/Brackeys)**: Ačkoliv již netvoří nová videa o Unity, jeho kanál je
  zlatý důl skvělých a srozumitelných tutoriálů na všechna možná témata
