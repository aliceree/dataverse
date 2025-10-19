# objekty a třídy
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

## cvičení

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

## cvičení

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

**Zadání:** Vrať

zdroj a cvičení: https://kodim.cz/czechitas/uvod-do-progr-2/uvod-do-programovani-2/tridy/tridy