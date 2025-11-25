lines = []
vykazy = []

with open('Datová analýza/GitHub/vykaz.txt', encoding='utf-8') as file:
    for line in file:
        vykazy.append(float(line))

hodinova_mzda = int(input("Napiš hodinovou mzdu v Kč: "))
celkova_mzda = 0
    
for vykaz in vykazy:
    celkova_mzda += hodinova_mzda * vykaz
    
print(celkova_mzda)
print(celkova_mzda / len(vykazy))