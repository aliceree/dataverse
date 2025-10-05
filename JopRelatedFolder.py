pohyby = [1200, -250, -800, 540, 721, -613, -222]
print(pohyby[2])
print(pohyby[2:])
print(len(pohyby))
print(min(pohyby))
print(max(pohyby))
print (sum(pohyby))

def mile_na_kilometry(mile, namorni: bool=False):
    # 0, "", [] se berou jako False
    # neprázdný řetězec, neprázdný seznam, nenulové číslo se berou jako True
    if not namorni:
        return mile * 1.609344
    else:
        return mile * 1.85210