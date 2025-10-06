# funkce

Kromě předefinovaných funkcí např.  
`cele_cislo = round(12.34567)`  
`print(cele_cislo)`  
si mohu definovat funkci vlastní, např.  
`def greet_user():`  
`   print("Ahoj Alice!")`  
`greet_user()`.  

Navíc lze funkci rozšířit o f-string, který umožňuje vložení proměnné do textu, díky čemuž lze při volání funkce definovat (v tomto konkrétním případě) jméno oslovoaného.  

`def greet_user(name):`  
`    print(f"Ahoj {name}!")`  
`greet_user("Alice")`  
`greet_user("Richarde")`  

Dalším příkladem flexibility funkce může být jazyková mutace pozdravu.  

`def greet_user(language_code):`  
`    if language_code == 'cs':`  
`        print("Ahoj!")`  
`    elif language_code == 'de':`  
`        print("Hallo!")`  
`    else:`  
`        print("Hello!")`  
`greet_user('cs')`  
`greet_user('fr')` # vypíše Hello!   

Kromě vypisování lze také po funkci požadovat nějaký výstup. Hodnotu, kterou má vrátit díky klíčovému slovu `return`.

`def sum_two_numbers(a, b):`  
`    result = a + b`  
`    return result`  
`print(sum_two_numbers(1, 1))`  

Dále mohu kód obohatit o další dva řádky kódu se stejnou logikou.

`total_price = sum_two_numbers(250, 135)`  
`print(total_price)`  

**fuknce kódu**
Může se stát, že je evidentní potřeba nějaké funkce, ale zatím není protstor proto ji naprogramovat. pro takový případ slouží funkce `pass`.  

`def code_me_later(par1, par2):`  
`    pass`

def divide_two_numbers(a, b):


**dělení**  
Konkrétní příklad dělení se zadáním dělence a dělitele.  

`def divide_two_numbers(a, b):`  
`    if b == 0:`  
`        return None`  
`    else:`  
`        return a / b`  

`a = float(input("Zadej dělenec: "))`  
`b = float(input("Zadej dělitel: "))`  
`result = divide_two_numbers(a, b)`  
`print("Výsledek dělení je:", result)`  

**cvičení násobení**
Napište funkci `mult`, která bude mít dva číselné parametry. Funkce oba parametry vynásobí a vrátí výsledek.  

`def mult(a, b):`  
`    return a * b`  
`print(mult(1, 1))`  

**převod jednotek**
Vytvořte funkci `km_na_mile`, které převede kilometry na míle.  

`def kilometry_na_mile(kilometry):`  
`    return kilometry * 0.621`  

`print(f'10 mile je {kilometry_na_mile(10)} kilometru.')`  

Použití f-stringu `f` a `{}` ulehčuje práci s textem a výsledkem funkce. Všechno, co je uvnitř složených závorek, se vyhodnotí jako Python výraz a dosadí do výsledného řetězce. Bez `f` by Python závorky nevnímal a vypsal by je doslova, nebo by bylo zapotřebí spojovat řetězce pomocí + nebo čárkami.

**datum narození**
Takhle to stačí pro muže:
def month_of_birth(birth_number):
   month = birth_number[2:4]

   print(month)

birth_month = month_of_birth("6708120000")
birth_month = month_of_birth("6759120000")
birth_month = month_of_birth("6762120000")

Navíc a sofistikovanější pro ženy.
def month_of_birth(birth_number):
    month = int(birth_number[2:4]) % 50
    return month
print(f"Month of birth: {month_of_birth('6708120000')}")
# birth_month = month_of_birth("6759120000")
# birth_month = month_of_birth("6762120000")


**převod vzdálenosti z mil na kilometry**
# Parametry:
# - mile: hodnota ve statute miles (tzv. "pozemské" míle)
# - namorni: volitelný parametr (False = běžná míle, True = námořní míle)
def mile_na_kilometry(mile, namorni=False):
    # Pokud se nejedná o námořní míle
    if not namorni:
        # Převod běžné míle na kilometry (1 míle ≈ 1.609344 km)
        return mile * 1.609344
    else:
        # Převod námořní míle na kilometry (1 námořní míle = 1.852 km)
        return mile * 1.852

# Výpočet vzdálenosti Londýn–Oxford (59.7 běžných mil)
london_oxford_km = mile_na_kilometry(59.7)
print(london_oxford_km)  # vypíše cca 96.06 km

# Výpočet vzdálenosti Belfast–New York (2758.13 námořních mil)
belfast_new_york = mile_na_kilometry(2758.13, True)
print(belfast_new_york)  # vypíše cca 5110.55 km



zdroj a procvičování: https://kodim.cz/czechitas/uvod-do-progr-2/uvod-do-programovani-2/vlastni-funkce/funkce

