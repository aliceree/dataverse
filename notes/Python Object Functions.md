# funkce pro práci s objekty

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

Zdroj a cvičení: https://kodim.cz/czechitas/uvod-do-progr-2/uvod-do-programovani-2/funkce-objekty/funkce-objekty/vypraveci

