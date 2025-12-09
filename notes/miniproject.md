# zadání projektu
Ze souboru `battles.tsv` si načti informace o bitvách, které se odehrály ve knižní sérii Písně ohně a ledu, jejímž autorem je spisovatel George R. R. Martin a podle níž byl natočen slavný seriál Hra o trůny. Naším úkolem je ze zadaných dat zjistit následující:
- Statistiku, kolikrát byl který rod v pozici útočníků. Výsledná data ulož do CSV souboru `attackers.csv`.
- Pokud je zadaná síla obou armád (sloupce `attacker_size` a `defender_size`, indexy sloupců jsou 17 a 18), vytvoř seznam velitelů, kteří v boji porazili silnější armádu (vítěze poznáš podle sloupce `attacker_outcome`, který obsahuje hodnoty `win` a `loss`, platí vždy z pohledu útočníka). Kolik takových bitev je?
Jaké kroky jsou pro řešení potřeba?