SELECT logo
FROM manufacturer;

SELECT zip, units, revenue
FROM sales;

--vyber všechny sloupce z tab. product
SELECT *
FROM product;

--vyber sloupce produktid a product z tab. product
SELECT productid, product
FROM product;

--produkt, currency a prince do češtiny
SELECT product AS 'Produkt', price AS 'Cena', currency AS 'Měna'
FROM product;

-- vypíše pouze jedinečné záznamy
SELECT DISTINCT category
FROM product;

--vypiš prvních 10 záznamů z tabulky sales
SELECT *
FROM sales
LIMIT 10;

-- první 3 výrobci ze seznamu výrobců
SELECT manufacturer
FROM manufacturer
LIMIT 3;

-- vybrat výrobce a seřadit je sestupně
SELECT manufacturer
FROM manufacturer
ORDER BY manufacturer DESC;

-- výrobce od A po Z
SELECT manufacturer
FROM manufacturer
ORDER BY manufacturer;

/*Vyber jedinečné Regiony z tabulky Country (aby tam žádný region
nebyl dvakrát) a zobraz pouze první záznam.*/
SELECT DISTINCT region
FROM country
LIMIT 1;

/*Vyber všechny sloupce z tabulky Sales a seřaď výsledky sestupně
dle výše Revenue. V předcházejícím dotazu omez výsledek na pouze 5 řádků.*/
SELECT *
FROM sales
ORDER BY revenue DESC
LIMIT 5;

-- všechny výrobky id 428
SELECT *
FROM product
WHERE productid = 428;

-- AND
SELECT *
FROM product
WHERE category = 'Urban' AND pricenew > 1000;

-- OR
SELECT *
FROM product
WHERE category = 'Urban' OR pricenew > 1000;

-- cena mezi 1000 - 1200 (BETWEEN)
SELECT *
FROM product
WHERE pricenew BETWEEN 1000 AND 1200;

-- výrobce Abbas
SELECT *
FROM manufacturer
WHERE manufacturer = 'Abbas';

-- LIKE
SELECT *
FROM product
WHERE product LIKE 'abbas MA___';

-- prodeje za leden 2013 (2012-01% - 2013-01-__)
SELECT *
FROM sales
WHERE date LIKE '2013-01%';

-- přejmenuj:
-- productid na kód produktu
-- product na nazve produktu
-- price new na cena
-- vybrat produkty nad 400$, jen 50 záznamů
SELECT productid AS 'Kód produktu', product AS 'Název produktu', pricenew AS 'Cena'
FROM product
WHERE pricenew > 400
LIMIT 50;

-- Co všechno jsme prodali (Sales) za rok 2014 (řádky tabulky Sales)?
-- výsledky seřaďte sestupně podle data prodeje (sloupec Date)
SELECT *
FROM sales
WHERE date LIKE '2014%'
ORDER BY date DESC;

--zjistit rok a jméno měsíce
----kdy rok je mezi 2013 a 2015
----měsíc začíná na písmeno 'J' nebo obsahuje písmeno 'a'.
--pracovat s tabulkou date
SELECT DISTINCT Year, MonthName
FROM Date
WHERE Year BETWEEN 2013 AND 2015
	AND (MonthName LIKE 'J%' OR MonthName LIKE '%a%');

-- pokračování v GitHubu

--součet pricenew
SELECT SUM(pricenew)
FROM product;

--součet cen za kategorie
SELECT category, SUM(pricenew)
FROM product
GROUP BY category;

--celkové tržby za rok 2014
SELECT SUM(revenue)
FROM sales
WHERE date LIKE '2014%';

--průměrná tržba za 1 prodej v lichých letech
SELECT AVG(revenue)
from sales 
where date like '2013%' OR date like '2015%'; --WHERE date >: '2013-01-01' AND < '2014-01-01') OR (date >='2015-01-01' AND < '2016-01-01')

--Který produkt (Productid) měl v roce 2014 největší tržby?
SELECT ProductID, SUM(Revenue)
FROM Sales
WHERE Date >= '2014-01-01' AND Date < '2015-01-01'
GROUP BY ProductID
ORDER BY SUM(Revenue) DESC;

--Kolik máme produktů v kategorii Rural? Výsledný sloupec přejmenujte na „ProductCount“.
SELECT COUNT(productid) AS ProductCount
FROM product
WHERE category = 'Rural'

--Průměrná cena (výsledek přejmenujte na „Prum_cena“) za kategorii?
--Zajímají nás pouze ceny větší jak 0 a kategorie Mix a Urban.
SELECT category, AVG(pricenew) AS Prum_cena
FROM product
WHERE pricenew > 0 AND category IN ('Mix', 'Urban')
GROUP BY category;

--HAVING
-- produkty, jejichž celkové tržby přesáhli 10 miliónů
SELECT productid, sum(revenue) AS 'Trzby'
from sales
GROUP by productid
having Trzby > 10000000
ORDER by Trzby DESC;

--bez aliasu
seleCT productid, sum(revenue)
from sales
GROUP by productid
having sum(revenue) > 10000000
ORDER by sum(revenue) DESC;

--Čeho jsme prodali v roce 2013 nejvíc - počet kusů.
--Zajímají nás produkty, kterých jsme prodali více jak 5000.
SELECT ProductID, SUM(Units) AS Pocet_kusu
FROM Sales
WHERE date LIKE '2013%'
GROUP BY ProductID
HAVING SUM(Units) > 5000
ORDER BY Pocet_kusu DESC;

--Kterých 10 výrobců má nejvíce různorodých kategorií výrobků?
SELECT manufacturerid, COUNT(DISTINCT category) AS 'Pocet_kategorii'
from product
group by manufacturerid
ORDER by Pocet_kategorii DESC
LIMIT 10;

--ve které kategorii je nejvíce výrobků
SELECT Category, COUNT(productid)
FROM product
GROUP BY Category
ORDER BY COUNT(productid) DESC
LIMIT 1;

SELECT productid, AVG(revenue)
from sales
GROUP by productid
ORDER by AVG(revenue) DESC;

SELECT productid, AVG(revenue)
FROM sales
WHERE date LIKE '2013%' AND units >=5
GROUP BY productid
ORDER BY sum(revenue) DESC
LIMIT 1;

--ve kterém segmentu působí nejvíce výrobců
SELECT Segment, COUNT(DISTINCT manufacturerid) AS pocet_vyrobcu
FROM product
GROUP BY Segment
ORDER BY pocet_vyrobcu DESC;

SELECT * FROM country
WHERE 1=1
AND (city LIKE '_t%' OR city LIKE '%stown%')
AND region IN ('East', 'Central')
AND (District LIKE '%District #05%')
ORDER BY city;

SELECT *
from country
WHERE (region = 'Central' OR region = 'East') 
AND (city LIKE '_t%' OR city LIKE '%stown%')
AND district = 'District #05'
ORDER by city;

--Vypište města a k nim ostatní údaje z tabulky Country,
--která jsou z východního nebo centrálního regionu,
--(a zároveň) jejichž název má druhé písmeno `t`
--nebo mají ve svém názvu `stown`,
--a (zároveň) jsou z oblasti (district) `District #05`.
--Výstup seřaďte podle názvu města vzestupně.
--Pozor, v řetězci `District #05` je mezi `t` a `#` mezera.

SELECT * FROM Country
WHERE (Region = 'East' OR Region = 'Central')
	AND (City LIKE '_t%'
		OR City LIKE '%stown%')
	AND District = 'District #05'
ORDER BY City ASC;

SELECT *
FROM sales AS S
INNER JOIN Country AS C ON s.Zip = c.Zip
LIMIT 10;

--Vyber produkty, kterých bylo prodáno najednou více jak 40 kusů,
--k tomuto datu toho prodeje a počet prodaných kusů
--a z tabulky Product vyberte odpovídající název produktu.
SELECT s.ProductID, p.Product, s.Date, s.Units
FROM sales AS s
JOIN product AS p ON s.ProductID = p.ProductID
WHERE Units > 40
ORDER BY s.Units DESC;

--Zjisti TOP 100 prodejů dle tržby
--a k nim náležící informace
--z tabulky Country.
SELECT *
FROM sales AS s
JOIN Country AS c ON s.zip = c.Zip
ORDER BY s.Revenue DESC
LIMIT 100;

--Ve kterých státech jsme měli největší tržby?
SELECT c.State, SUM(s.Revenue) AS 'trzby'
FROM Country AS c
JOIN Sales AS s ON c.Zip = s.Zip
ORDER BY trzby DESC;

--Který výrobce vyrábí nejvíce různých / jedinečných výrobků?
SELECT m.Manufacturer, COUNT(p.ProductID) AS Pocet_vyrobku
FROM Manufacturer AS m
JOIN Product AS p ON m.ManufacturerID = p.ManufacturerID
GROUP BY m.Manufacturer
ORDER BY Pocet_vyrobku DESC
LIMIT 10;

--vypište seznam prodktů (název, kategorie, název výrobce), u který byla jednorázová tržba
--větší než 10 000 dolarů a dále vypiště prodeje, kdy k tomu došlo
-- sales, product, manufacturer

SELECT p.product, p.category, m.manufacturer, s.date, s.revenue
from sales s 
join product p on s.ProductID = p.ProductID
join manufacturer m on p.ManufacturerID = m.ManufacturerID
where revenue > 10000
order by p.Product;

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

--Které výrobky výrobce VanARsdel se vůbec nepordaly?
SELECT m.manufacturer, p.product, s.units
from product p
left join sales s on p.ProductID = s.ProductID
JOIN manufacturer m on p.ManufacturerID = m.ManufacturerID
where m.Manufacturer = 'VanArsdel' AND s.units ISNULL;

--Jaká byla výše příjmů v roce 2015 v jednotlivých měsících?
--Zajímají nás všechny měsíce (i ty, kde nenastaly žádné příjmy).
--Výstup seřaďte podle měsíců v roce.

SELECT d.MonthName, SUM(s.Revenue) AS total_revenue
FROM date d
LEFT JOIN sales s ON s.Date = d.Date
WHERE d.Year = '2015'
GROUP BY d.MonthName
ORDER BY d.MonthNo;

--Kolik různorodých produktů se prodalo v každém z měst?
--Zobrazte i města, kde se neprodal žádný výrobek.

SELECT c.City, COUNT(DISTINCT s.ProductID) 
FROM Country c
LEFT JOIN Sales s ON c.Zip = s.Zip
GROUP BY c.City
ORDER BY COUNT(DISTINCT s.ProductID);

CREATE VIEW vwNeprodaneProdukty AS
SELECT p.ProductID, p.Product, S.Units
FROM Product p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
WHERE s.Units ISNULL;

-- Produkty, jejichž celkové tržby přesáhly 10 milionů.
SELECT productid, SUM(revenue)
FROM sales
GROUP BY ProductID
HAVING SUM(revenue) > 10000000
ORDER BY SUM(revenue) DESC
;

--Čeho se prodalo v roce 2013 nejvíce (počet kusů).
--Zajímají nás produkty, kterých jsme prodali více jak 5000.
SELECT productid, SUM(units)
FROM sales
WHERE date LIKE '2013%'
GROUP BY productid
HAVING SUM(units) > 5000
;

--Vypište města a k nim ostatní údaje z tabulky Country,
--která jsou z východního nebo centrálního regionu,
--(a zároveň) jejichž název má druhé písmeno t
--nebo mají ve svém názvu stown,
--a (zároveň) jsou z oblasti (district) District #05.
--Výstup seřaďte podle názvu města vzestupně.
--Pozor, v řetězci District #05 je mezi t a # mezera.

SELECT *
FROM Country
WHERE (region = 'East' OR region = 'Central')
	AND (city LIKE '_t%' OR city LIKE '%stown%')
	AND district = 'District #05'
ORDER BY city DESC
;

--Vyberte ty produkty, kterých bylo najednou prodáno
--více jak 40 kusů, k tomuto datum tohoto prodeje
--a počet prodaných kusů a z tabulky Product vyberte
--odpovídající název produktu.

SELECT s.productID, p.product, s.units, s.date
FROM sales s
JOIN product p ON s.productID = p.productID
WHERE units > 40
ORDER BY s.units DESC
;

--Zjisti TOP 100 prodejů dle tržby
--a k nim náležící informace z tabulky Country.
SELECT s.revenue, c.state, c.City
FROM sales s
JOIN country c ON s.zip = c.zip
ORDER BY s.revenue DESC
LIMIT 100
;

SELECT c.city, COUNT(DISTINCT s.productID) AS Pocet_produktu
FROM country c
LEFT JOIN sales s ON s.zip = c.zip
GROUP BY c.city
ORDER BY Pocet_produktu DESC;

--Vypište produkty a jejich ID, které se vůbec nepordaly.
SELECT p.product, p.productID, s.units
FROM product p
LEFT JOIN sales s ON p.productID = s.productID
WHERE s.units ISNULL
ORDER BY p.product;

DROP VIEW vwNeprodaneProduty;

CREATE VIEW vwNeprodaneProdukty AS
SELECT p.productid, p.product, s.units, m.manufacturer
from product p
left JOIN sales s on p.ProductID = s.ProductID
JOIN manufacturer m ON p.ManufacturerID = m.ManufacturerID
WHERE s.units ISNULL;

SELECT product, manufacturer
FROM vwNeprodaneProdukty
WHERE manufacturer = 'Fama';

CREATE VIEW vwTrzbyStatVyrobce AS
SELECT c.state, m.manufacturer, SUM(s.revenue) AS Trzby
from sales s 
join country c on s.Zip = c.Zip
JOIN product p on s.ProductID = p.ProductID
JOIN manufacturer m on p.ManufacturerID = m.ManufacturerID
GROUP by c.state, m.Manufacturer;

SELECT *
FROM vwTrzbyStatVyrobce
ORDER BY Trzby DESC
LIMIT 10;

DROP VIEW vwTrzbyStatVyrobce;

CREATE VIEW vwTrzbyStatVyrobce AS
SELECT c.state, m.manufacturer, SUM(s.revenue) AS 'TotalRevenue'
from sales s 
join country c on s.Zip = c.Zip
JOIN product p on s.ProductID = p.ProductID
JOIN manufacturer m on p.ManufacturerID = m.ManufacturerID
GROUP by c.state, m.Manufacturer;

SELECT manufacturer, SUM(TotalRevenue)
FROM vwTrzbyStatVyrobce
GROUP BY manufacturer
ORDER BY SUM(TotalRevenue) DESC;

SELECT state, SUM(TotalRevenue)
from vwTrzbyStatVyrobce
GROUP BY state
ORDER BY SUM(TotalRevenue) DESC;

--Vytvořte pohled s názvem vwCatalog, který zobrazí
--katalog produktů (ProductId, název produktu a jeho cenu)
--a jejich výrobce.
CREATE VIEW vwCatalog AS
SELECT p.productID, p.product, p.pricenew, m.manufacturer
FROM product p
JOIN manufacturer m ON p.ManufacturerID = m.ManufacturerID;

SELECT manufacturer, product, SUM(pricenew)
FROM vwCatalog
GROUP BY manufacturer
;

--výrobky, kde se prodalo více jak 50 ks
SELECT p.productID, vwCatalog.product, s.units AS Pocet_prodeju
FROM vwCatalog
JOIN sales s ON vwCatalog.productID = s.productID
WHERE s.units > 50
GROUP BY p.productID
ORDER BY Pocet_prodeju DESC
;

--vyberte výrobky, kde se prodalo více jak 50 kusů, za použitím vwCatalog
SELECT ID, NazevProduktu, s.Units
FROM vwCatalog 
join sales s on vwCatalog.ID = s.ProductID
WHERE s.units > 50;

SELECT vw.ID, vw.NazevProduktu, vw.Cena, SUM(s.Units)
from vwCatalog vw
join sales s on s.ProductID = vw.ID
group by ID
HAVING SUM(s.Units) > 50
ORDER by SUM(s.Units);

--Vyberte všechny výrobce, jejichž název je dlouhý 5 znaků.
SELECT *
FROM manufacturer
WHERE LENGTH(manufacturer) = 5;

--Nahraďte v názvech výrobce řetězec US na USS.
SELECT REPLACE(manufacturer, 'US', 'USS')
FROM manufacturer;

--Nahraďte USD na EUR v tabulce product.
SELECT product, pricenew, REPLACE(currency, 'USD', 'EUR')
FROM product;

SELECT *
FROM manufacturer
WHERE SUBSTR(manufacturer, 1, 2) = 'Va';

--Vyberte všechny výrobce, jejichž název je delší než 4 znaky a mají v názvu písmeno i nebo r.
SELECT *
FROM manufacturer
WHERE LENGTH(manufacturer) > 4
	AND (manufacturer LIKE '%i%' OR manufacturer LIKE '%r%');

--Produkty dle cenov kategorie levné do 100,
--střední 100 - 500, drahé váce jak 500.
SELECT productID, product, pricenew,
CASE
	WHEN pricenew < 100 THEN 'levné'
	WHEN pricenew >= 100 AND pricenew < 500 THEN 'střední cena'
	WHEN pricenew >= 500 THEN 'drahé'
END AS 'cenovaKategorie'
FROM product;

--Zobrazte číslo a název mesíce,
--vytvořte nový sloupec s ročním obdobím.
SELECT *
FROM date;

CREATE VIEW vwRocniObdobi AS
SELECT DISTINCT monthno, monthname,
CASE
	WHEN monthno IN (12, 1, 2) THEN 'zima'
	WHEN monthno IN (3, 4, 5) THEN 'jaro'
	WHEN monthno IN (6, 7, 8) THEN 'léto'
	WHEN monthno IN (9, 10, 11) THEN 'podzim'
END AS 'RocniObdobi'
FROM date;

CREATE TABLE Gift(
giftID NUMERIC PRIMARY KEY,
gift TEXT(50),
date DATETIME,
manufacturerID NUMERIC
);

SELECT *
FROM Gift;

INSERT INTO Gift(giftID, gift, date, manufacturerID)
VALUES (1, 'LEGO', '2025-11-03', 23);

SELECT *
FROM Gift;

INSERT INTO Gift(giftID, gift, date, manufacturerID)
VALUES (1, 'LEGO', '2025-11-03', 23);
INSERT INTO Gift(giftID, gift, date, manufacturerID)
VALUES (3, 'book', '2025-11-05', 5), (4, 'game', '2025-11-10', 12);

ALTER TABLE Gift ADD COLUMN units NUMERIC;

CREATE table catalog AS
SELECT p.productid AS 'ID', p.product AS 'NazevProduktu', p.pricenew AS 'Cena', m.manufacturer AS 'Vyrobce'
from product p 
JOIN manufacturer m ON p.ManufacturerID = m.ManufacturerID;

UPDATE catalog
SET vyrobce = 'Abul'
WHERE vyrobce = `Abbas`;

-- Vytvořte tabulku zákazníků, např. s názvem Customers,
-- se sloupci identifikujícími zákazníka
-- a vložte údaje o 3 zákaznících.
CREATE TABLE student(
studentID NUMERIC PRIMARY KEY,
name TEXT(20),
grade NUMERIC
);

ALTER TABLE student RENAME COLUMN grade TO cs_grade;

INSERT INTO student(studentID, name, cs_grade)
VALUES
	(1, 'Anna', 1),
	(2, 'Boris', 2),
	(3, 'Cecilie', 3),
	(4, 'David', 2),
	(5, 'Eva', 1),
	(6, 'Filip', 3)
;

SELECT *
FROM student;

CREATE TABLE teacher(
techerID NUMERIC PRIMARY KEY,
name TEXT(20),
grade NUMERIC
);

SELECT m.manufacturer, SUM(s.revenue) AS total_revenue
FROM product p
JOIN manufacturer m ON m.manufacturerID = p.manufacturerID
JOIN sales s ON p.productID = s.productID
JOIN country c ON c.zip = s.zip
WHERE s.date >= '2013-01-01'
    AND s.date < '2014-01-01'
    AND c.region = 'East'
GROUP BY m.manufacturer
HAVING SUM(s.revenue) > 4000000
;

SELECT p.product, m.manufacturer, s.revenue, c.region
FROM product p
JOIN manufacturer m ON m.manufacturerID = p.manufacturerID
JOIN sales s ON p.productID = s.productID
JOIN country c ON c.zip = s.zip
WHERE s.date >= '2013-01-01'
    AND s.date < '2014-01-01'
    AND c.region = 'East'
GROUP BY m.manufacturer
HAVING SUM(s.revenue) > 4000000;
