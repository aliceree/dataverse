def mile_na_kilometry(mile, namorni=False):
    if not namorni:
        return mile * 1.609344
    else:
        return mile * 1.852
london_oxford_km = mile_na_kilometry(59.7)
print(london_oxford_km)
belfast_new_york = mile_na_kilometry(2758.13, True)
print(belfast_new_york)