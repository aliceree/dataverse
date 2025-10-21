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