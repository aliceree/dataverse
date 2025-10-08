# slovníky

- seznam, krerý navíc obsahuje klíč `key` a hodnotu `value`
- jako `key` mohou sloužit datové typy `int`, `float`, `bool`, `str` a další
- hodnotou `value` může být libovolný datový typ
```python
item = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}
# dictionary = {key: hodnota}
```

- z `dictionary` lze získat jen jednu hodnotu
```python
item = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}

print(f"Vybraný produkt je {item['title']}")
```

- je možné též použít `f-string`, jen je nutné mít uvnitř `[]` jednoduché uvozovky `''`
```python
item = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}

print(f"Vybraný předmět je {item['title']} a stojí {item['price']} Kč.")
```

- k ověření, zda je `key` ve slovníku, slouží operátor `in`
```python
item = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}

if "weight" in item:
    print(item["weight"])
else:
    print("Hmotnost není uvedena.")
```

- s operátorem `in` lze také vyhledávat ve `value` ne jen v `key`
```python
sklad = {"A1": "Čajová konvička s hrnky", "A2": "Zubní kartáček"}

if "Zubní kartáček" in sklad.values():
    print("Zubní kartáček máme skladem.")
else:
    print("Zubní kartáček nemáme skladem.")
```

- vložení nové nebo přepsání stávající položky slovníku
```python
item = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}

item["weight"] = 0.9 # vložení nové položky
item["price"] = 799 # přepsání stávající položky
print(f"Položka váží {item['weight']} a stojí {item['price']} Kč.")
```

- jako `key` slovníku lze používat také proměnnou
```python
item = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}

my_key = "title"
print(item[my_key])
```

- prázdný slovník je možné vytvořit s pomocí `{}`
```python
empty_dict = {}
```

## cvičení
**Zadání:** Vytvořte `dictionary` vysvědčení. `key` slovníku bude název předmětu a `value` známka z daného předmětu. Vypište obsah slovníku pomocí funkce `print()`.
```python
vysvedceni = {"M": 1, "ČJ": 2, "D": 1}

print(f"Z matematiky máte známku: {vysvedceni['M']}.")
```

**Zadání:** Vydavatel detektivek si eviduje prodané kusy u jednotlivých knih. V následujícím slovníku najdete 3 knihy a u každé z nich počet prodaných kusů.
```python
sales = {
    "Zkus mě chytit": 4165,
    "Vrah zavolá v deset": 5681,
    "Zločinný steh": 2565,
}
```
- přidejte do slovníku nově vydanou detektivku `Noc, která mě zabila`, která zatím nebyla uvedena na trh, je tedy prodáno 0 kusů
- u knihy `Vrah zavolá v deset` zvyšte počet prodaných kusů o 100
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
- napište program, který se nejprve zeptá uživatele na číslo jeho lístku (vstup uživatele si převeďte na int!)
- zkontrolujte, zda je číslo lístku ve slovníku
- pokud ne, vypište text "Bohužel Vaše číslo není výherní."
- pokud číslo ve slovníku je, vypište uživateli, co vyhrál
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

- cyklus na vypsání všech knih ve slovníku
```python
sales = {
    "Zkus mě chytit": 4165,
    "Vrah zavolá v deset": 5681,
    "Zločinný steh": 2565,
}

for key in sales:
    print(key)
```
- program si přečte `for`, proto ví, že bude pracovat s cyklem
- jako první se podívá za `in`, s čím konkrétně bude pracovat (pracovat bude se sales)
- jde tedy pracovat na další řádek, kde je `print(key)`
- do `key` uloží titul `Zkus mě chystit` a vrátí se zpátky, protože zatím neprošel celý slovník
- dále odoplní `key` o `Vrah zavolá v deset` a pak i o `Zločinný steh`  
  
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
# Napiš program, který spočte průměrnou známku ze všech předmětů.
average_grade = sum(school_report.values())/len(school_report)
print(average_grade)
# Uprav program, aby vypsal všechny předměty, ve kterých získal student známku 1.
for key,value in school_report.items():
    if value == 1:
        print(key)
```

**Zadání:** Gustav je vášnivým čtenářem detektivek z našeho nakladatelství a navíc si zapisuje knihy, které přečetl. Níže ve slovníku vidíme, jaké informace si eviduje - název knihy, počet stran a hodnocení od 0 do 10.
- Napište program, který spočte celkový počet stran, které Gustav přečetl.
- Připište do programu výpočet počtu knih, kterým dal Gustav hodnocení alespoň 8.
```python
# Napište program, který spočte celkový počet stran, které Gustav přečetl.
# Připište do programu výpočet počtu knih, kterým dal Gustav hodnocení alespoň 8.

books = [
    {"title": "Vražda s příliš mnoha notami", "pages": 450, "rating": 5},
    {"title": "Vražda podle knihy", "pages": 524, "rating": 9},
    {"title": "Past", "pages": 390, "rating": 4},
    {"title": "Popel popelu", "pages": 411, "rating": 10},
    {"title": "Noc, která mě zabila", "pages": 159, "rating": 7},
    {"title": "Vražda, kouř a stíny", "pages": 258, "rating": 6},
    {"title": "Zločinný steh", "pages": 542, "rating": 8},
    {"title": "Zkus mě chytit", "pages": 247, "rating": 7},
    {"title": "Vrah zavolá v deset", "pages": 396, "rating": 6},
]

page_count = 0
favourite_books = 0
for item in books:
    page_count = page_count + item["pages"]
    if item["rating"] >= 8:
        favourite_books = favourite_books + 1

print(f"Gustav celkem přečetl {page_count} stran.")
print(f"Počet knih s hodnocením alespoň 8: {favourite_books}.")
```