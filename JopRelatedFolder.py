radky = []

with open("/Users/borovickova/Library/Mobile Documents/com~apple~CloudDocs/studijní/datová analýza/GitHub/battles.tsv", encoding="utf-8") as soubor:
    for radek in soubor:
        radky.append(radek.split("\t")) # append(...) je metoda seznamu, která přidá řádek do seznamu radky
                                        # split("\t") rozdělí řádek podle tabulátoru na jednotlivé položky

zahlavi = radky[0]  # první řádek obsahuje názvy sloupců
print(zahlavi)

#