def mile_na_kilometry(mile, namorni: bool=False):
    # 0, "", [] se berou jako False
    # neprázdný řetězec, neprázdný seznam, nenulové číslo se berou jako True
    if not namorni:
        return mile * 1.609344
    else:
        return mile * 1.852