# slovníky
```python
item = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}
# klíč (key): hodnota (value)
```

- vypsání konkrétní položky ze slovníku
```python
item = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}
print(f"Vybraný produkt je {item['title']}")
```

- vložení nové položky do seznamu
```python
item = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}
item["weight"] = 0.9
print(item["weight"])
```

- pokud položka není na seznamu (a chci používat program, který nevyhazuje chybu) musím přidat podmínku
```python
item = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}
#item["weight"] = 0.9
if "weight" in item:
    print(item["weight"])
else:
    print("Hmotnost není uvedena.")
```

- mohu vyhledávát také v hodnotách, ne jen v klíčích
```python
sklad = {"A1": "Čajová konvička s hrnky", "A2": "Zubní kartáček"}
if "Zubní kartáček" in sklad.values():
    print("Zubní kartáček máme skladem.")
else:
    print("Zubní kartáček nemáme skladem.")
```

- klíč může být také proměnná
```python
item = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}

my_key = "title"
print(item[my_key])
```

## cvičení
**Zadání:** Vytvoř slovník, který reprezentuje vysvědčení. Klíč slovníku bude název předmětu a hodnota známka z daného předmětu. Pro zjednodušení vlož do slovníku pouze tři předměty (například český jazyk, matematiku a dějepis). Vypiš obsah slovníku pomocí funkce `print()`.

```python
vysvedceni = {"M": 1, "ČJ": 2, "D": 1}
print(f"Z matematiky máte známku: {vysvedceni['M']}.")
```

**Zadání:** Vydavatel detektivek si eviduje prodané kusy u jednotlivých knih. V následujícím slovníku najdeš tři knihy a u každé z nich je počet prodaných kusů.
```python
sales = {
    "Zkus mě chytit": 4165,
    "Vrah zavolá v deset": 5681,
    "Zločinný steh": 2565,
}
```
- Zkopíruj si slovník do svého programu.
- Přidej do slovníku nově vydanou detektivku `Noc, která mě zabila`, která zatím nebyla uvedena na trh, je tedy prodáno 0 kusů.
- U knihy `Vrah zavolá v deset` zvyš počet prodaných kusů o 100.
```python
sales = {
    "Zkus mě chytit": 4165,
    "Vrah zavolá v deset": 5681,
    "Zločinný steh": 2565,
}

sales["Noc, která mě zabila"] = 0
sales["Vrah zavolá v deset"] = sales["Vrah zavolá v deset"] + 100

print(sales)
```

**Zadání:** V následujícím slovníku jsou uložena čísla lístků tomboly a příslušné výhry.
```python
tombola = {
    7: "Láhev kvalitního vína Château Headache",
    15: "Pytel brambor z místního družstva",
    23: "Čokoládový dort",
    47: "Kniha o historii města",
    55: "Šiška salámu",
    67: "Vyhlídkový let balónem",
    79: "Moderní televizor",
    91: "Roční předplatné městského zpravodaje",
    93: "Společenská hra Sázky a dostihy",
}
```
- Napište program, který se nejprve zeptá uživatele na číslo jeho lístku. Vstup uživatele si převeďte na int!
- Zkontrolujte, zda je číslo lístku ve slovníku. Pokud ne, vypište text "Bohužel nevyhráváte nic." Pokud číslo ve slovníku je, vypiš uživateli, co vyhrál.
```python
tombola = {
    7: "Láhev kvalitního vína Château Headache",
    15: "Pytel brambor z místního družstva",
    23: "Čokoládový dort",
    47: "Kniha o historii města",
    55: "Šiška salámu",
    67: "Vyhlídkový let balónem",
    79: "Moderní televizor",
    91: "Roční předplatné městského zpravodaje",
    93: "Společenská hra Sázky a dostihy",
}

cislo_listku = int(input("Jaké je Vaše číslo lístku? "))
if cislo_listku in tombola:
    print(f"Gratuluji! Vyhráváte {tombola[cislo_listku]}!")
else:
    print("Bohužel Vaše číslo není výherní.")
```

# cykly
- pracujeme stále se slovníkem, tentokrát s knihami
```python
sales = {
    "Zkus mě chytit": 4165,
    "Vrah zavolá v deset": 5681,
    "Zločinný steh": 2565,
}
```
- cyklus na vypsání všech knih
```python
sales = {
    "Zkus mě chytit": 4165,
    "Vrah zavolá v deset": 5681,
    "Zločinný steh": 2565,
}

for key in sales:
    print(key)
```
- konrétně python narazí na for a ví, že bude pracovat s cyklem, proto se jde podívat za in, s čím bude pracovat - pracovat bude se sales
- jde tedy pracovat na další řádek, kde je print(key), do (key) vytiskne titul Zkus mě chystit a vrátí se zpátky (protože cyklus a protože neprošel celý slovník) a odoplní (key) o Vrah zavolá v deset a pak ze stejného důvodu o Zločinný steh  
  
- pokud si budu chtít vypsat i množství prodejů
```python

sales = {
    "Zkus mě chytit": 4165,
    "Vrah zavolá v deset": 5681,
    "Zločinný steh": 2565,
}

# názvy proměnných (key) si určujeme sami
# do první proměné uloží klíč, do druhé proměnné hodnotu
for key, value in sales.items(): # když dám .items mohu procházet i klíč i hodnotu
    # v proměnné je key je řetězec Zkus mě chytit
    # v proměnné je value je číslo 4165
    print(key)
    print(value) # případně vyšší levec programování: print(f"Titulu {key} bylo prodáno {value} výtisků.")
```

- Pokud chci zjistit kolik celkem prodalo nakladatelství výtisků musím naprogramovat proces sčítání.
```python
sales = {
    "Zkus mě chytit": 4165,
    "Vrah zavolá v deset": 5681,
    "Zločinný steh": 2565,
}

total = 0
for key, value in sales.items(): 
    print(f"Knihy {key} bylo prodáno {value} výtisků.")
    total = total + value
print(f"Celkem bylo prodáno {total} výtisků.")
```
- nebo použiji funkci sum()
```python
sales = {
    "Zkus mě chytit": 4165,
    "Vrah zavolá v deset": 5681,
    "Zločinný steh": 2565,
}

total = 0
for key, value in sales.items(): 
    print(f"Knihy {key} bylo prodáno {value} výtisků.")
total = sum(sales.values())
print(f"Celkem bylo prodáno {total} výtisků.")
```

## dvourozměrné tabulky
- slovník, se kterým nyní pracuji, má v sobě 3 další slovníky (u každé publikace ještě informace o ní)
```python
books = [
    {"title": "Zkus mě chytit", "sold": 4165, "price": 347, "year": 2018},
    {"title": "Vrah zavolá v deset", "sold": 5681, "price": 299, "year": 2019},
    {"title": "Zločinný steh", "sold": 2565, "price": 369, "year": 2019},
]
```
- chci si spočítat celkové tržby nakladatelství
```python
books = [
    {"title": "Zkus mě chytit", "sold": 4165, "price": 347, "year": 2018},
    {"title": "Vrah zavolá v deset", "sold": 5681, "price": 299, "year": 2019},
    {"title": "Zločinný steh", "sold": 2565, "price": 369, "year": 2019},
]

total = 0
for item in books:
    # při prvním běhu bude uložený celý slovník {"title": "Zkus mě ch...}
    # při druhém běhu bude uložený celý slovník {"title": "Vrah zavolá v deset"...}
    # při třetím běhu bude uložený celý slovník {"title": "Zločinný steh"...}
    total = total + item["sold"] * item["price"] # má přednost násobení (jako v matematice)
print(total)
```
- nebo zjistit jen tržby z knih z roku 2019
```python
books = [
    {"title": "Zkus mě chytit", "sold": 4165, "price": 347, "year": 2018},
    {"title": "Vrah zavolá v deset", "sold": 5681, "price": 299, "year": 2019},
    {"title": "Zločinný steh", "sold": 2565, "price": 369, "year": 2019},
]

total = 0
for item in books:
    # při prvním běhu bude uložený celý slovník {"title": "Zkus mě ch...}
    # při druhém běhu bude uložený celý slovník {"title": "Vrah zavolá v deset"...}
    # při třetím běhu bude uložený celý slovník {"title": "Zločinný steh"...}
    if item["year"] >= 2019:
        total = total + item["sold"] * item["price"] # má přednost násobení (jako v matematice)
print(total)
```

## cvičení
**Zadání:** Uvažujme vysvědčení, které máme zapsané jako slovník.
- Napište program, který spočte průměrnou známku ze všech předmětů.
- Upravte program, aby vypsal všechny předměty, ve kterých získal student známku 1.
```python
school_report = {
    "Český jazyk": 1,
    "Anglický jazyk": 1,
    "Matematika": 1,
    "Přírodopis": 2,
    "Dějepis": 1,
    "Fyzika": 2,
    "Hudební výchova": 4,
    "Výtvarná výchova": 2,
    "Tělesná výchova": 3,
    "Chemie": 4,
}
```