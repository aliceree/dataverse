with open("Datová analýza/GitHub/mereni.txt", encoding="utf-8") as file:
    mereni = [line.strip() for line in file if line.strip()]

print(mereni)
