# funkce

Kromě předefinovaných funkcí např.  
`cele_cislo = round(12.34567)`  
`print(cele_cislo)`  
si mohu definovat funkci vlastní, např.  
`def greet_user():`  
`   print("Ahoj!")`  
`greet_user()`. 


def greet_user(name):
    print(f"Ahoj {name}!")
greet_user("Honzo")
greet_user("Zuzko")


def greet_user(language_code): #vytvoří funkci, která pozdraví uživatele podle zadaného jazyka
    if language_code == 'cs':
        print("Ahoj!")
    elif language_code == 'de':
        print("Hallo!")
    else:
        print("Hello!")
greet_user('cs')  # Outputs: Ahoj!
greet_user('fr')  # Outputs: Hallo!


result = round(12.34567)
print(result) #zaokrouhlí číslo na celé číslo a vytiskne ho

def sum_two_numbers(a, b): #vytvoří funkci, která sečte dvě čísla
    result = a + b
    return result

total_price = sum_two_numbers(250, 135)
print(total_price) #vytiskne výsledek sčítání


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


zdroj a procvičování: https://kodim.cz/czechitas/uvod-do-progr-2/uvod-do-programovani-2/vlastni-funkce/funkce

