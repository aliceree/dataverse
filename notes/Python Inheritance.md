# dědičnost
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

## cvičení

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

# datové třídy
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

## abstraktní třídy
- 