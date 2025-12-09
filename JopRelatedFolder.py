radky = []

with open("/Users/borovickova/Library/Mobile Documents/com~apple~CloudDocs/studijní/datová analýza/GitHub/battles.tsv", encoding="utf-8") as soubor:
    for radek in soubor:
        radky.append(radek.split("\t")) # append(...) je metoda seznamu, která přidá řádek do seznamu radky
                                        # split("\t") rozdělí řádek podle tabulátoru na jednotlivé položky

utocici_rod_bitva_1 = radky[1][5]  # přístup k druhému řádku (index 1) a šestému sloupci (index 5)
print(utocici_rod_bitva_1)