- [řetězce](#řetězce)
- [funkce](#funkce)
- [slovníky](#slovníky)
- [objektově orientované programování](#objektově-orientované-programování)

# řetězce
## slicing seznamů a řetězců
= vybírání části (výřezu) z nějaké sekvence

K zaznamenávání množství věnečků sněděných za posledních 7 dní slouží následující zápis.

`venecky = [1, 2, 4, 1, 6, 0, 1]`

### slicing seznamu sněděných věnečků

- `print(venecky[0])` # zobrazí množství věnečků na 1. pozici
- `venecky[5] = 12` # změní číslo na 6. pozici na 12
- `print(venecky[0:3])` # [1, 2, 4] první tři dny
- `print(venecky[:5])` # [1, 2, 4, 1, 6] od PO do PÁ
- `print(venecky[2:])` # [4, 1, 6, 0, 1] od ST do konce
- `print(venecky[::2])` # [1, 4, 6, 1] každý druhý den
- `print(venecky[::-1])` # [1, 0, 6, 1, 4, 2, 1] opačně
- `print(venecky[1:6:2])` # [2, 1, 0] ÚT, ČT, SO

### vybrané funkce pro seznamy

- `len()` # vrátí délku seznamu
- `sum()` # vrátí součet všech prvků v seznamu
- `min()` # vrátí nejmenší prvek seznamu
- `max()` # vrátí největší prvek seznamu
- `sorted()` #vrátí setříděný seznam

### řetězce se v něčem chovají podobně jako seznamy

```python
jmeno = "martin" + " " + "podlucký"
```

- `print(jmeno)` # 'martin podlucký'
- `print(jmeno[0:6])` # 'martin' prvních 6 znaků
- `print(jmeno[7:])` # 'podlucký' od mezery dál
- `print(jmeno[:])` # 'martin podlucký' celý řetězec
- `print(jmeno[::-1])` # 'ýkculdop niram' opačně
- `print(jmeno[::2])` # 'mrt oduký' každý druhý znak

Podobně jako u seznamů funguje také **funkce** `len()`.
```python
print(len(jmeno))
```

Lze též zkotrolovat, zda se nějaký řetězec nachází v jiném řetězci s pomocí operátoru `in`.
```python
inzerat = "Na této pracovní pozici budete využívat Python a SQL."

if "Python" in inzerat:
    print("Je to pro mě!")
```

Podobně lze využít i operátor `not in` vracející opačná výsledeků.
```python
email = "spatny-mail.cz"
if "@" not in email:
    print("V e-mailu chybí zavináč!")
```

## metody pro řetězce
= způsob analýzy řetězce
```python
print("martin".upper()) # všechna písmena verzálkama  
print("   martin   ".strip()) # odstraní mezery navíc  
print("po út st čt pá".split(" ")) # rozseká řetězec na kouskly dle zadaného oddělovače `sep`.  
print("+".join(["1", "2", "3", "4"])) # spojí řetězce v seznamu `list` do jednoho velkého řetězce
```

Metoda `replace(old, new)` funguje jako "najít a nahradit".
```python
text = "Kurz vede lektor Marek"
novy_text = text.replace("Marek", "Martin") # Vypíše Kurz vede lektor Martin
print(novy_text)
```

Metoda `append()` přidává novou položku na již existující seznam.
```python
guest_list = ["Jirka", "Klára", "Natálie"]
print(guest_list[-1]) # vypíše Natálie  
guest_list.append("Adéla")
print(guest_list[-1]) # vypíše Adéla
```

# funkce
- kromě předefinovaných funkcí
```python 
cele_cislo = round(12.34567)
print(cele_cislo)
```
- si mohu definovat funkci vlastní
```python
def greet_user():
   print("Ahoj Alice!")
greet_user()
``` 

- navíc lze funkci rozšířit o f-string
- f-string umožňuje vložení proměnné do textu
```python
def greet_user(name): 
    print(f"Ahoj {name}!")
greet_user("Alice")
greet_user("Richarde")
```
Použití f-stringu `f` a `{}` ulehčuje práci s textem a výsledkem funkce. Všechno, co je uvnitř složených závorek, se vyhodnotí jako Python výraz a dosadí do výsledného řetězce. Bez `f` by Python závorky nevnímal a vypsal by je doslova, nebo by bylo zapotřebí spojovat řetězce pomocí + nebo čárkami.  

- jazyková mutace pozdravu
```python
def greet_user(language_code):
    if language_code == 'cs':
        print("Ahoj!")
    elif language_code == 'de':
        print("Hallo!")
    else:
        print("Hello!")
greet_user('cs')
greet_user('fr') # vypíše Hello!
``` 

- kromě vypisování výše, lze po funkci požadovat nějaký výstup
- např. hodnotu, kterou má vrátit díky klíčovému slovu `return`
```python
def sum_two_numbers(a, b):
    result = a + b
    return result
print(sum_two_numbers(1, 1))
```

## fuknce kódu
Může se stát, že je evidentní potřeba nějaké funkce, ale zatím není protstor proto ji naprogramovat, pro takový případ slouží funkce `pass`.  
```python
def code_me_later(par1, par2):
    pass
```

## dělení
Konkrétní příklad dělení se zadáním dělence a dělitele.  
```python
def divide_two_numbers(a, b):
    if b == 0:
        return None
    else:
        return a / b
a = float(input("Zadej dělenec: "))
b = float(input("Zadej dělitel: "))
result = divide_two_numbers(a, b)
print("Výsledek dělení je:", result)
```

### cvičení
**Zadání:** Napište funkci `mult`, která bude mít dva číselné parametry. Funkce oba parametry vynásobí a vrátí výsledek.  
```python
def mult(a, b):
    return a * b
print(mult(1, 1))
```

**Zadání:** Vytvořte funkci `km_na_mile`, které převede kilometry na míle.  
```python
def kilometry_na_mile(kilometry):
    return kilometry * 0.621
print(f'10 miles is {kilometry_na_mile(10)} kilometers.')
``` 

**Zadání:** Vytvořte funkci `month_of_birth` s parametrem `birth_number`, která z rodného čísla vyčte měsíc narození.  

Varianta pro muže:  
```python
def month_of_number(birth_number):
    result = str(birth_number)[2:4]
    return int(result)
print(month_of_number(9207054439))
```

Pro ženy i muže:  
```python
def month_of_birth(birth_number):
    month = int(str(birth_number)[2:4])
    if month > 50:
        month - 50
    return month
print(month_of_birth(9207054439))
```

Navíc obohacené o f-string:  
```python
def month_of_birth(birth_number):
    month = int(str(birth_number)[2:4])
    if month > 50:
        month - 50
    return f'Month of birth is {month}.'
print(month_of_birth(9207054439))
```

# slovníky
- seznam, krerý navíc obsahuje klíč `key` a hodnotu `value`
- jako `key` mohou sloužit datové typy `int`, `float`, `bool`, `str` a další
- hodnotou `value` může být libovolný datový typ
```python
deco = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}
# dictionary = {key: value}
# celá dvojice {key: value} je item
```

- z `dictionary` lze získat jen jednu hodnotu
```python
deco = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}

print(f"Vybraný produkt je {deco['title']}")
```

- je možné též použít `f-string`, jen je nutné mít uvnitř `[]` jednoduché uvozovky `''`
```python
deco = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}

print(f"Vybraný předmět je {deco['title']} a stojí {deco['price']} Kč.")
```

- k ověření, zda je `key` ve slovníku, slouží operátor `in`
```python
deco = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}

if "weight" in deco:
    print(deco["weight"])
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
deco = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}

deco["weight"] = 0.9 # vložení nové položky
deco["price"] = 799 # přepsání stávající položky
print(f"Položka váží {deco['weight']} a stojí {deco['price']} Kč.")
```

- jako `key` slovníku lze používat také proměnnou
```python
deco = {"title": "Čajová konvička s hrnky", "price": 899, "in_stock": True}

my_key = "title"
print(deco[my_key])
```

- prázdný slovník je možné vytvořit s pomocí `{}`
```python
empty_dict = {}
```

### cvičení
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

## slovníky a cykly
- syntax cyklu pro vypsání všech položek `dictionaries`
```python
for key in sales:
    print(key)
```
- program si přečte `for`, proto ví, že bude pracovat s cyklem
- jako první se podívá za `in`, s čím konkrétně bude pracovat (pracovat bude se sales)
- jde tedy pracovat na další řádek, kde je `print(key)`
- do `key` uloží titul `Zkus mě chystit` a vrátí se zpátky, protože zatím neprošel celý slovník
- dále odoplní `key` o `Vrah zavolá v deset` a pak i o `Zločinný steh`
```python
sales = {
    "Zkus mě chytit": 4165,
    "Vrah zavolá v deset": 5681,
    "Zločinný steh": 2565,
}

for key in sales: # pro každý klíč ve slovníku sales..
    print(key) # ..vytiskni znění tohoto klíče
```

- pro vypsání navíc prodejů slouží `.items()` (ve skutečnosti tam, kde je použito jen `sales` bez metody `.items()`, python automaticky volá metodu `sales.keys()`)
```python
sales = {
    "Zkus mě chytit": 4165,
    "Vrah zavolá v deset": 5681,
    "Zločinný steh": 2565,
}

for key, value in sales.items(): # pro každou dvojici klíče a hodnoty ve slovníku sales..
    print(f"Titulu {key} bylo prodáno {value} výtisků.") # ..vytiskni tuto větu obohacenou o klíč a hodnotu
```

### sčítání
- pro výpočet celkových prodejů nakladetelství mohu naprograovat operaci sčítání
```python
sales = {
    "Zkus mě chytit": 4165,
    "Vrah zavolá v deset": 5681,
    "Zločinný steh": 2565,
}

total = 0 # vytvoření proměnné total a pro každou knihu do ní přičteme počet prodaných kusů
for key, value in sales.items(): 
    print(f"Knihy {key} bylo prodáno {value} výtisků.")
    total = total + value
print(f"Celkem bylo prodáno {total} výtisků.")
```
- místo programování operace sčítání lze také využít funkce `sum()`
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
- slovník, který v sobě může mít několik dalších slovníků
- např. `dictionary` jako název publikace a `items` informace o publikaci
```python
books = [
    {"title": "Zkus mě chytit", "sold": 4165, "price": 347, "year": 2018},
    {"title": "Vrah zavolá v deset", "sold": 5681, "price": 299, "year": 2019},
    {"title": "Zločinný steh", "sold": 2565, "price": 369, "year": 2019},
]
```

- celkové třžby nakladatelství
```python
books = [
    {"title": "Zkus mě chytit", "sold": 4165, "price": 347, "year": 2018},
    {"title": "Vrah zavolá v deset", "sold": 5681, "price": 299, "year": 2019},
    {"title": "Zločinný steh", "sold": 2565, "price": 369, "year": 2019},
]

total = 0
for item in books:
    total = total + item["sold"] * item["price"] # * / má přednost před + -
print(f"Celkové tržby nakladatelství jsou: {total} Kč.")
```

- celkové tržby nakladatelství z roku 2019
```python
books = [
    {"title": "Zkus mě chytit", "sold": 4165, "price": 347, "year": 2018},
    {"title": "Vrah zavolá v deset", "sold": 5681, "price": 299, "year": 2019},
    {"title": "Zločinný steh", "sold": 2565, "price": 369, "year": 2019},
]

total = 0
for item in books:
    if item["year"] >= 2019:
        total = total + item["sold"] * item["price"]
print(f"Celkové tržby nakladatelství za rok 2019 jsou: {total} Kč.")
```

### cvičení
**Zadání:** Napište program, který spočítá průměrnou známku ze všech předmětů. Dále jej doplňte o to, aby vypsal všechny předměty, ve kterých získal student známku 1.
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
average_grade = sum(school_report.values())/len(school_report)
print(f"Průměr Vašeho vysvědčení je: {average_grade}.")
for key,value in school_report.items():
    if value == 1:
        print(f"Známku 1 máte z předmětu: {key}")
```

**Zadání:** Gustav je vášnivým čtenářem detektivek z našeho nakladatelství a navíc si zapisuje knihy, které přečetl. Níže ve slovníku vidíme, jaké informace si eviduje (název knihy, počet stran a hodnocení od 0 do 10).
- napište program, který spočítá celkový počet stran, které Gustav přečetl
- připište do programu výpočet počtu knih, kterým dal Gustav hodnocení alespoň 8
```python
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

# objektově orientované programování

## objekty a třídy
- základ OOP je užití tříd a objektů
- vztah mezi objekty a třídami lze připodobnit formuláři (objekt) a jeho kolonkám (třídám)
- objekty jsou na sobě nezávislé (encapsulation), úprava jednoho neovlivní druhý
- třídy mají atributy (v nich uchováváme hodnoty) a metody (vykonávají příkazy)
- název třídy, je vždy s velkým písmenem
- konkrétní názvosloví v OOP:

![názvosloví](<Python OOP Terminology.jpeg>)

## metoda `__innit__`
- stará se o vytvoření objetu a nastavení hodnot jeho atributů
- paramety `self`, `name`, `position` a `holiday_entitlement` budou hodnotami, které budeme zadávat při vytváření nového objektu
- se `self` přistupujeme k atributům objektu
- `self.name` je atribut objektu, který může být ve všech metodách
```python
class Employee:
    def __init__(self, name, position, holiday_entitlement):
        self.name = name
        self. position = position
        self.holiday_entitlement = holiday_entitlement

    def get_info(self):
        return f"Zaměstanec {self.name} pracuje na pozici {self.position} může čerpat dovolenou v rozsahu {self.holiday_entitlement} dnů."

teo = Employee("Teodor Will", "designér", 25)
greta = Employee("Gréta Still", "ajťačka", 25)
print(teo.get_info())
print(greta.get_info())
```

### cvičení

**Zadání:** Návrh software pro zásilkovou společnost.
- Vytvořte třídu `Package`, která bude mít tři atributy `address`, `weight` a `state`
- Vytvořte metodu `__init__`, která uloží hodnoty parametrů metody do atributů.
- Přidejte metodu `get_info()`, která vrátí informace o balíku jako řetězec. Například větu "Balík na adresu Krakovská 583/9, Praha má hmotnost 0.25 kg je ve stavu nedoručen".
- Vytvořte alespoň dva objekty ze třídy `Balik`. U `address` bude datový typ řetězec `str`, u `weight` desetinné číslo. U atributu `state` zadávejte pro zjednodušení pouze dva stavy: doručen a nedoručen.
- Vypište informace, které generuje metoda `get_info()`, na obrazovku, a ověřte, že je vše v pořádku.
- Nakonec vytvořte metodu `delivery_price()`, která vypočítá cenu přepravy balíku. Cena přepravy je daná hmotností balíku. Do 10 kg je 129 Kč, od 10 kg do 20 kg je 159 Kč a pro balíky těžších než 20 kg je 359 Kč. Metoda spočítá cenu a vrátí ji jako číslo.
```python
class Package:
    def __init__(self, address, weight, state):
        self.address = address
        self.weight = weight
        self.state = state

    def delivery_price(self):
        if self.weight < 10:
            return 129
        elif self.weight < 20:
            return 159
        else:
            return 359

    def get_info(self):
        return f"Balík na adresu {self.address} má hmotnost {self.weight} kg, cena za jeho dopravu je {self.delivery_price()} a momentálně je ve stavu {self.state}."
    
balik = Package("Krakovksá 583/9, Praha", 11, "doručen")
balik2 = Package("Vinohradská 1234/45, Praha", 2.5, "nedoručen")
print(balik.get_info())
```

**Zadání:** Vytvořte pro nakladatelství software s využitím tříd a objektů. Vytvořte třídu Book, která reprezentuje knihu. Každá kniha bude mít atributy `title`, `pages` a `price`. Hodnoty nastavte ve funkci `__init__`.
- Přidejte knize funkci `get_info()`, která vypíše informace o knize v nějakém pěkném formátu.
- Přidejte metodu `get_time_to_read()`. Metoda vrátí čas potřebný na přečtení knihy v hodinách. S využitím atributu `pages` vypočítejte čas na přečtení knihy. Metoda bude mít nepovinný parametr, který udává počet minut potřebných pro přečtení jedné stránky knihy. Dobu potřebnou na přečtení knihy získáte jako násobek doby potřebné na přečtení jedné stránky knihy a počet stránek knihy. Výchozí hodnota nepovinného parametru je 4.

```python
class Book:
    def __init__(self, title, pages, price):
        self.title = title
        self.pages = pages
        self.price = price
    
    def get_info(self):
        return f"Kniha {self.title} má {self.pages} stran a lze ji zakoupit za {self.price} Kč."
    
    def get_time_to_read(self, minutes_per_page=4):
        time_hours = self.pages * minutes_per_page / 60
        return f"Čtením této knihy strávíte {time_hours} hodin."
    
kniha = Book("Nesnesitelná lehkost bytí", 342, 343)
print(kniha.get_info())
print(kniha.get_time_to_read())
print(f"Při pomalejším čtení za {kniha.get_time_to_read(5)} hodin.")
```

## metoda `__str__`
```python
class Employee:
    def __init__(self, name, position, holiday_entitlement):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement

    def get_info(self):
        return f"Zaměstnanec {self.name} pracuje na pozici {self.position}."

    def take_holiday(self, days):
        if self.holiday_entitlement >= days:
            self.holiday_entitlement -= days
            return f"Hezkou dovolenou!."
        else:
            return f"Bohužel už máš nárok, jen na {self.holiday_entitlement} dnů."

teo = Employee("Teodor Will", "designér", 25)

print(teo.take_holiday(5)) # vypíše Hezkou dovolenou!
print(teo.take_holiday(15)) # vypíše Hezkou dovolenou!
print(teo.take_holiday(10)) # vypíše Bohužel už nemáš nárok, jen na 5 dnů.
print(teo) # vypíše <__main__.Employee object at 0x1043cdfd0>
```
- funkce `print()` se pokouší převést objekt na řetězec (viz. `print(teo)`)
- naše třída ale nemá tuto funkci neprogramovanou, takže Python vezme standartní formát, který říká, že jde o objekt třídy `Employee` a kde je uložený v paměti
- převod na řetězec lze zařídit metodou `__str__`
- Python využije metodu `__str__` vždy, když je vyzván k přvodu objetu na řetězec 
```python
class Employee:
    def __init__(self, name, position, holiday_entitlement):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement

    def __str__(self):
        return f"Zaměstnanec {self.name} pracuje na pozici {self.position}."

    def take_holiday(self, days):
        if self.holiday_entitlement >= days:
            self.holiday_entitlement -= days
            return f"Užij si to."
        else:
            return f"Bohužel už máš nárok jen na {self.holiday_entitlement} dní."

teo = Employee("Teodor Will", "designér", 25)
print(teo)
```

### cvičení

**Zadání:** U třídy Package přejmenujte metodu `get_info()` na `__str__()` a vyzkoušejte jestli nyní stačí k získání informací o balíku funkce `print()`.
- Přidejte metodu `deliver()`. Půjde o obdobu tlačítka, které řidič/ka zmáčkne při doručení balíku a zaznamená tak jeho doručení. Metoda nejprve zkontroluje, zda balík náhodou již není ve stavu doručen. Pokud ano, metoda vrátí zprávu "Balík již byl doručen". Tím bude řidič/ka informován/a o tom, že se pravděpodobně spletl/a a snaží se zaznamenat doručení u špatného balíku. Pokud balík není ve stavu doručen, změňte jeho stav právě na doručen a vraťte zprávu "Doručení uloženo".
- Vyzkoušejte metodu `deliver()`. Co se stane, pokud ji u jednoho balíku zavoláte dvakrát?
```python
class Package:
    def __init__(self, address, weight, state):
        self.address = address
        self.weight = weight
        self.state = state

    def __str__(self):
        return f"Balík na adresu {self.address} má hmotnost {self.weight} kg je ve stavu {self.state}"
    
    def delivery_price(self):
        if self.weight < 10:
            return 129
        elif self.weight <= 20:
            return 159
        else:
            return 359
        
    def deliver(self):
        if self.state == "dorucen":
            return "Balík již byl doručen"
        elif self.state == "nedorucen":
            self.state = "dorucen"
            return "Doručení uloženo"

balik = Package ("U potoka 134/12", 25.0, "nedorucen")
print(balik)
print(balik.deliver())
print(balik)
print(balik.deliver())
print(balik)
```

**Zadání:** Vraťme se k práci se třídou `Book`.
- U knihy chceme evidovat, kolik kusů bylo prodáno.
- Přidejte atribut `sold`, jehož hodnotu bude možné nastavit v metodě `__init__()`. Dále přidejte atribut `costs`, které představují náklady na jednu knihu (např. tisk, doprava do knihkupectví, podíl autora (autorky) atd.).
- Přidejte metodu `profit()`, která vrátí celkový zisk z knihy. Zisk vypočítáte na základě vzorce: `prodané kusy * (cena - náklady)`.
- Přidejte metodu `rating()`, která vrátí hodnocení knihy na základě jejího zisku. Pokud bude zisk méně než 50 tisíc, vraťte hodnotu "propadák". Pokud bude zisk mezi 50 tisíc a 500 tisíc, vrať hodnotu "průměr". Pokud bude vyšší než 500 tisíc, vrať hodnotu "bestseller".

```python
class Book:
    def __init__(self, title, pages, price, sold, costs):
        self.title = title
        self.pages = pages
        self.price = price
        self.sold = sold
        self.costs = costs
    
    def get_info(self):
        return f"Kniha {self.title} má {self.pages} stran a lze ji zakoupit za {self.price} Kč."
    
    def profit(self):
        book_profit = self.sold * (self.price - self.costs)
        return f"Zisk z knihy {self.title} je {book_profit} Kč."
    
    def rating(self):
        sales = int(input("Kolik výtisků se prodalo? "))
        if sales < 50000:
            return "Tak to je propadák."
        elif sales < 500000:
            return "Tak to je průměr."
        else:
            return "Tak to je bestseller!"

        
kniha = Book("Nesnesitelná lehkost bytí", 342, 343, 53000, 132)
print(kniha.profit())
print(kniha.rating())
```

**Zadání:** Vytvořte program pro evidenci aut malé autopůjčovny. Půjčovna má 2 automobily:
| Registrační značka | Značka a typ vozidla | Počet najetých kilometrů |
|---------------------|----------------------|---------------------------|
| 4A2 3020            | Peugeot 403 Cabrio   | 47 534                    |
| 1P3 4747            | Škoda Octavia        | 41 253                    |
Vytvořte třídu `Car`, která bude obsahovat informace o autech, které půjčovna nabízí. Třída bude mít tyto atributy:
- registrační značka automobilu,
- značka a typ vozidla,
- počet najetých kilometrů,
- informaci o tom, jestli je vozidlo aktuálně volné (pravdivostní hodnota `True` pokud je volné a `False` pokud je vypůjčené).
Vytvořte funkci `__init__` pro třídu `Car`. Registrační značku, značku a typ vozidla a počet kilometrů získejte jako parametry funkce `__init__` a uložte je jako atributy objektu. Poslední atribut nastavte jako `True`, tj. na začátku je vozidlo volné.

Vytvořte objekty, které reprezentují všechny automobily půjčovny.

```python
class Car:
    def __init__(self, SPZ, car_brand, miles_driven, availability=True):
        self.SPZ = SPZ
        self.car_brand = car_brand
        self.miles_driven = miles_driven
        self.availability = availability
    
    def rent_car(self):
        if self.availability == True:
            self.availability = False
            return f"Potvrzuji zapůjčení vozidla."
        else:
            return f"Vozidlo není k dispozici."
        
    def __str__(self):
        return f"Automobil {self.car_brand} má SPZ {self.SPZ} a je {'k dispozici' if self.availability else 'nedostupný'}."
    
def user_input():
    if user_choice == Car1.car_brand:
        print(Car1.rent_car())
    elif user_choice == Car2.car_brand:
        print(Car2.rent_car())
    else:
        print("Taková značka není k dispozici.")
    
user_choice = input("Zadejte značku vozidla, které si přeješ vypůjčit: ")

Car1 = Car("4A2 3020", "Peugeot", 47534, True)
Car2 = Car("1P3 4747", "Škoda", 41253, True)

user_input()
print(Car2)
print(Car1)
```

## dědičnost
- slouží k vytvoření další třídy, jejíž některé metody bere z dříve vytvořené a tedy úplně jiné třídy (např. `Employee` a `Manager`)
- s pomocí `super().__init__` odkážu na atriuty zmíněné již v super (matěřské) třídě

```python
class Employee:
    def __init__(self, name: str, position, holiday_entitlement):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
   
    def __str__(self):
        return f"Zaměstnanec {self.name} pracuje na pozici {self.position}."
   
    def take_holiday(self, days):
        if self.holiday_entitlement >= days:
            self.holiday_entitlement -= days
            return "Schváleno"
        else:
            return "Na tolik dní nemáš nárok"
        
class Manager(Employee):
    def __init__(self, name: str, position, holiday_entitlement, subordinates):
        super().__init__(name, position, holiday_entitlement)
        self.subordinates = subordinates

frantisek = Employee("František Novák", "konstruktér", 25)
klara = Employee("Klára Nová", "konstruktérka", 25)
marian = Manager("Marian Přísný", "vedoucí", 25, 2)
print(marian.name)
print(marian)
```

- dědit lze i uvnitř metody
```python
class Employee:
    def __init__(self, name: str, position, holiday_entitlement):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
   
    def __str__(self):
        return f"Zaměstnanec {self.name} pracuje na pozici {self.position}."
   
    def take_holiday(self, days):
        if self.holiday_entitlement >= days:
            self.holiday_entitlement -= days
            return "Schváleno"
        else:
            return "Na tolik dní nemáš nárok"
        
class Manager(Employee):
    def __init__(self, name: str, position, holiday_entitlement, subordinates, car):
        super().__init__(name, position, holiday_entitlement)
        self.subordinates = subordinates
        self.car = car

    def __str__(self):
        text = super().__str__()
        return f"{text} Má {self.subordinates} podřízené."

frantisek = Employee("František Novák", "konstruktér", 25)
klara = Employee("Klára Nová", "konstruktérka", 25)
marian = Manager("Marian Přísný", "vedoucí", 25, 2, "Škoda Octavia")
print(marian)
```

### cvičení

**Zadání:** Pokračujte ve své práci pro zásilkovou společnost. Společnost nově doručuje i cenné balíky, které mají zadanou určitou hodnotu.
- Vytvořte třídu `ValuablePackage`, která dědí od třídy `Package`. `ValuablePackage` má navíc atribut `value`, ostatní atributy dědí od třídy `Package`.
- Atribut `value` nastavte pomocí funkce `__init__`. Ostatní parametry předejte funkci `__init__` třídy `Package`.
- Přidejte do výpisu informací o cenném balíku (metoda `__str__`) informaci o ceně balíku.
- Vytvořte si alespoň jeden objekt a zkuste volání jeho metod. Současně si vytvořte "obyčejný" balík o zkontrolujte, že u něj se nic nezměnilo.
```python
class Package:
    def __init__(self, address, weight, state):
        self.address = address
        self.weight = weight
        self.state = state

    def __str__(self):
        return f"Balík na adresu {self.address} má hmotnost {self.weight} kg je ve stavu {self.state}."
    
    def delivery_price(self):
        if self.weight < 10:
            return 129
        elif self.weight <= 20:
            return 159
        else:
            return 359
        
    def deliver(self):
        if self.state == "doručen":
            return "Balík již byl doručen."
        elif self.state == "nedoručen":
            self.state = "doručen"
            return "Doručení uloženo."

class ValuablePackage(Package):
    def __init__(self, address, weight, state, value):
        super().__init__(address, weight, state)
        self.value = value

    def __str__(self):
        text = super().__str__()
        return f"{text} Cena tohoto balíku je {self.value} Kč."

balik = Package ("U potoka 134/12", 25.0, "nedoručen")
lepsi_balik = ValuablePackage ("Lesní 356/1", 20.0, "doručen", 10)
print(balik)
print(lepsi_balik)
```

**Zadání:** Pokračujte ve své práci pro zásilkovou společnost. Společnost nově požaduje, aby náš software uměl dopočítat cenu přepravy balíku.

U cenných balíků bude k ceně připočteno pojištění. Přidej ke třídě ValuablePackage metodu delivery_price(). Ta spočítá cenu přepravy s využitím metody mateřské třídy Package, kterou jsme vytvořili v předchozí lekci. K tomu připočte pojistné ve výši 5 % ceny balíku.

```python
    def delivery_price(self):
        price = super().delivery_price() * 1.05
        return f"Cena balíku s pojištěním je {price} Kč."

balik = Package ("U potoka 134/12", 25.0, "nedorucen")
lepsi_balik = ValuablePackage ("U potoka 134/12", 25.0, "nedorucen", 10)
print(lepsi_balik.delivery_price())
```

**Zadání:** Nyní je naším cílem práce pro společnost, která se zabývá prodejem jízdenek a letenek.
- Vytvořte třídu `Ticket`, která bude mít atributy `basic_price` (základní cena) a `seat_number` (číslo sedadla). Tato třída bude sloužit například pro cesty autobusem.
- Při cestování vlakem musíme řešit, jestli cestující využívá 1. nebo 2. třídu. Vytvořte třídu `TrainTicket`, která bude mít navíc atribut `fare_class` (uvažujeme možnosti economy a business). Dále naprogramujte metodu `get_price()`, která bude vracet hodnotu stejnou jako `basic_price`, pokud atribut `fare_class` je economy, a cenu o 30 % vyšší oproti `basic_price`, pokud `fare_class` je business.
- U letenek řešíme třídu, kterou cestující letí, navíc ale musíme řešit i počet odbavených zavazadel. Vytvoř třídu `PlaneTicket`, která bude dědit od třídy `TrainTicket` a bude mít navíc atribut `checkout_luggages`, který udává počet odbavených zavazadel. Naprogramuj metodu `get_price()`, která bude vracet hodnotu stejnou jako `basic_price`, pokud atribut `fare_class` je economy, a cenu o 50 % vyšší oproti `basic_price`, pokud `fare_class` je business. Dále připočítejte 2000 za každé odbavené zavazadlo (bez ohledu na třídu).
- Vytvořte jízdenku na vlak se základní cenou 150 do tříd economy i business. Zkontrolujte, jakou hodnotu vrací metoda `get_price()`.
- Vytvoř letenku se základní cenou 6000 do tříd economy i business s jedním odbaveným zavazadlem. Zkontrolujte, jakou hodnotu vrací metoda `get_price()`.
Vyzkoušejte vypočítat celkovou cenu dvou jízdenek různého typu, tj. jedné letenky a jedné jízdenky na vlak. Celkovou cenu uložte do proměnné `total_price` a k výpočtu použijte metodu `get_price()`.

```python
class Ticket: # jízdy autobusem
    def __init__(self, basic_price, seat_number):
        self.basic_price = basic_price
        self.seat_number = seat_number
    
    class TrainTicket(Ticket):
        def __init__(self, basic_price, seat_number, fare_class):
            super
```

## datové třídy
- `dataclass` si vytvoří obsah metody samy

```python
from dataclasses import dataclass

@dataclass
class Employee:
    name: str
    position: str
    holiday_entitlement: int

    def __str__(self):
        return f"Zaměstnanec {self.name} pracuje na pozici {self.position}."
   
    def take_holiday(self, days):
        if self.holiday_entitlement >= days:
            self.holiday_entitlement -= days
            return "Schváleno"
        else:
            return "Na tolik dní nemáš nárok"

@dataclass        
class Manager(Employee):
    subordinates: int
    car: str

    def __str__(self):
        text = super().__str__()
        return f"{text} Má {self.subordinates} podřízené."

frantisek = Employee("František Novák", "konstruktér", 25)
klara = Employee("Klára Nová", "konstruktérka", 25)
marian = Manager("Marian Přísný", "vedoucí", 25, 2, "Škoda Octavia")
print(frantisek.take_holiday(20))
print(marian)
```

## funkce pro práci s objekty

## isinstance()
- zkontroluje, jestli daný objekt patří ke konkrétní třídě (nebo její podtřídě)
```python
class Employee:
    def __init__(self, name: str, position, holiday_entitlement):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
        
class Manager(Employee):
    def __init__(self, name: str, position, holiday_entitlement, subordinates, car):
        super().__init__(name, position, holiday_entitlement)
        self.subordinates = subordinates
        self.car = car

marian = Manager("Marian", "vedoucí konstrukčního oddělení", 25, 5, "Škoda Octavia")
frantisek = Employee("František", "konstruktér", 20)

if isinstance(frantisek, Manager):
    print(f"{frantisek.name} pochází ze třídy Manager.")
else:
    print(f"{frantisek.name} nepochází ze třídy Manager.")
```

- pokud firma pořádá školení pro managery a potřebuje jim poslat pozvánku
```python
class Employee:
    def __init__(self, name: str, position, holiday_entitlement):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
        
class Manager(Employee):
    def __init__(self, name: str, position, holiday_entitlement, subordinates, car):
        super().__init__(name, position, holiday_entitlement)
        self.subordinates = subordinates
        self.car = car

marian = Manager("Marian Přísný", "vedoucí konstrukčního oddělení", 25, 5, "Škoda Octavia 1.5 TSI")
marketa = Manager("Markéta", "teamleader", 25, 12, "Škoda Octavia RS")
frantisek = Employee("František Novák", "konstruktér", 25)
objekty = [marian, frantisek, marketa]
for polozka in objekty:
    if isinstance(polozka, Manager):
        print(f"Pozvánka pro: {polozka.name}")
```

- pokud firma potřebuje evidovat množství lidí, kteří na školení přijdou
```python
class Employee:
    def __init__(self, name: str, position, holiday_entitlement):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
        
class Manager(Employee):
    def __init__(self, name: str, position, holiday_entitlement, subordinates, car):
        super().__init__(name, position, holiday_entitlement)
        self.subordinates = subordinates
        self.car = car

marian = Manager("Marian Přísný", "vedoucí konstrukčního oddělení", 25, 5, "Škoda Octavia 1.5 TSI")
marketa = Manager("Markéta Polková", "teamleader", 25, 12, "Škoda Octavia RS")
frantisek = Employee("František Novák", "konstruktér", 25)
objekty = [marian, marketa, frantisek]
expected_people = 0
for polozka in objekty:
    if isinstance(polozka, Manager):
        print(f"Pozvánka pro: {polozka.name}")
        expected_people += 1
print(f"Čekáme {expected_people} osob.")
```

## hasattr
- nám umožňuje zkontrolovat, zda má nějaký objekt atribut nebo metodu daného jména
```python
class Employee:
    def __init__(self, name: str, position, holiday_entitlement):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
        
class Manager(Employee):
    def __init__(self, name: str, position, holiday_entitlement, subordinates, car):
        super().__init__(name, position, holiday_entitlement)
        self.subordinates = subordinates
        self.car = car

class Salesman(Employee):
    def __init__(self, name: str, position, holiday_entitlement, car):
        super().__init__(name, position, holiday_entitlement)
        self.car = car

marian = Manager("Marian Přísný", "vedoucí konstrukčního oddělení", 25, 5, "Škoda Octavia 1.5 TSI")
marketa = Manager("Markéta Polková", "teamleader", 25, 12, "Škoda Octavia RS")
frantisek = Employee("František Novák", "konstruktér", 25)
jakub = Salesman("Jakub", "obchodní zástupce", 25, "Škoda Superb")
objekty = [marian, marketa, frantisek, jakub]

for polozka in objekty:
    if hasattr(polozka, "car"):
        print(f"{polozka.name} má auto {polozka.car}.")
```

## getattr
- funkce umožňuje získat hodnotu atributu objektu na základě jeho názvu
- např. když chci zjistit jaké má daný zaměstnanec auto
```python
class Employee:
    def __init__(self, name: str, position, holiday_entitlement):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
        
class Manager(Employee):
    def __init__(self, name: str, position, holiday_entitlement, subordinates, car):
        super().__init__(name, position, holiday_entitlement)
        self.subordinates = subordinates
        self.car = car

class Salesman(Employee):
    def __init__(self, name: str, position, holiday_entitlement, car):
        super().__init__(name, position, holiday_entitlement)
        self.car = car

marian = Manager("Marian Přísný", "vedoucí konstrukčního oddělení", 25, 5, "Škoda Octavia 1.5 TSI")
marketa = Manager("Markéta Polková", "teamleader", 25, 12, "Škoda Octavia RS")
frantisek = Employee("František Novák", "konstruktér", 25)
jakub = Salesman("Jakub", "obchodní zástupce", 25, "Škoda Superb")
atribut = input("Zadej atribut: ")

print(getattr(marketa, atribut))
```

### cvičení

**Zadání:** Pokračujte ve své práci pro zásilkovou společnost. Společnost chce doplnit do aplikace funkci pro výpočet celkového hodnoty nákladu nějakého auta, aby pak (např. v případě nehody nebo krádeže) mohla snadno spočítat celkovou hodnotu cenných balíků v autě a předat informaci pojišťovně. Příklad je podobný bonusu na výpočet celkové hmotnosti z předchozí části, liší se ale v tom, že hodnotu mají pouze cenné balíky, zatímco hmotnost mají všechny balíky.

Níže je příklad balíků, které lze použít pro tvorbu svého programu.

```python
package_1 = ValuablePackage("Grimmauldovo náměstí 11", 1.9, "nedoručen", 5500)
package_2 = Package("Godrikův důl 47", 1.9, "nedoručen")
package_3 = ValuablePackage("Vydrník svatého Drába 13", 1.9, "nedoručen", 5500)
package_list = [package_1, package_2, package_3]
```

- Vytvoř si proměnnou `total_value`, do které si s využitím cyklu budeš ukládat celkovou hodnotu všech balíků. Na začátku bude mít hodnotu 0.
Vytvoř cyklus, který projde seznam `package_list`.
Vyber funkci, která je podle tebe nejvhodnější pro zajištění bezpečného čtení atributu value. Můžeš použít funkci `isinstance()`, `hasattr()` i `getattr()`. Přičti hodnotu balíku k proměnné `total_value`, aniž by program skončil chybou u objektu `package_2`.

```python
class Package:
    def __init__(self, address, weight, state):
        self.address = address
        self.weight = weight
        self.state = state

    def __str__(self):
        return f"Balík na adresu {self.address} má hmotnost {self.weight} kg je ve stavu {self.state}."
    
    def delivery_price(self):
        if self.weight < 10:
            return 129
        elif self.weight <= 20:
            return 159
        else:
            return 359
        
    def deliver(self):
        if self.state == "doručen":
            return "Balík již byl doručen."
        elif self.state == "nedoručen":
            self.state = "doručen"
            return "Doručení uloženo."

class ValuablePackage(Package):
    def __init__(self, address, weight, state, value):
        super().__init__(address, weight, state)
        self.value = value

    def __str__(self):
        text = super().__str__()
        return f"{text} Cena tohoto balíku je {self.value} Kč."
    
    def delivery_price(self):
        price = super().delivery_price() * 1.05
        return f"Cena balíku s pojištěním je {price} Kč."
    
package_1 = ValuablePackage("Grimmauldovo náměstí 11", 1.9, "nedoručen", 5500)
package_2 = Package("Godrikův důl 47", 1.9, "nedoručen")
package_3 = ValuablePackage("Vydrník svatého Drába 13", 1.9, "nedoručen", 5500)
package_list = [package_1, package_2, package_3]
total_value = 0

#for package in package_list:
#    if isinstance(package, ValuablePackage):
#        total_value += package.value
#print(f"Celková hodnota cenných balíků je {total_value} Kč.")

#for package in package_list:
#    if hasattr(package, "value"):
#        total_value += package.value
#print(f"Celková hodnota cenných balíků je {total_value} Kč.")

for package in package_list:
    package_value = getattr(package, "value", 0) # pokud objekt nemá "value", tak se naství to, co je na posletním parametru (tj. 0)
    total_value += package_value
print(f"Celková hodnota cenných balíků je {total_value} Kč.")
```

**Zadání:** Vedení společnosti si uvědomilo, že do hodnoty balíků v autě by se neměly započítávat balíky, které už byly doručeny, protože již byly předány příjemci a nebudou tedy ukradeny nebo zničeny.
- Uprav kód, který vytváří balíky, aby byl jeden balík vytvořený ve stavu `doručen`.
- Uprav cyklus, aby započítal hodnotu pouze těch balíků, které jsou ve stavu `nedoručen`.
```python
total_value = 0

#for package in package_list:
#    if isinstance(package, ValuablePackage) and package.state == "nedoručen":
#        total_value += package.value
#print(f"Celková hodnota cenných balíků je {total_value} Kč.")

for package in package_list:
    if hasattr(package, "value") and package.state == "nedoručen":
        total_value += package.value
print(f"Celková hodnota cenných balíků je {total_value} Kč.")

#for package in package_list:
#    if package.state == "nedoručen":
#        package_value = getattr(package, "value", 0)
#        total_value += package_value
#print(f"Celková hodnota cenných balíků je {total_value} Kč.")
```

**Zadání:** Nyní se vrátíme k práci pro nakladatelství, pro které jsme již připravili třídy `Item`, `Book` a `AudioBook`. V e-shopech se často objevuje možnost filtrování produktů. Uvažujme například, že někteří fanoušci a fanynky audioknih vybírají knihy podle herce a herečky, kteří je čtou. Preferované jméno bude uložené v proměnné `favourite_narrator`. Napiš kód, který projde všechny položky v seznamu `all_items` a vypíše názvy (atribut `title`) objektů, pro které se hodnota atributu `narrator` rovná hodnota v proměnné `favourite_narrator`. Pozor na to, že v seznamu `all_items` jsou i běžné knihy, které vypravěče nemají. Zajisti, aby program neskončil chybou, protože některý objekt nemá atribut `narrator`.
```python
class Item:
    def __init__(self, title, price):
        self.title = title
        self.price = price
    def get_time_to_read(self):
        pass    
class Book(Item):
    def __init__(self, title, price, pages):
        super().__init__(title, price)
        self.pages = pages
    def get_info(self):
        return f"Kniha '{self.title}' má {self.pages} stran a stojí {self.price} Kč."
    def get_time_to_read(self):
        return self.pages * 4 / 60
class AudioBook(Item):
    def __init__(self, title, price, duration_in_hours, narrator):
        super().__init__(title, price)
        self.duration_in_hours = duration_in_hours
        self.narrator = narrator
    def get_time_to_read(self):
        return self.duration_in_hours

favourite_narrator = "Zbyšek Horák"
item_1 = AudioBook("Problém tří těles", 299, 14.4, "Zbyšek Horák")
item_2 = Book("Kadet Hornblower", 399, 242)
item_3 = AudioBook("Odysseus", 389, 13.7, "Lukáš Hlavica")

all_items = [item_1, item_2, item_3]

# prostor pro řešení
```

## provázání objektů
- v reálných aplikacích často potřebujeme objekty mezi sebou provázat
- V personálním systému by bylo užitečné provázat podřízené s jejich manažerem
```python
class Employee:
    def __init__(self, name: str, position, holiday_entitlement, manager):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
        self.manager = manager
        
class Manager(Employee):
    def __init__(self, name: str, position, holiday_entitlement, manager, subordinates, car):
        super().__init__(name, position, holiday_entitlement, manager)
        self.subordinates = subordinates
        self.car = car

marian = Manager("Marian Přísný", "vedoucí konstrukčního oddělení", 25, None, 5, "Škoda Octavia 1.5 TSI")
marketa = Manager("Markéta Polková", "teamleader", 25, marian, 12, "Škoda Octavia RS")
frantisek = Employee("František Novák", "konstruktér", 25, marketa)

print(frantisek.manager.name)
```

- kurz vychází z podkladů připravených pro Czechitas: https://kodim.cz/czechitas/uvod-do-progr-2