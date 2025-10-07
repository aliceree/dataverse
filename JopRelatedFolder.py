km = int(input("Zadej vzdálenost v km: "))

def km_na_m(km):
    return km / 0.001

print(int(km_na_m(km)))