# Zaokrouhlí číslo 12.34567 na celé číslo
result = round(12.34567)  
print(result)  # Výsledek bude 12

# Definice funkce, která umí vydělit dvě čísla
def divide_two_numbers(a, b):
    # Podmínka: pokud jmenovatel b není nula
    if b != 0:
        result = a / b  # vydělíme číslo a číslem b
        return result   # vrátíme výsledek
    else:
        # Pokud je b == 0, nelze dělit (matematicky nesmysl)
        return "Nulou nelze dělit"

# --- Použití funkce ---

# Zavoláme funkci s hodnotami a=120, b=4
# Podmínka b != 0 je splněna → proběhne dělení 120 / 4
division_result = divide_two_numbers(120, 4)
print(division_result)  # Výsledek bude 30.0 (float)

# Zavoláme funkci s hodnotami a=120, b=0
# Podmínka b != 0 není splněna → spustí se větev else
division_result_2 = divide_two_numbers(120, 0)
print(division_result_2)  # Vypíše "Nulou nelze dělit"