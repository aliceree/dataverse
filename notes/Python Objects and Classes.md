# Objekty a třídy
- objekty jsou na sobě nezávislé (datum narození mnou vyplněné nezmění datum narození vyplněné např. kolegyní)
- objekty mají hodnoty, ty nazýváme atributy (např. jméno v daňovém přiznání)
- metoda je uvnitř nějaké třídy
- název třídy je vždy s velkým písmenem na začátku
- metoda `__init__()`

```python
class Employee:
    def __init__(self, name, position, holiday_entitlement):
        # self.name je atribut třídy Employee
        # name je jen parametr metody __init__
        self.name = name
        self. position = position
        self.holiday_entitlement = holiday_entitlement
    def get_info(self):
        return f"Zaměstanec {self.name} pracuje na pozici {self.position}."
frantisek = Employee("František Novák", "konstruktér", 25)
klara = Employee("Klara Nová", "konstruktérka", 25)
print(frantisek.get_info())
print(klara.get_info())
```

## cvičení

**Zadání:** Návrh software pro zásilkovou společnost.
- Vytvořte třídu `Package`, která bude mít tři atributy `address`, `weight` a `state`. Dále vytvořte metodu `__init__`, která uloží hodnoty parametrů metody do atributů.
- Přidejte metodu `get_info()`, která vrátí informace o balíku jako řetězec. Například větu "Balík na adresu Krakovská 583/9, Praha má hmotnost 0.25 kg je ve stavu nedoručen".
- Zkuste si vytvořit alespoň dva objekty ze třídy `Balik`. U `address` uvažujeme typ řetězec `str`, u `weight` desetinné číslo. U atributu `state! zadávejte pro zjednodušení pouze dva stavy: doručen a nedoručen.
- Vypište informace, které generuje metoda `get_info()`, na obrazovku, a ověřte, že je vše v pořádku.
- Vytvořte metodu `delivery_price()`, která vypočítá cenu přepravy balíku. Cena přepravy je daná hmotností balíku. Cena přepravy balíku do 10 kg je 129 Kč, cena přepravy balíku od 10 kg do 20 kg je 159 Kč a cena přepravy balíků těžších než 20 kg je 359 Kč. Metoda spočítá cenu a vrátí ji jako číslo.
```python
class Package:
    def __init__(self, address, weight, state):
        self.address = address
        self.weight = weight
        self.state = state

    def delivery_price(self):
        if self.weight < 10:
            return 129
        elif self.weight <= 20:
            return 159
        else:
            return 359
    
    def get_info(self):
        return f"Balík na adresu {self.address} má hmotnost {self.weight} kg a je ve stavu {self.state}. Cena za dopravu byla {self.delivery_price()}."

balik = Package("Krakovská 583/9, Praha", 0.25, "doručen")
print(balik.get_info())
```