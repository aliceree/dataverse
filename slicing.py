hodnoty = '12.1 1.68 7.45 -11.51'

list_hodnoty = hodnoty.split()
posledni_hodnota = list_hodnoty[-1]
posledni_hodnota = float(posledni_hodnota)
vysledek = posledni_hodnota + 0.25
print(vysledek)
vysledek = str(vysledek)
list_hodnoty[-1] = vysledek
vysledek_hodnoty = " ".join(list_hodnoty)
print(vysledek_hodnoty)