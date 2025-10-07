def kofein_za_den(pocet_espresso, pocet_filtrovana=0):
    return pocet_espresso * 75 + pocet_filtrovana * 150

print(kofein_za_den(3, 2))