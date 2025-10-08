# slicing seznamů a řetězců
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

# metody pro řetězce
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

zdroj a cvičení: https://kodim.cz/czechitas/uvod-do-progr-2/uvod-do-programovani-2/slicing-metody-moduly/slicing
