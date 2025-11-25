# soubory: čtení a zápis

## čtení
- pokud chci načíst data ze souboru a nepracovat se souborem dále (tj. po přečtení Python soubor zase zavře) musím mít python soubor a soubor, který chci číst v jedné složce a použít tento kód
```python
with open("Datová analýza/GitHub/mereni.txt", encoding="utf-8") as file:
    text = file.read()
print(text)
```

- pokud nechci část celý soubor, ale rozdělit si jej na řádky, použiji proměnnou `line`
```python
lines = []
with open("Datová analýza/GitHub/mereni.txt", encoding="utf-8") as file:
    for line in file:
        lines.append(line)
print(lines)
```