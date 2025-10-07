books = [
    {"title": "Zkus mě chytit", "sold": 4165, "price": 347, "year": 2018},
    {"title": "Vrah zavolá v deset", "sold": 5681, "price": 299, "year": 2019},
    {"title": "Zločinný steh", "sold": 2565, "price": 369, "year": 2019},
]

total = 0
for item in books:
    # při prvním běhu bude uložený celý slovník {"title": "Zkus mě ch...}
    # při druhém běhu bude uložený celý slovník {"title": "Vrah zavolá v deset"...}
    # při třetím běhu bude uložený celý slovník {"title": "Zločinný steh"...}
    if item["year"] >= 2019:
        total = total + item["sold"] * item["price"] # má přednost násobení (jako v matematice)
print(total)
