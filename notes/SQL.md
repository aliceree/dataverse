- [SQL](#sql)
- [SELECT](#select)
- [ALIAS](#alias)
- [DISTRICT](#district)
- [LIMIT](#limit)
- [ORDER BY](#order-by-descasc)
- [WHERE](#where)
- [GROUP BY](#group-by--agregační-funkce)
- [HAVING](#having)
- [JOIN](#join)

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
FROM Sales;
```

**Zadání:** Vyber sloupce ProductID a Product z tabulky Product.
```sql
SELECT ProductID, Product
FROM Sales;
```

### ALIAS
- přejmenování sloupců s pomocí klauzule `AS`
```sql
SELECT
sloupec1 AS NovyNazevSloupce1,
sloupec2 AS NovyNazevSloupce2,
sloupec3,
sloupec4 AS NovyNazevSloupce4
FROM tabulka;
```

## DISTRICT
- vybere pouze jedinečné záznamy z tabulky
- např. vybrat kategorie ze seznamu produktů
```sql
SELECT DISTINCT Category
FROM Product;
```

## LIMIT
- vybere pouze konkrétní počet záznamů z tabulky
- např. vybrat první 3 výrobce ze seznamu výrobců
```sql
SELECT Manufacturer
FROM Manufacturer
LIMIT 3;
```

## ORDER BY DESC/ASC
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

## WHERE

### WHERE + AND/OR
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

### WHERE + operátory (<, =, BETWEEN, LIKE, IN, IS NULL)
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

**Zadání:** Zjistěte rok a název měsíce, kdy rok je mezi 2013 a 2015 a měsíc začíná na písmeno `J` nebo obsahuje písmeno `a`. Pracujte s tabulkou Date.
```sql
SELECT DISTINCT Year, MonthName
FROM Date
WHERE Year BETWEEN 2013 AND 2015 AND (MonthName LIKE 'J%' OR MonthName LIKE '%a%');
--V SQL má AND vyšší prioritu než OR
--pokud by bylo řešení bez závorky, SQL by vyhodnocovalo AND dříve než OR
```

## GROUP BY + agregační funkce
- seskupí řádky podle vybraných sloupců, např.
```sql
SELECT Category
FROM Product
GROUP BY Category;
```
- agregační funkce na takto seskupených datech pak dle zadání provádí operace
- lze tak jedním příkazem např. získat průměrnou cenu celé kategorie hračky

| Agregační funkce   | Význam                    |
|--------------------|---------------------------|
| `AVG(sloupec)`     | Průměr hodnot sloupce     |
| `MAX(sloupec)`     | Maximální hodnota sloupce |
| `MIN(sloupec)`     | Minimální hodnota sloupce |
| `SUM(sloupec)`     | Součet hodnot sloupce     |
| `COUNT(sloupec)`   | Počet hodnot v tabulce    |

- agregační funkce lze použít samostatně i ve spojení s `GROUP BY`
- samostatně:
```sql
SELECT SUM(pricenew)
FROM product; --vrátí součet cen všech produktů
```
- ve spojení s GROUP BY:
```sql
SELECT category, SUM(pricenew)
FROM product
GROUP BY category; --vrátí součet cen všech produktů dané kategorie
```

### cvičení

**Zadání:** Zjistit průměr, minimum, maximum, sumu a pocet pro cenu (Price) za kategorii (Category).

```sql
SELECT Category,
AVG(Price),
MIN(Price),
MAX(Price),
SUM(Price),
COUNT(Price)
FROM Product GROUP BY Category;
```

**Zadáná:** Jaké byli celkové tržby za rok 2014?
```sql
SELECT SUM(Revenue)
FROM Sales
WHERE Date LIKE '2014%';
```

**Zadání:** Jaká byla průměrná tržba za 1 prodej v lichých letech?
```sql
SELECT AVG(revenue)
from sales 
where date like '2013%' OR date like '2015%';
```

**Zadání:** Který produkt (Productid) měl v roce 2014 největší tržby?
```sql
SELECT ProductID, SUM(Revenue)
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

## HAVING
- filtr na úrovni skupin
- používá se spolu s GROUP BY, aby z výsledků agregací (např. SUM, COUNT, AVG) vybral jen ty skupiny, které splní podmínku
- zatímco WHERE filtruje jednotlivé řádky před seskupením, HAVING filtruje celé skupiny po seskupení
- zjednodušené pořadí vyhodnocení: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
```sql
SELECT SUM(sloupec), sloupec2
FROM tabulka
GROUP BY sloupec2
HAVING SUM(sloupec) > 0;
```

**Zadání:** Produkty, jejichž celkové tržby přesáhly 10 miliónů.
```sql
SELECT productid, sum(revenue) AS 'Trzby'
from sales
GROUP by productid
HAVING Trzby > 10000000
ORDER by Trzby DESC;
```
- ještě varianta bez aliasu
```sql
SELECT productid, sum(revenue)
from sales
GROUP by productid
HAVING sum(revenue) > 10000000
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

### cvičení
**Zadání:** Ve které kategorii je nejvíce výrobků?
```SQL
SELECT Category, COUNT(productid) 
FROM roduct
GROUP BY category
ORDER by COUNT(productid) DESC
limit 1;
```

**Zadání:** Jaké jsou průměrné tržby za jednotlivé produkty Výsledek seřadte dle průměrné tržby sestupně.
```SQL
SELECT productid, AVG(revenue)
from sales
GROUP by productid
ORDER by AVG(revenue) DESC;
```

**Zadání:** Který výrobek, kterého bylo najednou prodáno alespoň 5 kusů, měl v roce 2013 největší tržby. Uveďte jen jeden záznam.
```sql
SELECT productid, AVG(revenue)
FROM sales
WHERE date LIKE '2013%' AND units >=5
GROUP BY productid
ORDER BY sum(revenue) DESC
LIMIT 1;
```

**Zadání:** Ve kterém segmentu působí nejvíce výrobců?
```sql
SELECT Segment, COUNT(DISTINCT manufacturerid) AS pocet_vyrobcu
FROM product
GROUP BY Segment
ORDER BY pocet_vyrobcu DESC;
```

**Zadání:** Vypište města a k nim ostatní údaje z tabulky Country, která jsou z východního nebo centrálního regionu, (a zároveň) jejichž název má druhé písmeno `t` nebo mají ve svém názvu `stown`, a (zároveň) jsou z oblasti (district) `District #05`. Výstup seřaďte podle názvu města vzestupně. Pozor, v řetězci `District #05` je mezi `t` a `#` mezera.
```sql
SELECT * FROM Country
WHERE (Region = 'East' OR Region = 'Central')
	AND (City LIKE '_t%'
		OR City LIKE '%stown%')
	AND District = 'District #05'
ORDER BY City ASC;

--řešení s trochu jinou strukturou
SELECT * FROM country
WHERE 1=1
AND (city LIKE '_t%' OR city LIKE '%stown%')
AND region IN ('East', 'Central')
AND (District LIKE '%District #05%')
ORDER BY city;
```
## JOIN
 - tzv. vnitřní spojení
 - vybere z obou tabulek ty řádky, které mají svého „protějška" v obou tabulkách (tj. primární a cizí klíč)
```sql
SELECT tabulka1.sloupec1, tabulka1.sloupec2, tabulka.sloupec1
FROM tabulka1
INNER JOIN tabulka2
ON tabulka1. sloupec1 = tabulka2.sloupec1;
```

**Zadání:** Vyber produkty, kterých bylo prodáno najednou více jak 40 kusů, k tomuto datu toho prodeje a počet prodaných kusů a z tabulky Product vyberte odpovídající název produktu.
```sql
SELECT s.ProductID, p.Product, s.Date, s.Units
FROM sales AS s
JOIN product AS p ON s.ProductID = p.ProductID
WHERE Units > 40
ORDER BY s.Units DESC;
```

**Zadání:** Zjisti TOP 100 prodejů dle tržby a k nim náležící informace z tabulky Country.
```sql
SELECT *
from sales s
join country c on s.zip=c.Zip
ORDER by revenue DESC
limit 100;
```

**Zadání:** Ve kterých státech jsme měli největší tržby?
```sql
SELECT c.State, SUM(s.Revenue) AS 'trzby'
FROM Country AS c
JOIN Sales AS s ON c.Zip = s.Zip
ORDER BY trzby DESC;
```

**Zadání:** Který výrobce vyrábí nejvíce různých/jedinečných výrobků?
```sql
SELECT m.Manufacturer, COUNT(p.ProductID) AS Pocet_vyrobku
FROM Manufacturer AS m
JOIN Product AS p ON m.ManufacturerID = p.ManufacturerID
GROUP BY m.Manufacturer
ORDER BY Pocet_vyrobku DESC
LIMIT 10;
```

**Zadání:** Vypište seznam prodktů (název, kategorie, název výrobce), u kterých byla jednorázová tržba větší než 10 000 dolarů. Dále vypiště prodeje, kdy k tomu došlo (sales, product, manufacturer).

```sql
SELECT p.product, p.category, m.manufacturer, s.date, s.revenue
from sales s 
join product p on s.ProductID = p.ProductID
join manufacturer m on p.ManufacturerID = m.ManufacturerID
where revenue > 10000
order by p.Product;
```

příklady:
--Jaké jsou v jednotlivých regionech tržby za výrobky společnosti Currus?
--regiony = country
--tržby = sales
--výrobce = manufacturer
--product --> spojení s manufacturer

SELECT c.region, SUM(s.revenue)
from sales s 
JOIN country c on s.zip = c.Zip
join product p on s.ProductID = p.ProductID
join manufacturer m on p.ManufacturerID = m.ManufacturerID
WHERE manufacturer = 'Currus'
GROUP by c.Region
ORDER by SUM(s.revenue) DESC;

--Kteří výrobci jsou nejprodávanější dle počtu různých produktů v regionu east?
SELECT count(DISTINCT s.productid) AS PocetProduktu, m.manufacturer
from sales s
JOIN country c on s.zip = c.Zip
join product p on s.ProductID = p.ProductID
join manufacturer m on p.ManufacturerID = m.ManufacturerID
where region = 'East'
GROUP by m.manufacturer
ORDER by PocetProduktu DESC;

# doplnit

Úkol č. 1
Zpracujte přehled TOP 10 prodejů dle počtu kusů za měsíc duben roku 2014. Ve výstupu uveďte ID produktu, název produktu a počet prodaných kusů.
(Nejvíce produkt Maximus UM-70, 3027 kusů)
Úkol č. 2
Vypište, které produkty a kolik kusů se prodalo ve městě New York (všechna zip) v roce 2013. Ve výstupu bude kód produktu, název produktu a počet prodaných kusů.
(247 produktů)
Úkol č. 3
Vypište TOP 10 nejprodávanějších produktů dle počtu prodaných kusů za rok 2014 z kategorie Youth. Ve výstupu bude kód produktu, název produktu, kategorie a počet prodaných kusů.
(Nejvíce produkt Natura YY-10, 3443 kusů)

Řešení
Úkol č. 1
SELECT p.productid, p.product, SUM(s.units) FROM sales s
JOIN product p ON p.ProductID = s.ProductID
WHERE s.date BETWEEN "2014-04-01" and "2014-04-30"
GROUP BY p.ProductID
ORDER BY SUM(s.units) DESC
LIMIT 10;
Úkol č. 2
SELECT s.productid, p.product, SUM(s.units) FROM sales s
JOIN product p ON p.ProductID = s.ProductID
JOIN country c ON s.Zip = c.Zip
WHERE c.City like "New York%" AND s.Date LIKE "2013%"
GROUP BY s.ProductID
Úkol č. 3
SELECT p.productid, p.product,p.Category, sum(s.units) FROM sales s
INNER JOIN product p ON p.ProductID=s.ProductID
WHERE p.Category = "Youth" and s.Date LIKE "2014%"
GROUP BY p.ProductID
ORDER BY sum(s.Units) DESC
LIMIT 10

# samostatná práce
Příklad č. 9:
Kteří jsou nejvíc vydělávající výrobci? Použijte pohled vwStateManufacturer.
Příklad č. 10: Ve kterých státech jsou nejvyšší tržby? Opět využijte pohled vwStateManufacturer.

![alt text](<ERDiagram.png>)

### LEFT JOIN
- vybere z tabulky, která je nalevo ve výrazu pro spojení a z pravé tabulky vybere
požadovaná data, pokud existuje spojení –
protějšek, pokud ne, budou přiřazeny hodnoty
NULL.

**Zadání:** Které výrobky výrobce VanARsdel se vůbec nepordaly?
```sql
SELECT m.manufacturer, p.product, s.units
from product p
left join sales s on p.ProductID = s.ProductID
JOIN manufacturer m on p.ManufacturerID = m.ManufacturerID
where m.Manufacturer = 'VanArsdel' AND s.units ISNULL;
```

**Zadání:** Jaká byla výše příjmů v roce 2015 v jednotlivých měsících? Zajímají nás všechny měsíce (i ty, kde nenastaly žádné příjmy). Výstup seřaďte podle měsíců v roce.
```sql
SELECT d.MonthName, SUM(s.Revenue) AS total_revenue
FROM date d
LEFT JOIN sales s ON s.Date = d.Date
WHERE d.Year = '2015'
GROUP BY d.MonthName
ORDER BY d.MonthNo
```

**Zadání:** Kolik různorodých produktů se prodalo v každém z měst? Zobrazte i města, kde se neprodal žádný výrobek.
```sql
SELECT c.City, COUNT(DISTINCT s.ProductID) 
FROM Country c
LEFT JOIN Sales s ON c.Zip = s.Zip
GROUP BY c.City
ORDER BY COUNT(DISTINCT s.ProductID);
```

### RIGHT JOIN
- vybere z tabulky, která je napravo ve výrazu pro spojení, všechny záznamy a z levé tabulky vybere požadovaná data, pokud existuje spojení (protějšek)
- pokud neexistuje, budou přiřazeny hodnoty NULL
- každý RIGHT JOIN můžeme přepsat na LEFT JOIN a naopak

### FULL JOIN
- podobný INNER JOIN, ale na rozdíl od INNER JOIN vrací z obou tabulek všechny záznamy; ne jen ty, u kterých existuje shoda
- u záznamů, u kterých neexistuje shoda, bud v příslušných sloupcích
hodnota NULL
- je to tedy kombinace LEFT a RIGHT JOINů

### CROSS JOIN
- CROSS JOIN je vlastně tzv. kartézský součin/spojení
- záznam z první tabulky spojíme se všemi záznamy z druhé tabulky
- toto provedeme pro všechny záznamy z první tabulky
- výsledkem je tabulka/množina všech možných kombinací řádků z obou
tabulek
- u CROSS JOIN se neuvádí podmínka spojení ON, je vlastně zbytečná

## WIEWs
- jsou to taková „kukátka“ do dat v databázi
- v podstatě jde o uložené dotazy
- pohled sám o sobě neobsahuje žádná data
- výsledkem pohledu je tabulka
- data pomocí pohledu získáváme tak, že uděláme dotaz/SELECT nad tímto pohledem
- s pohledy lze pracovat téměř stejně jako s tabulkami – SELECT, JOIN apod.
- DML příkazy vedoucí ke změně dat (INSERT, UPDATE, DELETE) však mají určitá omezení.

**Zadání:** Které výrobky (ProductID, název produktu) se vůbec neprodaly?
- Nejprve si vytvořím SELECT.
```sql
SELECT p.ProductID, p.Product, S.Units
FROM Product p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
WHERE s.Units ISNULL;
```

- Poté postavím View
```sql
CREATE VIEW vwNeprodaneProdukty AS
SELECT p.ProductID, p.Product, S.Units
FROM Product p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
WHERE s.Units ISNULL;
```
