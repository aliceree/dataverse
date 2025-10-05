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


**dělení**  
`# zaokrouhlí číslo 12.34567 na celé číslo`  
`result = round(12.34567)`  
`print(result)  # výsledek bude 12`  

`# definuje funkci, která umí vydělit dvě čísla`  
`def divide_two_numbers(a, b):`  
`    # podmínka: pokud jmenovatel b není nula`  
`    if b != 0:`  
`        result = a / b  # vydělíme číslo a číslem b`  
`        return result   # vrátíme výsledek`  
`    else:`  
`        # Pokud je b == 0, nelze dělit (matematicky nesmysl)`  
`        return "Nulou nelze dělit."`  

`# zavolá funkci s hodnotami a=120, b=4`  
`# podmínka b != 0 je splněna → proběhne dělení 120 / 4`  
`division_result = divide_two_numbers(120, 4)`  
`print(division_result)  # výsledek bude 30.0 (float)`  

`# zavolá funkci s hodnotami a=120, b=0`  
`# podmínka b != 0 není splněna → spustí se větev else`  
`division_result_2 = divide_two_numbers(120, 0)`  
`print(division_result_2)  # vypíše "Nulou nelze dělit"` 

**cvičení násobení**
moje řešení:
def mult(a, b):
    result = a * b
    return result

mult_result = mult(2, 2)
print(mult_result) #vytiskne výsledek násobení

rešení koučky:
def mult(a,b):
    return a* b
print(f'Nasobeni: {mult(10,15)}')

**převod jednotek**
def kilometry_na_mile(kilometry):
    return kilometry * 0.621

def mile_na_kilometry(mile):
    return mile / 0.621

print(f'10 mile je {mile_na_kilometry(10)} kilometru.')


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

