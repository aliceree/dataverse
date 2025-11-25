lines = []
with open("Datová analýza/GitHub/mereni.txt", encoding="utf-8") as file:
    for line in file:
        lines.append(line)
print(lines)