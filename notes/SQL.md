## základní pojmy
- **data:** údaje, používané pro popis jevu nebo vlastnosti pozorovaného objektu; získávají se zápisem, měřením nebo pozorováním  
- **informace:** smysluplná interpretace dat  
- **databáze:** organizovaný soubor strukturovaných dat  
- **systém řízení bází dat:** softwarové vybavení, zajišťující práci s databízí  
- **databázový systém:** systém řízení bází dat + databíze

## datové typy
- **číselné:** integer, numeric/decimal
- **řetězcové:** char, varchat, nchar, nvarchar, text
- **datum a čas:** date, datetime, timestamp
- **logický:** boolen

# SQL
- structured query language
- standardizovaný strukturovaný dotazovací jazyk
- používán k práci s daty v relačních databázích
- nejčastěji MS SQL, MySQL, Oracle, PostgreSQL, SQLite

## druhy příkazů SQL
- **Data Desinition Language (DDL):** vytváření a změna objetů (tabulek apod.)  
`CREATE, Drop, AFTER, TRUNCATE`
- **Data Manipulation Language:** manipulace s daty (vkládání, mazání, změna)  
`INSERT, UPDATE, DELETE, CALL, EXPLAIN CALL, LOCK`
- **Transacton Control Language:** práce s transakcemi  
`COMMIT, SAVEPOINT, ROLLBACK, SET Transaction, SET Constraint`
- **Data Query Language:** dotazování na data  
`SELECT`
- **Data Control Language:** řízení přístupu k datům  
`GRANT, REVOKE`

## SELECT
- dotaz na data do tabulek, výsledkem je vždy tabulka
- obecná struktura příkazu, pořadí jednotlivých částí
```sql
SELECT seznam sloupců, agregační funkce
FROM zdrojová tabulka
WHERE podmínka
GROUP BY seznam sloupců
HAVING podmínka pro výsledek agregace
ORDER BY seznam sloupců
(LIMIT);
```
- základní sytaxe dotazu SQL
```sql
SELECT sloupec1,..., sloupecN
FROM tabulka;

-- dotaz nerozlišuje psaní malými/velkými písmeny
-- klíčová slova (SELECT, FROM) se oddělují mezerami
-- mezi názvy sloupců se vkládá čárka
-- dotaz se ukončuje středníkem
-- komnetář na více řádků /* */
```

### cvičení

- cvičnou databázi poskytuje Czechitas v rámci svého semestrálního kurzu  

**Zadání:** Vyber všechny sloupce z tabulky Sales.
```sql
SELECT *
FROM Sales"
```

**Zadání:** Vyber sloupce ProductID a Product z tabulky Product.
```sql
SELECT ProductID, Product
FROM Sales;
```

### SELECT AS
- přejmenování sloupců s pomocí klauzule `AS`
```sql
SELECT
sloupec1 AS NovyNazevSloupce1,
sloupec2 AS NovyNazevSloupce2,
sloupec3,
sloupec4 AS NovyNazevSloupce4
FROM tabulka;
```

### SELECT DISTRICT
- vybere pouze jedinečné záznamy z tabulky
- např. vybrat kategorie ze seznamu produktů
```sql
SELECT DISTINCT Category
FROM Product;
```

### SELECT LIMIT
- vybere pouze konkrétní počet záznamů z tabulky
- např. vybrat první 3 výrobce ze seznamu výrobců
```sql
SELECT Manufacturer
FROM Manufacturer
LIMIT 3;
```

### SELECT ORDER BY DESC/ASC
- řezení výsledků `DESC` (descending) od největšího k nejmenšímu
- řezení výsledků `ASC` (ascending) od nejmenšího k největšímu
- např. vybrat z tabulky výrobců jednotlivé výrobce a seřadit je abecedně
```sql
SELECT Manufacturer
FROM Manufacturer
ORDER BY Manufacturer DESC;
```

### cvičení
**Zadání:** Vyberte jedinečné Regiony z tabulky Country a zobrazte pouze první záznam.
```sql
SELECT DISTINCT Region
FROM Country
LIMIT 1;
```

**Zadání:** Vyberte všechny sloupce z tabulky Sales a seřaďte výsledky sestupně dle výše Revenue. Omezte výsledek na pouze 5 řádků.
```sql
SELECT *
FROM Sales
ORDER BY Revenue DESC
LIMIT 5;
```

### SELECT WHERE + AND/OR
- podmínka v dotazu
- např. Vybrat všechny záznamy o prodeji produktu s ProductID 428.
```sql
SELECT *
FROM Sales
WHERE ProductID = 428;
```
- lze spojit také více podmínek klauzulemi `AND` nebo `OR`
- `AND` dotaz vybere záznamy, pokud jsou splněné obě podmínky
```sql
SELECT sloupce
FROM tabulka
WHERE sloupec1 = 'Hodnota' AND sloupec2 = 'Hodnota';
```
- `OR` dotaz vybere záznamy, pokud je alespoň jedna z podmínek splněna
```sql
SELECT sloupce
FROM tabulka
WHERE sloupec1 = 'Hodnota' OR sloupec2 = 'Hodnota';
```

### SELECT WHERE + operátory (<, =, BETWEEN, LIKE, IN, IS NULL)
- s pomocí operátorů lze počítat a porovnávat číselné i textové hodnoty
- porovnávání **číselných hodnot** např.
```sql
WHERE Units = 1;
WHERE Units <= 10;
WHERE Units BETWEEN 2 AND 8;
```
- pozovnávání **textových řetězců**, např.
```sql
SELECT *
FROM Manufacturer
WHERE Manufacturer = 'Abbas' -- vypíše jednoho výrobce s názevm Abbas
```
- čtení textových řetězců je Case Sensitive, např.
```sql
SELECT *
FROM Manufacturer
WHERE Manufacturer = 'abbas' --nevypíše nic

WHERE Manufacturer = 'Abba' --nevypíše také nic
```
- textové řetezce lze porovnávat pomocí `LIKE`
- `LIKE` doplňují Wild Cards `'%'` (zastupuje 0 až N znaků) a `'_'` (zastupuje právě jeden znak), např.
```sql
SELECT *
FROM Manufacturer
WHERE Manufacturer LIKE 'Abba%'; --vypíše i výrobce Abbas

SELECT *
FROM osoba
WHERE prijmeni LIKE '_avel' --vypíše osoby s příjmením Havel, Pavel, ale ne s příjmením Šťavel, Havelka
```
- pro porovnání **datumových hodnot** lze použít metody pro porovnání číselných i textových hodnot, včetně operátoru LIKE
```sql
SELECT *
FROM Sales
WHERE date > ‘2015-05-31‘; --vypíše všechny prodeje po 31. květnu 2015

SELECT *
FROM Sales
WHERE date >= ‘2015-05-01‘ AND date <= ‘2015-05-31‘; --vypíše všechny prodeje v květnu 2015

SELECT *
FROM Sales
WHERE date LIKE ‘2015-05%‘; --vypíše stejně všechny prodeje v květnu 2015


SELECT *
FROM Sales
WHERE date BETWEEN ‘2015-05-01‘ AND ‘2015-05-31‘; --vypíše stejně všechny prodeje v květnu 2015
```

- seznam oparátorů

| Operátor       | Datový typ      | Příklad zápisu                                                                 |
|----------------|-----------------|--------------------------------------------------------------------------------|
| * / + -        | number          | `... WHERE sloupec1 = hodnota1 * hodnota2`                                     |
| < <= > >=      | number          | `... WHERE sloupec >= hodnota`                                                 |
| =              | number, string  | `... WHERE sloupec = 'hodnota'`                                                |
| <>             | number, string  | `... WHERE sloupec <> 'hodnota'`                                               |
| LIKE           | number, string  | `... WHERE sloupec LIKE '%1'` <br> `... WHERE sloupec LIKE '1%'` <br> `... WHERE sloupec LIKE '%1%'` |
| BETWEEN        | number          | `... WHERE sloupec1 BETWEEN hodnota1 AND hodnota2` <br> (same as x >= y AND x <= z) |
| IN, NOT IN     | number, string  | `... WHERE sloupec1 IN ('hodnota1', 'hodnota2')`                               |
| IS NULL/IS NOT NULL | number, string | `... WHERE sloupec1 IS NULL`                                                |

### cvičení
**Zadání:** Co všechno firma prodala (Sales) za rok 2014? Výsledky je střeba seřadit sestupně podle data prodeje (Date). Zadání má minimálně 3 možná řešení.
```sql
SELECT *
FROM Sales
WHERE Date LIKE '2014%'
ORDER BY date DESC;

SELECT *
FROM Sales
WHERE Date BETWEEN '2014-01-01' AND '2014-12-31'
ORDER BY date DESC;

SELECT *
FROM Sales
WHERE Date >= '2014-01-01' AND Date < '2015-01-01'
ORDER BY date DESC;
```

**Zadání:** Zjistěte rok a název měsíce, kdy rok je mezi 2013 a 2015 a měsíc začíná na písmeno 'J' nebo obsahuje písmeno 'a'. Pracujte s tabulkou Date.
```sql
SELECT DISTINCT Year, MonthName
FROM Date
WHERE Year BETWEEN 2013 AND 2015 AND (MonthName LIKE 'J%' OR MonthName LIKE '%a%');
--V SQL má AND vyšší prioritu než OR
--pokud by bylo řešení bez závorky, SQL by vyhodnocovalo AND dřív než OR
```

### GROUP BY
Agregační funkce. Seskupování řádků podle vybraných sloupců umožňuje lépe analyzovat data a získávat souhrnná data v rámci jednoho dotazu. Seskupování se provádí pomocí klauzule GROUP BY společně s názvem sloupce, podle kterého chceme seskupovat.

```sql
SELECT category
FROM product
GROUP BY category;
```

- funkce pro získávání některých souhrnných údajů:  
- v dotazu umožní spočítat výsledek dle zvolené funkce

| Funkce             | Význam                    |
|--------------------|---------------------------|
| `AVG(sloupec)`     | Průměr hodnot sloupce     |
| `MAX(sloupec)`     | Maximální hodnota sloupce |
| `MIN(sloupec)`     | Minimální hodnota sloupce |
| `SUM(sloupec)`     | Součet hodnot sloupce     |
| `COUNT(sloupec)`   | Počet hodnot v tabulce    |

- lze je použít samostatně i ve spojení s GROUP BY
- samostatně:
```sql
SELECT SUM(pricenew)
FROM product;
```
- ve spojení s GROUP BY:
```sql
SELECT category, SUM(pricenew)
FROM product
GROUP BY category;
```

### cvičení

**Zadání:** Zjistit průměr, minimum, maximum, sumu a pocet pro cenu (Price) za kategorii (Category).

```sql
SELECT Category,
AVG(Price),
MIN(Price),
MAX(Price),
SUM(Price),
COUNT (Price)
FROM Product GROUP BY Category;
```

**Zadáná:** Jaké byli celkové tržby za rok 2014?
```sql
SELECT SUM(revenue)
FROM sales
WHERE date LIKE '2014%';
```

**Zadání:** Jaká byla průměrná tržba za 1 prodej v lichých letech?
```sql
SELECT AVG(revenue)
from sales 
where date like '2013%' OR date like '2015%'; --WHERE date >: '2013-01-01' AND < '2014-01-01') OR (date >='2015-01-01' AND < '2016-01-01')
```

**Zadání:** Který produkt (Productid) měl v roce 2014 největší tržby?
```sql
SELECT ProductID,SUM(Revenue)
FROM Sales
WHERE Date >= '2014-01-01' AND Date < '2015-01-01'
GROUP BY ProductID
ORDER BY SUM(Revenue) DESC;
```

**Zadání:** Kolik máme produktů v kategorii Rural? Výsledný sloupec přejmenujte na „ProductCount“.
```sql
SELECT COUNT(productid) AS ProductCount
FROM product
WHERE category = 'Rural'
```

**Zadání:** Průměrná cena (výsledek přejmenujte na „Prum_cena“) za kategorii? Zajímají nás pouze ceny větší jak 0 a kategorie Mix a Urban.
```sql
SELECT category, AVG(pricenew) AS Prum_cena
FROM product
WHERE pricenew > 0 AND category IN ('Mix', 'Urban')
GROUP BY category;
```

### HAVING
- agregační funkce

**Zadání:** Produkty, jejichž celkové tržby přesáhly 10 miliónů.
```sql
SELECT productid, sum(revenue) AS 'Trzby'
from sales
GROUP by productid
having Trzby > 10000000
ORDER by Trzby DESC;
```
Ještě varianta bez aliasu.
```sql
SELECT productid, sum(revenue)
from sales
GROUP by productid
having sum(revenue) > 10000000
ORDER by sum(revenue) DESC;
```

**Zadání:** Čeho se prodalo v roce 2013 nejvíce (počet kusů). Zajímají nás produkty, kterých jsme prodali více jak 5000.
```sql
SELECT ProductID, SUM(Units) AS Pocet_kusu
FROM Sales
WHERE date LIKE '2013%'
GROUP BY ProductID
HAVING SUM(Units) > 5000
ORDER BY Pocet_kusu DESC;
```

**Zadání:** Kterých 10 výrobců má nejvíce různorodých kategorií výrobků?
```sql
SELECT manufacturerid, COUNT(DISTINCT category) AS 'Pocet_kategorii'
from product
group by manufacturerid
ORDER by Pocet_kategorii DESC
LIMIT 10;
```
