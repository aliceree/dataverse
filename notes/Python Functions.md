# funkce
- romě předefinovaných funkcí
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

### fuknce kódu
Může se stát, že je evidentní potřeba nějaké funkce, ale zatím není protstor proto ji naprogramovat, pro takový případ slouží funkce `pass`.  
```python
def code_me_later(par1, par2):
    pass
```

### dělení
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

# cvičení
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

zdroj a cvičení: https://kodim.cz/czechitas/uvod-do-progr-2/uvod-do-programovani-2/vlastni-funkce/funkce

