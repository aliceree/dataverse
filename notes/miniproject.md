# zadání projektu
Ze souboru `battles.tsv` si načti informace o bitvách, které se odehrály ve knižní sérii Písně ohně a ledu, jejímž autorem je spisovatel George R. R. Martin a podle níž byl natočen slavný seriál Hra o trůny. Naším úkolem je ze zadaných dat zjistit následující:
- Statistiku, kolikrát byl který rod v pozici útočníků. Výsledná data ulož do CSV souboru `attackers.csv`.
- Pokud je zadaná síla obou armád (sloupce `attacker_size` a `defender_size`, indexy sloupců jsou 17 a 18), vytvoř seznam velitelů, kteří v boji porazili silnější armádu (vítěze poznáš podle sloupce `attacker_outcome`, který obsahuje hodnoty `win` a `loss`, platí vždy z pohledu útočníka). Kolik takových bitev je?

1. načíst soubor a uložit data do vhodné struktury,
```python
radky = []

with open("/Users/borovickova/Library/Mobile Documents/com~apple~CloudDocs/studijní/datová analýza/GitHub/battles.tsv", encoding="utf-8") as soubor:
    for radek in soubor:
        radky.append(radek.split("\t")) # append(...) je metoda seznamu, která přidá řádek do seznamu radky
                                        # split("\t") rozdělí řádek podle tabulátoru na jednotlivé položky
```

2. projít data řádek po řádku a pro každý řádek si uložit všechny útočících rody
```python

```